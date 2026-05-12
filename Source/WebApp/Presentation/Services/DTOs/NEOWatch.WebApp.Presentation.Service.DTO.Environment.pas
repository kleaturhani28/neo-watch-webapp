unit NEOWatch.WebApp.Presentation.Service.DTO.Environment;

interface

type
  TWSEnvironmentDTO = class

  private
    FCurrentDate: string;
    FConsumptionUrl: string;
    FTest: Integer;
    function GetCurrentDate: string;
    procedure SetCurrentDate(const Value: string);

    function GetConsumptionUrl: string;
    procedure SetConsumptionUrl(const Value: string);

    function GetTest: Integer;
    procedure SetTest(const Value: Integer);
  published
    property CurrentDate: string read GetCurrentDate write SetCurrentDate;
    property ConsumptionUrl: string read GetConsumptionUrl write SetConsumptionUrl;
    property Test: Integer read GetTest write SetTest;
  end;

implementation

function TWSEnvironmentDTO.GetConsumptionUrl: string;
begin
  result := FConsumptionUrl;
end;

function TWSEnvironmentDTO.GetCurrentDate: string;
begin
  Result := FCurrentDate;
end;

procedure TWSEnvironmentDTO.SetConsumptionUrl(const Value: string);
begin
  FConsumptionUrl := Value;
end;

procedure TWSEnvironmentDTO.SetCurrentDate(const Value: string);
begin
  FCurrentDate := Value;
end;

function TWSEnvironmentDTO.GetTest: Integer;
begin
  Result := FTest;
end;

procedure TWSEnvironmentDTO.SetTest(const Value: Integer);
begin
  FTest := Value;
end;

end.
