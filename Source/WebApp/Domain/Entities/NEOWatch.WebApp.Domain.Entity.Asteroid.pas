unit NEOWatch.WebApp.Domain.Entity.Asteroid;

interface

uses
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf;

type

  TAsteroid = class(TInterfacedObject, IAsteroid)
  private
    FId: string;
    FName: string;
    FNasaJplUrl: string;
    FAbsoluteMagnitude: extended;
    FDiameterMinKm: extended;
    FDiameterMaxKm: extended;
    FIsPotentiallyHazardous: Boolean;
    FIsSentryObject: Boolean;
    FCloseApproachDate: TDateTime;
    FMinDistanceKm: extended;
    FRelativeVelocityKmH: extended;

  public
    function Id: string;
    function Name: string;
    function NasaJplUrl: string;

    function AbsoluteMagnitude: extended;

    function DiameterMinKm: extended;
    function DiameterMaxKm: extended;
    function DiameterAverageKm: extended;

    function IsPotentiallyHazardous: Boolean;
    function IsSentryObject: Boolean;

    function CloseApproachDate: TDateTime;
    function MinDistanceKm: extended;
    function RelativeVelocityKmH: extended;

    procedure SetId(const Value: string);
    procedure SetName(const Value: string);
    procedure SetNasaJplUrl(const Value: string);

    procedure SetAbsoluteMagnitude(const Value: extended);

    procedure SetDiameterMinKm(const Value: extended);
    procedure SetDiameterMaxKm(const Value: extended);

    procedure SetIsPotentiallyHazardous(const Value: Boolean);
    procedure SetIsSentryObject(const Value: Boolean);

    procedure SetCloseApproachDate(const Value: TDateTime);
    procedure SetMinDistanceKm(const Value: extended);
    procedure SetRelativeVelocityKmH(const Value: extended);

  end;
implementation

function TAsteroid.Id: string;
begin
  Result := FId;
end;

function TAsteroid.Name: string;
begin
  Result := FName;
end;

function TAsteroid.NasaJplUrl: string;
begin
  Result := FNasaJplUrl;
end;

function TAsteroid.AbsoluteMagnitude: extended;
begin
  Result := FAbsoluteMagnitude;
end;

function TAsteroid.DiameterMinKm: extended;
begin
  Result := FDiameterMinKm;
end;

function TAsteroid.DiameterMaxKm: extended;
begin
  Result := FDiameterMaxKm;
end;

function TAsteroid.DiameterAverageKm: extended;
begin
  Result := (FDiameterMinKm + FDiameterMaxKm) / 2;
end;

function TAsteroid.IsPotentiallyHazardous: Boolean;
begin
  Result := FIsPotentiallyHazardous;
end;

function TAsteroid.IsSentryObject: Boolean;
begin
  Result := FIsSentryObject;
end;

function TAsteroid.CloseApproachDate: TDateTime;
begin
  Result := FCloseApproachDate;
end;

function TAsteroid.MinDistanceKm: extended;
begin
  Result := FMinDistanceKm;
end;

function TAsteroid.RelativeVelocityKmH: extended;
begin
  Result := FRelativeVelocityKmH;
end;

procedure TAsteroid.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TAsteroid.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TAsteroid.SetNasaJplUrl(const Value: string);
begin
  FNasaJplUrl := Value;
end;

procedure TAsteroid.SetAbsoluteMagnitude(const Value: extended);
begin
  FAbsoluteMagnitude := Value;
end;

procedure TAsteroid.SetDiameterMinKm(const Value: extended);
begin
  FDiameterMinKm := Value;
end;

procedure TAsteroid.SetDiameterMaxKm(const Value: extended);
begin
  FDiameterMaxKm := Value;
end;

procedure TAsteroid.SetIsPotentiallyHazardous(const Value: Boolean);
begin
  FIsPotentiallyHazardous := Value;
end;

procedure TAsteroid.SetIsSentryObject(const Value: Boolean);
begin
  FIsSentryObject := Value;
end;

procedure TAsteroid.SetCloseApproachDate(const Value: TDateTime);
begin
  FCloseApproachDate := Value;
end;

procedure TAsteroid.SetMinDistanceKm(const Value: extended);
begin
  FMinDistanceKm := Value;
end;

procedure TAsteroid.SetRelativeVelocityKmH(const Value: extended);
begin
  FRelativeVelocityKmH := Value;
end;

end.
