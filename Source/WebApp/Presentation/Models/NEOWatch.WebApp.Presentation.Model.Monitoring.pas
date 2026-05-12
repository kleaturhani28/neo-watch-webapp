unit NEOWatch.WebApp.Presentation.Model.Monitoring;

interface

uses
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidFilters,
  NEOWatch.WebApp.Presentation.Model.DTO.SMonitoring,
  NEOWatch.WebApp.Presentation.Model.Monitoring.Intf,
  Fido.Mappers,
  Fido.Utilities,
  System.Generics.Collections,
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidCard,
  NEOWatch.WebApp.Domain.Entity.Monitoring.Intf,
  System.SysUtils,
  NEOWatch.WebApp.Domain.MonitoringRepository.Intf,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf,
  System.DateUtils,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters,
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf;

type

  TModelMonitoring = class(TInterfacedObject, IModelMonitoring)
  private
    FMonitoringRepository: IMonitoringRepository;

    function ToDateValue(const Value: string; const DefaultValue: TDate): TDate;
    function ToHazardousFilter(const Value: string): TNeoHazardousFilter;
    function ToSortBy(const Value: string): TNeoSortBy;
    function ToSortDirection(const Value: string): TNeoSortDirection;

  public
    function GetDefaultList: TSMonitoringDTO;
    function GetListByFilters(const Filters: TSAsteroidFiltersDTO): TSMonitoringDTO;

    constructor Create(const MonitoringRepository: IMonitoringRepository);
  end;

implementation

constructor TModelMonitoring.Create(const MonitoringRepository: IMonitoringRepository);
begin
  inherited Create;
  FMonitoringRepository := Utilities.CheckNotNullAndSet(MonitoringRepository, 'MonitoringRepository');
end;

function TModelMonitoring.GetDefaultList: TSMonitoringDTO;
var
  Monitoring: IMonitoring;
begin
  Result := TSMonitoringDTO.Create;

  try
    Monitoring := FMonitoringRepository.GetDefaultList;

    Mappers.Map(Monitoring, Result);
  except
    on E: Exception do begin
      Result.HasError := True;
      Result.ErrorMessage := E.Message;

      Result.Summary.HasResults := False;
      Result.Summary.TotalCount := 0;
      Result.Summary.TotalCountText := '0';
      Result.Summary.DangerousCount := 0;
      Result.Summary.DangerousCountText := '0';
      Result.Summary.SafeCount := 0;
      Result.Summary.SafeCountText := '0';
      Result.Summary.SummaryMessage := 'Errore durante il caricamento degli asteroidi';
      Result.Summary.SummaryTrendClass := 'trend-danger';
      Result.Summary.CacheStatusText := 'Errore';
      Result.Summary.CacheBadgeClass := 'trend-danger';
      Result.Summary.CacheDescription := E.Message;
    end;
  end;

end;

function TModelMonitoring.GetListByFilters(const Filters: TSAsteroidFiltersDTO): TSMonitoringDTO;
var
  DomainFilters: IAsteroidFilters;
  Monitoring: IMonitoring;
  StartDateValue: TDate;
  EndDateValue: TDate;
begin
  Result := TSMonitoringDTO.Create;

  try
    StartDateValue := ToDateValue(Filters.StartDate, Date - 7);
    EndDateValue := ToDateValue(Filters.EndDate, Date);

    DomainFilters :=
        TAsteroidFilters.Create(
            StartDateValue,
            EndDateValue,
            ToHazardousFilter(Filters.Hazardous),
            ToSortBy(Filters.SortBy),
            ToSortDirection(Filters.SortDirection)
        );

    Monitoring := FMonitoringRepository.GetListByFilters(DomainFilters);

    Mappers.Map(Monitoring, Result);

    Result.Filters.StartDate := FormatDateTime('yyyy-mm-dd', StartDateValue);
    Result.Filters.EndDate := FormatDateTime('yyyy-mm-dd', EndDateValue);
    Result.Filters.Hazardous := Filters.Hazardous;
    Result.Filters.SortBy := Filters.SortBy;
    Result.Filters.SortDirection := Filters.SortDirection;
  except
    on E: Exception do begin
      Result.HasError := True;
      Result.ErrorMessage := E.Message;

      Result.Summary.HasResults := False;
      Result.Summary.TotalCount := 0;
      Result.Summary.TotalCountText := '0';
      Result.Summary.DangerousCount := 0;
      Result.Summary.DangerousCountText := '0';
      Result.Summary.SafeCount := 0;
      Result.Summary.SafeCountText := '0';
      Result.Summary.SummaryMessage := 'Errore durante il caricamento degli asteroidi';
      Result.Summary.SummaryTrendClass := 'trend-danger';
      Result.Summary.CacheStatusText := 'Errore';
      Result.Summary.CacheBadgeClass := 'trend-danger';
      Result.Summary.CacheDescription := E.Message;
    end;
  end;

end;

function TModelMonitoring.ToDateValue(const Value: string; const DefaultValue: TDate): TDate;
var
  FormatSettings: TFormatSettings;
  ParsedDate: TDateTime;
begin
  Result := DefaultValue;

  if Value.Trim.IsEmpty then
    Exit;

  FormatSettings := TFormatSettings.Create;
  FormatSettings.DateSeparator := '-';
  FormatSettings.ShortDateFormat := 'yyyy-mm-dd';

  if TryStrToDate(Value, ParsedDate, FormatSettings) then
    Result := DateOf(ParsedDate);
end;

function TModelMonitoring.ToHazardousFilter(const Value: string): TNeoHazardousFilter;
begin
  if SameText(Value, 'dangerous') then
    Exit(nhfDangerous);

  if SameText(Value, 'safe') then
    Exit(nhfSafe);

  Result := nhfAll;
end;

function TModelMonitoring.ToSortBy(const Value: string): TNeoSortBy;
begin
  if SameText(Value, 'size') then
    Exit(nsbSize);

  Result := nsbDistance;
end;

function TModelMonitoring.ToSortDirection(const Value: string): TNeoSortDirection;
begin
  if SameText(Value, 'desc') then
    Exit(nsdDesc);

  Result := nsdAsc;
end;

initialization

  Mappers.RegisterMapper<IAsteroid, TSAsteroidCardDTO>(
      procedure(const Source: IAsteroid; var Destination: TSAsteroidCardDTO)
      begin
        Destination.Id := Source.Id;
        Destination.Name := Source.Name;
        Destination.NasaJplUrl := Source.NasaJplUrl;

        Destination.IsPotentiallyHazardous := Source.IsPotentiallyHazardous;

        Destination.MinDistanceKm := Source.MinDistanceKm;
        Destination.MinDistanceKmText := FormatFloat('#,##0', Source.MinDistanceKm) + ' km';

        Destination.EstimatedDiameterMinMeters := Source.DiameterMinKm * 1000;
        Destination.EstimatedDiameterMaxMeters := Source.DiameterMaxKm * 1000;

        Destination.DiameterText :=
            FormatFloat('#,##0.00', Source.DiameterMinKm * 1000)
                + ' - '
                + FormatFloat('#,##0.00', Source.DiameterMaxKm * 1000)
                + ' m';

        Destination.RelativeVelocityKmH := Source.RelativeVelocityKmH;
        Destination.RelativeVelocityText := FormatFloat('#,##0', Source.RelativeVelocityKmH) + ' km/h';

        Destination.CloseApproachDate := Source.CloseApproachDate;

        if Source.CloseApproachDate > 0 then
          Destination.CloseApproachDateText := FormatDateTime('yyyy-mm-dd', Source.CloseApproachDate)
        else
          Destination.CloseApproachDateText := '--';

        if Source.IsPotentiallyHazardous then begin
          Destination.HazardousLabel := 'Dangerous';
          Destination.HazardousCssClass := 'risk-badge risk-danger';
          Destination.AsteroidCardCssClass := 'asteroid-card dangerous';
        end
        else begin
          Destination.HazardousLabel := 'Safe';
          Destination.HazardousCssClass := 'risk-badge risk-safe';
          Destination.AsteroidCardCssClass := 'asteroid-card';
        end;
      end
  );

  Mappers.RegisterMapper<IMonitoring, TSMonitoringDTO>(
      procedure(const Source: IMonitoring; var Destination: TSMonitoringDTO)
      var
        Asteroid: IAsteroid;
        AsteroidDTO: TSAsteroidCardDTO;
      begin
        Destination.HasError := Source.HasError;
        Destination.ErrorMessage := Source.ErrorMessage;

        Destination.Summary.TotalCount := Source.TotalCount;
        Destination.Summary.TotalCountText := Source.TotalCount.ToString;

        Destination.Summary.DangerousCount := Source.DangerousCount;
        Destination.Summary.DangerousCountText := Source.DangerousCount.ToString;

        Destination.Summary.SafeCount := Source.SafeCount;
        Destination.Summary.SafeCountText := Source.SafeCount.ToString;

        Destination.Summary.HasResults := Source.TotalCount > 0;

        if Destination.Summary.HasResults then begin
          Destination.Summary.SummaryMessage := 'Risultati caricati';
          Destination.Summary.SummaryTrendClass := 'trend-good';
        end
        else begin
          Destination.Summary.SummaryMessage := 'Nessun asteroide trovato';
          Destination.Summary.SummaryTrendClass := 'trend-warn';
        end;

        Destination.Summary.CacheStatusText := 'NASA API';
        Destination.Summary.CacheBadgeClass := 'trend-good';
        Destination.Summary.CacheDescription := 'Dati caricati tramite backend Delphi';

        Destination.Asteroids.Clear;

        for Asteroid in Source.Asteroids do begin
          AsteroidDTO := TSAsteroidCardDTO.Create;

          Mappers.Map(Asteroid, AsteroidDTO);

          Destination.Asteroids.Add(AsteroidDTO);
        end;

        if Destination.Asteroids.Count > 0 then
          Destination.SelectedAsteroid := Destination.Asteroids[0];
      end
  );

end.
