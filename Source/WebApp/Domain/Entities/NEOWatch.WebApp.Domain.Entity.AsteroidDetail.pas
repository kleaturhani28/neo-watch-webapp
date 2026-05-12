unit NEOWatch.WebApp.Domain.Entity.AsteroidDetail;

interface

uses
  Spring.Collections,
  NEOWatch.WebApp.Domain.Entity.AsteroidDetail.Intf,
  NEOWatch.WebApp.Domain.Entity.CloseApproach.Intf;

type
  TAsteroidDetail = class(TInterfacedObject, IAsteroidDetail)
  private
    FId: string;
    FName: string;
    FNasaJplUrl: string;

    FAbsoluteMagnitude: extended;

    FDiameterMinKm: extended;
    FDiameterMaxKm: extended;

    FIsPotentiallyHazardous: Boolean;
    FIsSentryObject: Boolean;

    FOrbitClassType: string;
    FOrbitClassDescription: string;
    FFirstObservationDate: string;
    FLastObservationDate: string;

    FCloseApproaches: IList<ICloseApproach>;
  public
    constructor Create;

    function Id: string;
    function Name: string;
    function NasaJplUrl: string;

    function AbsoluteMagnitude: extended;

    function DiameterMinKm: extended;
    function DiameterMaxKm: extended;
    function DiameterAverageKm: extended;

    function IsPotentiallyHazardous: Boolean;
    function IsSentryObject: Boolean;

    function OrbitClassType: string;
    function OrbitClassDescription: string;
    function FirstObservationDate: string;
    function LastObservationDate: string;

    function CloseApproaches: IReadOnlyList<ICloseApproach>;

    procedure SetId(const Value: string);
    procedure SetName(const Value: string);
    procedure SetNasaJplUrl(const Value: string);

    procedure SetAbsoluteMagnitude(const Value: extended);

    procedure SetDiameterMinKm(const Value: extended);
    procedure SetDiameterMaxKm(const Value: extended);

    procedure SetIsPotentiallyHazardous(const Value: Boolean);
    procedure SetIsSentryObject(const Value: Boolean);

    procedure SetOrbitClassType(const Value: string);
    procedure SetOrbitClassDescription(const Value: string);
    procedure SetFirstObservationDate(const Value: string);
    procedure SetLastObservationDate(const Value: string);

    procedure AddCloseApproach(const Value: ICloseApproach);
  end;

implementation

constructor TAsteroidDetail.Create;
begin
  inherited Create;

  FCloseApproaches := TCollections.CreateList<ICloseApproach>;
end;

function TAsteroidDetail.Id: string;
begin
  Result := FId;
end;

function TAsteroidDetail.Name: string;
begin
  Result := FName;
end;

function TAsteroidDetail.NasaJplUrl: string;
begin
  Result := FNasaJplUrl;
end;

function TAsteroidDetail.AbsoluteMagnitude: extended;
begin
  Result := FAbsoluteMagnitude;
end;

function TAsteroidDetail.DiameterMinKm: extended;
begin
  Result := FDiameterMinKm;
end;

function TAsteroidDetail.DiameterMaxKm: extended;
begin
  Result := FDiameterMaxKm;
end;

function TAsteroidDetail.DiameterAverageKm: extended;
begin
  Result := (FDiameterMinKm + FDiameterMaxKm) / 2;
end;

function TAsteroidDetail.IsPotentiallyHazardous: Boolean;
begin
  Result := FIsPotentiallyHazardous;
end;

function TAsteroidDetail.IsSentryObject: Boolean;
begin
  Result := FIsSentryObject;
end;

function TAsteroidDetail.OrbitClassType: string;
begin
  Result := FOrbitClassType;
end;

function TAsteroidDetail.OrbitClassDescription: string;
begin
  Result := FOrbitClassDescription;
end;

function TAsteroidDetail.FirstObservationDate: string;
begin
  Result := FFirstObservationDate;
end;

function TAsteroidDetail.LastObservationDate: string;
begin
  Result := FLastObservationDate;
end;

function TAsteroidDetail.CloseApproaches: IReadOnlyList<ICloseApproach>;
begin
  Result := FCloseApproaches.AsReadOnly;
end;

procedure TAsteroidDetail.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TAsteroidDetail.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TAsteroidDetail.SetNasaJplUrl(const Value: string);
begin
  FNasaJplUrl := Value;
end;

procedure TAsteroidDetail.SetAbsoluteMagnitude(const Value: extended);
begin
  FAbsoluteMagnitude := Value;
end;

procedure TAsteroidDetail.SetDiameterMinKm(const Value: extended);
begin
  FDiameterMinKm := Value;
end;

procedure TAsteroidDetail.SetDiameterMaxKm(const Value: extended);
begin
  FDiameterMaxKm := Value;
end;

procedure TAsteroidDetail.SetIsPotentiallyHazardous(const Value: Boolean);
begin
  FIsPotentiallyHazardous := Value;
end;

procedure TAsteroidDetail.SetIsSentryObject(const Value: Boolean);
begin
  FIsSentryObject := Value;
end;

procedure TAsteroidDetail.SetOrbitClassType(const Value: string);
begin
  FOrbitClassType := Value;
end;

procedure TAsteroidDetail.SetOrbitClassDescription(const Value: string);
begin
  FOrbitClassDescription := Value;
end;

procedure TAsteroidDetail.SetFirstObservationDate(const Value: string);
begin
  FFirstObservationDate := Value;
end;

procedure TAsteroidDetail.SetLastObservationDate(const Value: string);
begin
  FLastObservationDate := Value;
end;

procedure TAsteroidDetail.AddCloseApproach(const Value: ICloseApproach);
begin
  FCloseApproaches.Add(Value);
end;

end.
