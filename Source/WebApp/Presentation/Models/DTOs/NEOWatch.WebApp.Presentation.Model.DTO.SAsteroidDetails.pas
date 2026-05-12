unit NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidDetails;

interface

uses
  System.Generics.Collections,
  NEOWatch.WebApp.Presentation.Model.DTO.SCloseApproach;

type
  TSAsteroidDetailDTO = class
  private
    FId: string;
    FName: string;

    FMinDistanceKm: Extended;
    FEstimatedDiameterMinMeters: Extended;
    FEstimatedDiameterMaxMeters: Extended;
    FRelativeVelocityKmH: Extended;
    FCloseApproachDate: TDateTime;

    FMinDistanceKmText: string;
    FDiameterText: string;
    FRelativeVelocityText: string;
    FCloseApproachDateText: string;

    FIsPotentiallyHazardous: Boolean;
    FHazardousLabel: string;
    FHazardousCssClass: string;
    FAsteroidCardCssClass: string;

    FNasaJplUrl: string;

    FAbsoluteMagnitude: Extended;
    FAbsoluteMagnitudeText: string;

    FOrbitClassText: string;
    FOrbitId: string;
    FOrbitDeterminationDateText: string;
    FFirstObservationDateText: string;
    FLastObservationDateText: string;
    FDataArcInDaysText: string;
    FObservationsUsedText: string;

    FCloseApproaches: TObjectList<TSCloseApproachDTO>;

    FHasCloseApproaches: Boolean;
    FHasOrbitalData: Boolean;

    function GetId: string;
    function GetName: string;

    function GetMinDistanceKm: Extended;
    function GetEstimatedDiameterMinMeters: Extended;
    function GetEstimatedDiameterMaxMeters: Extended;
    function GetRelativeVelocityKmH: Extended;
    function GetCloseApproachDate: TDateTime;

    function GetMinDistanceKmText: string;
    function GetDiameterText: string;
    function GetRelativeVelocityText: string;
    function GetCloseApproachDateText: string;

    function GetIsPotentiallyHazardous: Boolean;
    function GetHazardousLabel: string;
    function GetHazardousCssClass: string;
    function GetAsteroidCardCssClass: string;

    function GetNasaJplUrl: string;

    function GetAbsoluteMagnitude: Extended;
    function GetAbsoluteMagnitudeText: string;

    function GetOrbitClassText: string;
    function GetOrbitId: string;
    function GetOrbitDeterminationDateText: string;
    function GetFirstObservationDateText: string;
    function GetLastObservationDateText: string;
    function GetDataArcInDaysText: string;
    function GetObservationsUsedText: string;

    function GetCloseApproaches: TObjectList<TSCloseApproachDTO>;

    function GetHasCloseApproaches: Boolean;
    function GetHasOrbitalData: Boolean;

    procedure SetId(const Value: string);
    procedure SetName(const Value: string);

    procedure SetMinDistanceKm(const Value: Extended);
    procedure SetEstimatedDiameterMinMeters(const Value: Extended);
    procedure SetEstimatedDiameterMaxMeters(const Value: Extended);
    procedure SetRelativeVelocityKmH(const Value: Extended);
    procedure SetCloseApproachDate(const Value: TDateTime);

    procedure SetMinDistanceKmText(const Value: string);
    procedure SetDiameterText(const Value: string);
    procedure SetRelativeVelocityText(const Value: string);
    procedure SetCloseApproachDateText(const Value: string);

    procedure SetIsPotentiallyHazardous(const Value: Boolean);
    procedure SetHazardousLabel(const Value: string);
    procedure SetHazardousCssClass(const Value: string);
    procedure SetAsteroidCardCssClass(const Value: string);

    procedure SetNasaJplUrl(const Value: string);

    procedure SetAbsoluteMagnitude(const Value: Extended);
    procedure SetAbsoluteMagnitudeText(const Value: string);

    procedure SetOrbitClassText(const Value: string);
    procedure SetOrbitId(const Value: string);
    procedure SetOrbitDeterminationDateText(const Value: string);
    procedure SetFirstObservationDateText(const Value: string);
    procedure SetLastObservationDateText(const Value: string);
    procedure SetDataArcInDaysText(const Value: string);
    procedure SetObservationsUsedText(const Value: string);

    procedure SetCloseApproaches(const Value: TObjectList<TSCloseApproachDTO>);

    procedure SetHasCloseApproaches(const Value: Boolean);
    procedure SetHasOrbitalData(const Value: Boolean);

  published
    property Id: string read GetId write FId;
    property Name: string read GetName write FName;

    property MinDistanceKm: Extended read GetMinDistanceKm write SetMinDistanceKm;
    property EstimatedDiameterMinMeters: Extended
        read GetEstimatedDiameterMinMeters write SetEstimatedDiameterMinMeters;
    property EstimatedDiameterMaxMeters: Extended
        read GetEstimatedDiameterMaxMeters write SetEstimatedDiameterMaxMeters;
    property RelativeVelocityKmH: Extended read GetRelativeVelocityKmH write SetRelativeVelocityKmH;
    property CloseApproachDate: TDateTime read GetCloseApproachDate write SetCloseApproachDate;

    property MinDistanceKmText: string read GetMinDistanceKmText write SetMinDistanceKmText;
    property DiameterText: string read GetDiameterText write SetDiameterText;
    property RelativeVelocityText: string read GetRelativeVelocityText write SetRelativeVelocityText;
    property CloseApproachDateText: string read GetCloseApproachDateText write SetCloseApproachDateText;

    property IsPotentiallyHazardous: Boolean read GetIsPotentiallyHazardous write SetIsPotentiallyHazardous;
    property HazardousLabel: string read GetHazardousLabel write SetHazardousLabel;
    property HazardousCssClass: string read GetHazardousCssClass write SetHazardousCssClass;
    property AsteroidCardCssClass: string read GetAsteroidCardCssClass write SetAsteroidCardCssClass;

    property NasaJplUrl: string read GetNasaJplUrl write SetNasaJplUrl;

    property AbsoluteMagnitude: Extended read GetAbsoluteMagnitude write SetAbsoluteMagnitude;
    property AbsoluteMagnitudeText: string read GetAbsoluteMagnitudeText write SetAbsoluteMagnitudeText;

    property OrbitClassText: string read GetOrbitClassText write SetOrbitClassText;
    property OrbitId: string read GetOrbitId write SetOrbitId;
    property OrbitDeterminationDateText: string read GetOrbitDeterminationDateText write SetOrbitDeterminationDateText;
    property FirstObservationDateText: string read GetFirstObservationDateText write SetFirstObservationDateText;
    property LastObservationDateText: string read GetLastObservationDateText write SetLastObservationDateText;
    property DataArcInDaysText: string read GetDataArcInDaysText write SetDataArcInDaysText;
    property ObservationsUsedText: string read GetObservationsUsedText write SetObservationsUsedText;

    property CloseApproaches: TObjectList<TSCloseApproachDTO> read GetCloseApproaches write SetCloseApproaches;

    property HasCloseApproaches: Boolean read GetHasCloseApproaches write SetHasCloseApproaches;
    property HasOrbitalData: Boolean read GetHasOrbitalData write SetHasOrbitalData;

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSAsteroidDetailDTO }

constructor TSAsteroidDetailDTO.Create;
begin
  inherited;
  FCloseApproaches := TObjectList<TSCloseApproachDTO>.Create;
end;

destructor TSAsteroidDetailDTO.Destroy;
begin
  FCloseApproaches.Free;
  inherited;
end;

function TSAsteroidDetailDTO.GetAbsoluteMagnitude: Extended;
begin
  Result := FAbsoluteMagnitude;
end;

function TSAsteroidDetailDTO.GetAbsoluteMagnitudeText: string;
begin
  Result := FAbsoluteMagnitudeText;
end;

function TSAsteroidDetailDTO.GetAsteroidCardCssClass: string;
begin
  Result := FAsteroidCardCssClass;
end;

function TSAsteroidDetailDTO.GetCloseApproachDate: TDateTime;
begin
  Result := FCloseApproachDate;
end;

function TSAsteroidDetailDTO.GetCloseApproachDateText: string;
begin
  Result := FCloseApproachDateText;
end;

function TSAsteroidDetailDTO.GetCloseApproaches: TObjectList<TSCloseApproachDTO>;
begin
  Result := FCloseApproaches;
end;

function TSAsteroidDetailDTO.GetDataArcInDaysText: string;
begin
  Result := FDataArcInDaysText;
end;

function TSAsteroidDetailDTO.GetDiameterText: string;
begin
  Result := FDiameterText;
end;

function TSAsteroidDetailDTO.GetEstimatedDiameterMaxMeters: Extended;
begin
  Result := FEstimatedDiameterMaxMeters;
end;

function TSAsteroidDetailDTO.GetEstimatedDiameterMinMeters: Extended;
begin
  Result := FEstimatedDiameterMinMeters;
end;

function TSAsteroidDetailDTO.GetFirstObservationDateText: string;
begin
  Result := FFirstObservationDateText;
end;

function TSAsteroidDetailDTO.GetHasCloseApproaches: Boolean;
begin
  Result := FHasCloseApproaches;
end;

function TSAsteroidDetailDTO.GetHasOrbitalData: Boolean;
begin
  Result := FHasOrbitalData;
end;

function TSAsteroidDetailDTO.GetHazardousCssClass: string;
begin
  Result := FHazardousCssClass;
end;

function TSAsteroidDetailDTO.GetHazardousLabel: string;
begin
  Result := FHazardousLabel;
end;

function TSAsteroidDetailDTO.GetId: string;
begin
  Result := FId;
end;

function TSAsteroidDetailDTO.GetIsPotentiallyHazardous: Boolean;
begin
  Result := FIsPotentiallyHazardous;
end;

function TSAsteroidDetailDTO.GetLastObservationDateText: string;
begin
  Result := FLastObservationDateText;
end;

function TSAsteroidDetailDTO.GetMinDistanceKm: Extended;
begin
  Result := FMinDistanceKm;
end;

function TSAsteroidDetailDTO.GetMinDistanceKmText: string;
begin
  Result := FMinDistanceKmText;
end;

function TSAsteroidDetailDTO.GetName: string;
begin
  Result := FName;
end;

function TSAsteroidDetailDTO.GetNasaJplUrl: string;
begin
  Result := FNasaJplUrl;
end;

function TSAsteroidDetailDTO.GetObservationsUsedText: string;
begin
  Result := FObservationsUsedText;
end;

function TSAsteroidDetailDTO.GetOrbitClassText: string;
begin
  Result := FOrbitClassText;
end;

function TSAsteroidDetailDTO.GetOrbitDeterminationDateText: string;
begin
  Result := FOrbitDeterminationDateText;
end;

function TSAsteroidDetailDTO.GetOrbitId: string;
begin
  Result := FOrbitId;
end;

function TSAsteroidDetailDTO.GetRelativeVelocityKmH: Extended;
begin
  Result := FRelativeVelocityKmH;
end;

function TSAsteroidDetailDTO.GetRelativeVelocityText: string;
begin
  Result := FRelativeVelocityText;
end;

procedure TSAsteroidDetailDTO.SetAbsoluteMagnitude(const Value: Extended);
begin
  FAbsoluteMagnitude := Value;
end;

procedure TSAsteroidDetailDTO.SetAbsoluteMagnitudeText(const Value: string);
begin
  FAbsoluteMagnitudeText := Value;
end;

procedure TSAsteroidDetailDTO.SetAsteroidCardCssClass(const Value: string);
begin
  FAsteroidCardCssClass := Value;
end;

procedure TSAsteroidDetailDTO.SetCloseApproachDate(const Value: TDateTime);
begin
  FCloseApproachDate := Value;
end;

procedure TSAsteroidDetailDTO.SetCloseApproachDateText(const Value: string);
begin
  FCloseApproachDateText := Value;
end;

procedure TSAsteroidDetailDTO.SetCloseApproaches(const Value: TObjectList<TSCloseApproachDTO>);
begin
  if FCloseApproaches = Value then
    Exit;

  FCloseApproaches.Free;
  FCloseApproaches := Value;
end;

procedure TSAsteroidDetailDTO.SetDataArcInDaysText(const Value: string);
begin
  FDataArcInDaysText := Value;
end;

procedure TSAsteroidDetailDTO.SetDiameterText(const Value: string);
begin
  FDiameterText := Value;
end;

procedure TSAsteroidDetailDTO.SetEstimatedDiameterMaxMeters(const Value: Extended);
begin
  FEstimatedDiameterMaxMeters := Value;
end;

procedure TSAsteroidDetailDTO.SetEstimatedDiameterMinMeters(const Value: Extended);
begin
  FEstimatedDiameterMinMeters := Value;
end;

procedure TSAsteroidDetailDTO.SetFirstObservationDateText(const Value: string);
begin
  FFirstObservationDateText := Value;
end;

procedure TSAsteroidDetailDTO.SetHasCloseApproaches(const Value: Boolean);
begin
  FHasCloseApproaches := Value;
end;

procedure TSAsteroidDetailDTO.SetHasOrbitalData(const Value: Boolean);
begin
  FHasOrbitalData := Value;
end;

procedure TSAsteroidDetailDTO.SetHazardousCssClass(const Value: string);
begin
  FHazardousCssClass := Value;
end;

procedure TSAsteroidDetailDTO.SetHazardousLabel(const Value: string);
begin
  FHazardousLabel := Value;
end;

procedure TSAsteroidDetailDTO.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TSAsteroidDetailDTO.SetIsPotentiallyHazardous(const Value: Boolean);
begin
  FIsPotentiallyHazardous := Value;
end;

procedure TSAsteroidDetailDTO.SetLastObservationDateText(const Value: string);
begin
  FLastObservationDateText := Value;
end;

procedure TSAsteroidDetailDTO.SetMinDistanceKm(const Value: Extended);
begin
  FMinDistanceKm := Value;
end;

procedure TSAsteroidDetailDTO.SetMinDistanceKmText(const Value: string);
begin
  FMinDistanceKmText := Value;
end;

procedure TSAsteroidDetailDTO.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TSAsteroidDetailDTO.SetNasaJplUrl(const Value: string);
begin
  FNasaJplUrl := Value;
end;

procedure TSAsteroidDetailDTO.SetObservationsUsedText(const Value: string);
begin
  FObservationsUsedText := Value;
end;

procedure TSAsteroidDetailDTO.SetOrbitClassText(const Value: string);
begin
  FOrbitClassText := Value;
end;

procedure TSAsteroidDetailDTO.SetOrbitDeterminationDateText(const Value: string);
begin
  FOrbitDeterminationDateText := Value;
end;

procedure TSAsteroidDetailDTO.SetOrbitId(const Value: string);
begin
  FOrbitId := Value;
end;

procedure TSAsteroidDetailDTO.SetRelativeVelocityKmH(const Value: Extended);
begin
  FRelativeVelocityKmH := Value;
end;

procedure TSAsteroidDetailDTO.SetRelativeVelocityText(const Value: string);
begin
  FRelativeVelocityText := Value;
end;

end.
