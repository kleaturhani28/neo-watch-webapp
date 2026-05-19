unit NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidCard;

interface

type
  TSAsteroidCardDTO = class
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

    FSizeClass: string;

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
    function GetSizeClass: string;

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
    procedure SetSizeClass(const Value: string);

  published
    property Id: string read GetId write SetId;
    property Name: string read GetName write SetName;
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
    property SizeClass: string read GetSizeClass write SetSizeClass;
  end;

implementation

{ TSAsteroidCardDTO }

function TSAsteroidCardDTO.GetAsteroidCardCssClass: string;
begin
  Result := FAsteroidCardCssClass;
end;

function TSAsteroidCardDTO.GetCloseApproachDate: TDateTime;
begin
  Result := FCloseApproachDate;
end;

function TSAsteroidCardDTO.GetCloseApproachDateText: string;
begin
  Result := FCloseApproachDateText;
end;

function TSAsteroidCardDTO.GetDiameterText: string;
begin
  Result := FDiameterText;
end;

function TSAsteroidCardDTO.GetEstimatedDiameterMaxMeters: Extended;
begin
  Result := FEstimatedDiameterMaxMeters;
end;

function TSAsteroidCardDTO.GetEstimatedDiameterMinMeters: Extended;
begin
  Result := FEstimatedDiameterMinMeters;
end;

function TSAsteroidCardDTO.GetHazardousCssClass: string;
begin
  Result := FHazardousCssClass;
end;

function TSAsteroidCardDTO.GetHazardousLabel: string;
begin
  Result := FHazardousLabel;
end;

function TSAsteroidCardDTO.GetId: string;
begin
  Result := FId;
end;

function TSAsteroidCardDTO.GetIsPotentiallyHazardous: Boolean;
begin
  Result := FIsPotentiallyHazardous;
end;

function TSAsteroidCardDTO.GetMinDistanceKm: Extended;
begin
  Result := FMinDistanceKm;
end;

function TSAsteroidCardDTO.GetMinDistanceKmText: string;
begin
  Result := FMinDistanceKmText;
end;

function TSAsteroidCardDTO.GetName: string;
begin
  Result := FName;
end;

function TSAsteroidCardDTO.GetNasaJplUrl: string;
begin
  Result := FNasaJplUrl;
end;

function TSAsteroidCardDTO.GetRelativeVelocityKmH: Extended;
begin
  Result := FRelativeVelocityKmH;
end;

function TSAsteroidCardDTO.GetRelativeVelocityText: string;
begin
  Result := FRelativeVelocityText;
end;

function TSAsteroidCardDTO.GetSizeClass: string;
var
  AverageDiameterMeters: extended;
begin
  AverageDiameterMeters := (Extended(EstimatedDiameterMinMeters) + Extended(EstimatedDiameterMaxMeters)) / 2;

  if AverageDiameterMeters >= 500 then
    Result := 'Large object'
  else if AverageDiameterMeters >= 100 then
    Result := 'Medium object'
  else
    Result := 'Small object';
end;

procedure TSAsteroidCardDTO.SetAsteroidCardCssClass(const Value: string);
begin
  FAsteroidCardCssClass := Value;
end;

procedure TSAsteroidCardDTO.SetCloseApproachDate(const Value: TDateTime);
begin
  FCloseApproachDate := Value;
end;

procedure TSAsteroidCardDTO.SetCloseApproachDateText(const Value: string);
begin
  FCloseApproachDateText := Value;
end;

procedure TSAsteroidCardDTO.SetDiameterText(const Value: string);
begin
  FDiameterText := Value;
end;

procedure TSAsteroidCardDTO.SetEstimatedDiameterMaxMeters(const Value: Extended);
begin
  FEstimatedDiameterMaxMeters := Value;
end;

procedure TSAsteroidCardDTO.SetEstimatedDiameterMinMeters(const Value: Extended);
begin
  FEstimatedDiameterMinMeters := Value;
end;

procedure TSAsteroidCardDTO.SetHazardousCssClass(const Value: string);
begin
  FHazardousCssClass := Value;
end;

procedure TSAsteroidCardDTO.SetHazardousLabel(const Value: string);
begin
  FHazardousLabel := Value;
end;

procedure TSAsteroidCardDTO.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TSAsteroidCardDTO.SetIsPotentiallyHazardous(const Value: Boolean);
begin
  FIsPotentiallyHazardous := Value;
end;

procedure TSAsteroidCardDTO.SetMinDistanceKm(const Value: Extended);
begin
  FMinDistanceKm := Value;
end;

procedure TSAsteroidCardDTO.SetMinDistanceKmText(const Value: string);
begin
  FMinDistanceKmText := Value;
end;

procedure TSAsteroidCardDTO.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TSAsteroidCardDTO.SetNasaJplUrl(const Value: string);
begin
  FNasaJplUrl := Value;
end;

procedure TSAsteroidCardDTO.SetRelativeVelocityKmH(const Value: Extended);
begin
  FRelativeVelocityKmH := Value;
end;

procedure TSAsteroidCardDTO.SetRelativeVelocityText(const Value: string);
begin
  FRelativeVelocityText := Value;
end;

procedure TSAsteroidCardDTO.SetSizeClass(const Value: string);
begin
  FSizeClass := Value;
end;

end.
