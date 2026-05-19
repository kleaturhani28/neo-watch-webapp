unit NEOWatch.WebApp.Persistence.Repository.Monitoring;

interface

uses
  Fido.Utilities,
  NEOWatch.WebApp.Domain.MonitoringRepository.Intf,
  NEOWatch.WebApp.Domain.Entity.Monitoring.Intf,
  NEOWatch.WebApp.Domain.Entity.Monitoring,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf,
  NEOWatch.WebApp.Persistence.Gateway.NasaApi.Intf,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters,
  System.SysUtils,
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf,
  JOSE.Types.JSON,
  Spring.Collections,
  Fido.Mappers,
  System.DateUtils,
  NEOWatch.WebApp.Domain.Entity.Asteroid,
  Spring.Comparers,
  NEOWatch.WebApp.Domain.NasaCache.Intf;

type

  TMonitoringRepository = class(TInterfacedObject, IMonitoringRepository)
  private
    FGetFeedNasaNeoWsCommandApi: IGetFeedNasaNeoWsCommandApi;
    FNasaCache: INasaCache;
  public
    function GetDefaultList: IMonitoring;
    function GetListByFilters(const Filters: IAsteroidFilters): IMonitoring;

    constructor Create(const GetFeedNasaNeoWsCommandApi: IGetFeedNasaNeoWsCommandApi; const NasaCache: INasaCache);
  end;

implementation

constructor TMonitoringRepository.Create(
    const GetFeedNasaNeoWsCommandApi: IGetFeedNasaNeoWsCommandApi;
    const NasaCache: INasaCache
);
begin
  inherited Create;
  FGetFeedNasaNeoWsCommandApi := Utilities.CheckNotNullAndSet(GetFeedNasaNeoWsCommandApi, 'GetFeedNasaNeoWsCommandApi');
  FNasaCache := Utilities.CheckNotNullAndSet(NasaCache, 'NasaCache');
end;

function TMonitoringRepository.GetDefaultList: IMonitoring;
var
  Filters: IAsteroidFilters;
begin
  Filters := TAsteroidFilters.Create(Date, Date, nhfAll, nsbDistance, nsdAsc);

  Result := GetListByFilters(Filters);
end;

function TMonitoringRepository.GetListByFilters(const Filters: IAsteroidFilters): IMonitoring;
var
  CurrentStartDate: TDate;
  CurrentEndDate: TDate;
  StartDateText: string;
  EndDateText: string;
  CacheKey: string;
  ResponseJson: string;

  Root: TJSONObject;
  NearEarthObjects: TJSONObject;
  DatePair: TJSONPair;
  AsteroidsArray: TJSONArray;
  AsteroidJson: TJSONObject;

  Asteroid: IAsteroid;
  Asteroids: IList<IAsteroid>;
  FinalMonitoring: IMonitoring;

  Index: Integer;
  DangerousCount: Integer;
  SafeCount: Integer;

  Value: TJSONValue;
begin
  if not Assigned(Filters) then
    raise Exception.Create('Asteroid filters are required.');

  if Filters.StartDate > Filters.EndDate then
    raise Exception.Create('Start date cannot be greater than end date.');

  Asteroids := TCollections.CreateList<IAsteroid>;

  CurrentStartDate := Filters.StartDate;

  while CurrentStartDate <= Filters.EndDate do begin
    CurrentEndDate := IncDay(CurrentStartDate, 6);

    if CurrentEndDate > Filters.EndDate then
      CurrentEndDate := Filters.EndDate;

    StartDateText := FormatDateTime('yyyy-mm-dd', CurrentStartDate);
    EndDateText := FormatDateTime('yyyy-mm-dd', CurrentEndDate);

    CacheKey := Format('neowatch.webapp::feed::%s::%s', [StartDateText, EndDateText]);

    if not FNasaCache.TryGet(CacheKey, ResponseJson) then begin
      ResponseJson := FGetFeedNasaNeoWsCommandApi.Execute(StartDateText, EndDateText);

      FNasaCache.SetValue(CacheKey, ResponseJson, 21600);
    end;

    Root := TJSONObject.ParseJSONValue(ResponseJson) as TJSONObject;
    try
      if not Assigned(Root) then
        raise Exception.Create('Invalid NASA feed JSON.');

      Value := Root.GetValue('near_earth_objects');

      if not (Value is TJSONObject) then
        raise Exception.Create('Missing near_earth_objects in NASA feed JSON.');

      NearEarthObjects := TJSONObject(Value);

      for DatePair in NearEarthObjects do begin
        if not (DatePair.JsonValue is TJSONArray) then
          Continue;

        AsteroidsArray := TJSONArray(DatePair.JsonValue);

        for Index := 0 to AsteroidsArray.Count - 1 do begin
          if not (AsteroidsArray.Items[Index] is TJSONObject) then
            Continue;

          AsteroidJson := TJSONObject(AsteroidsArray.Items[Index]);

          Asteroid := nil;

          Mappers.Map<TJSONObject, IAsteroid>(AsteroidJson, Asteroid);

          if Trunc(Asteroid.CloseApproachDate) < Trunc(Filters.StartDate) then
            Continue;

          if Trunc(Asteroid.CloseApproachDate) > Trunc(Filters.EndDate) then
            Continue;

          case Filters.HazardousFilter of
            nhfDangerous: begin
              if Asteroid.IsPotentiallyHazardous then
                Asteroids.Add(Asteroid);
            end;

            nhfSafe: begin
              if not Asteroid.IsPotentiallyHazardous then
                Asteroids.Add(Asteroid);
            end;
          else
            Asteroids.Add(Asteroid);
          end;
        end;
      end;
    finally
      Root.Free;
    end;

    CurrentStartDate := IncDay(CurrentEndDate, 1);
  end;

  Asteroids.Sort(
      function(const Left, Right: IAsteroid): Integer
      var
        LeftValue: Double;
        RightValue: Double;
      begin
        case Filters.SortBy of
          nsbSize: begin
            LeftValue := Left.DiameterAverageKm;
            RightValue := Right.DiameterAverageKm;
          end;
        else
          begin
            LeftValue := Left.MinDistanceKm;
            RightValue := Right.MinDistanceKm;
          end;
        end;

        if LeftValue < RightValue then
          Result := -1
        else if LeftValue > RightValue then
          Result := 1
        else
          Result := 0;

        if Filters.SortDirection = nsdDesc then
          Result := -Result;
      end
  );

  FinalMonitoring := TMonitoring.Create;

  DangerousCount := 0;
  SafeCount := 0;

  for Asteroid in Asteroids do begin
    FinalMonitoring.AddAsteroid(Asteroid);

    if Asteroid.IsPotentiallyHazardous then
      Inc(DangerousCount)
    else
      Inc(SafeCount);
  end;

  FinalMonitoring.SetTotalCount(Asteroids.Count);
  FinalMonitoring.SetDangerousCount(DangerousCount);
  FinalMonitoring.SetSafeCount(SafeCount);
  FinalMonitoring.SetHasError(False);
  FinalMonitoring.SetErrorMessage('');

  Result := FinalMonitoring;
end;

initialization
  Mappers.RegisterMapper<TJSONObject, IAsteroid>(
      procedure(const Source: TJSONObject; var Destination: IAsteroid)
      var
        Asteroid: IAsteroid;

        Value: TJSONValue;

        EstimatedDiameterJson: TJSONObject;
        KilometersJson: TJSONObject;

        CloseApproachArray: TJSONArray;
        CloseApproachJson: TJSONObject;
        RelativeVelocityJson: TJSONObject;
        MissDistanceJson: TJSONObject;

        DoubleValue: Double;
        ApproachDate: TDateTime;
        FormatSettings: TFormatSettings;
      begin
        Asteroid := TAsteroid.Create;

        Value := Source.GetValue('id');
        if Assigned(Value) then
          Asteroid.SetId(Value.Value);

        Value := Source.GetValue('name');
        if Assigned(Value) then
          Asteroid.SetName(Value.Value);

        Value := Source.GetValue('nasa_jpl_url');
        if Assigned(Value) then
          Asteroid.SetNasaJplUrl(Value.Value);

        Value := Source.GetValue('absolute_magnitude_h');
        if Assigned(Value) then begin
          DoubleValue := 0;
          if TryStrToFloat(Value.Value, DoubleValue, TFormatSettings.Invariant) then
            Asteroid.SetAbsoluteMagnitude(DoubleValue);
        end;

        Value := Source.GetValue('is_potentially_hazardous_asteroid');
        if Assigned(Value) then
          Asteroid.SetIsPotentiallyHazardous(SameText(Value.Value, 'true'));

        Value := Source.GetValue('is_sentry_object');
        if Assigned(Value) then
          Asteroid.SetIsSentryObject(SameText(Value.Value, 'true'));

        Value := Source.GetValue('estimated_diameter');

        if Value is TJSONObject then begin
          EstimatedDiameterJson := TJSONObject(Value);

          Value := EstimatedDiameterJson.GetValue('kilometers');

          if Value is TJSONObject then begin
            KilometersJson := TJSONObject(Value);

            Value := KilometersJson.GetValue('estimated_diameter_min');
            if Assigned(Value) then begin
              DoubleValue := 0;
              if TryStrToFloat(Value.Value, DoubleValue, TFormatSettings.Invariant) then
                Asteroid.SetDiameterMinKm(DoubleValue);
            end;

            Value := KilometersJson.GetValue('estimated_diameter_max');
            if Assigned(Value) then begin
              DoubleValue := 0;
              if TryStrToFloat(Value.Value, DoubleValue, TFormatSettings.Invariant) then
                Asteroid.SetDiameterMaxKm(DoubleValue);
            end;
          end;
        end;

        Value := Source.GetValue('close_approach_data');

        if Value is TJSONArray then begin
          CloseApproachArray := TJSONArray(Value);

          if CloseApproachArray.Count > 0 then begin
            if CloseApproachArray.Items[0] is TJSONObject then begin
              CloseApproachJson := TJSONObject(CloseApproachArray.Items[0]);

              FormatSettings := TFormatSettings.Create;
              FormatSettings.DateSeparator := '-';
              FormatSettings.ShortDateFormat := 'yyyy-mm-dd';

              Value := CloseApproachJson.GetValue('close_approach_date');
              if Assigned(Value) then begin
                if TryStrToDate(Value.Value, ApproachDate, FormatSettings) then
                  Asteroid.SetCloseApproachDate(ApproachDate);
              end;

              Value := CloseApproachJson.GetValue('relative_velocity');

              if Value is TJSONObject then begin
                RelativeVelocityJson := TJSONObject(Value);

                Value := RelativeVelocityJson.GetValue('kilometers_per_hour');
                if Assigned(Value) then begin
                  DoubleValue := 0;
                  if TryStrToFloat(Value.Value, DoubleValue, TFormatSettings.Invariant) then
                    Asteroid.SetRelativeVelocityKmH(DoubleValue);
                end;
              end;

              Value := CloseApproachJson.GetValue('miss_distance');

              if Value is TJSONObject then begin
                MissDistanceJson := TJSONObject(Value);

                Value := MissDistanceJson.GetValue('kilometers');
                if Assigned(Value) then begin
                  DoubleValue := 0;
                  if TryStrToFloat(Value.Value, DoubleValue, TFormatSettings.Invariant) then
                    Asteroid.SetMinDistanceKm(DoubleValue);
                end;
              end;
            end;
          end;
        end;

        Destination := Asteroid;
      end
  );

end.end.
