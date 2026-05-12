unit NEOWatch.WebApp.Presentation.Model.DTO.SCloseApproach;

interface

type
  TSCloseApproachDTO = class
  private
    FCloseApproachDate: TDateTime;
    FCloseApproachDateText: string;

    FMissDistanceKm: Extended;
    FMissDistanceKmText: string;

    FRelativeVelocityKmH: Extended;
    FRelativeVelocityText: string;

    FOrbitingBody: string;

    function GetCloseApproachDate: TDateTime;
    function GetCloseApproachDateText: string;
    function GetMissDistanceKm: Extended;
    function GetMissDistanceKmText: string;
    function GetRelativeVelocityKmH: Extended;
    function GetRelativeVelocityText: string;
    function GetOrbitingBody: string;

    procedure SetCloseApproachDate(const Value: TDateTime);
    procedure SetCloseApproachDateText(const Value: string);
    procedure SetMissDistanceKm(const Value: Extended);
    procedure SetMissDistanceKmText(const Value: string);
    procedure SetRelativeVelocityKmH(const Value: Extended);
    procedure SetRelativeVelocityText(const Value: string);
    procedure SetOrbitingBody(const Value: string);

  published
    property CloseApproachDate: TDateTime read GetCloseApproachDate write SetCloseApproachDate;
    property CloseApproachDateText: string read GetCloseApproachDateText write SetCloseApproachDateText;

    property MissDistanceKm: Extended read GetMissDistanceKm write SetMissDistanceKm;
    property MissDistanceKmText: string read GetMissDistanceKmText write SetMissDistanceKmText;

    property RelativeVelocityKmH: Extended read GetRelativeVelocityKmH write SetRelativeVelocityKmH;
    property RelativeVelocityText: string read GetRelativeVelocityText write SetRelativeVelocityText;

    property OrbitingBody: string read GetOrbitingBody write SetOrbitingBody;
  end;

implementation

{ TSCloseApproachDTO }

function TSCloseApproachDTO.GetCloseApproachDate: TDateTime;
begin
  Result := FCloseApproachDate;
end;

function TSCloseApproachDTO.GetCloseApproachDateText: string;
begin
  Result := FCloseApproachDateText;
end;

function TSCloseApproachDTO.GetMissDistanceKm: Extended;
begin
  Result := FMissDistanceKm;
end;

function TSCloseApproachDTO.GetMissDistanceKmText: string;
begin
  Result := FMissDistanceKmText;
end;

function TSCloseApproachDTO.GetOrbitingBody: string;
begin
  Result := FOrbitingBody;
end;

function TSCloseApproachDTO.GetRelativeVelocityKmH: Extended;
begin
  Result := FRelativeVelocityKmH;
end;

function TSCloseApproachDTO.GetRelativeVelocityText: string;
begin
  Result := FRelativeVelocityText;
end;

procedure TSCloseApproachDTO.SetCloseApproachDate(const Value: TDateTime);
begin
  FCloseApproachDate := Value;
end;

procedure TSCloseApproachDTO.SetCloseApproachDateText(const Value: string);
begin
  FCloseApproachDateText := Value;
end;

procedure TSCloseApproachDTO.SetMissDistanceKm(const Value: Extended);
begin
  FMissDistanceKm := Value;
end;

procedure TSCloseApproachDTO.SetMissDistanceKmText(const Value: string);
begin
  FMissDistanceKmText := Value;
end;

procedure TSCloseApproachDTO.SetOrbitingBody(const Value: string);
begin
  FOrbitingBody := Value;
end;

procedure TSCloseApproachDTO.SetRelativeVelocityKmH(const Value: Extended);
begin
  FRelativeVelocityKmH := Value;
end;

procedure TSCloseApproachDTO.SetRelativeVelocityText(const Value: string);
begin
  FRelativeVelocityText := Value;
end;

end.
