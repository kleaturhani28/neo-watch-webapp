unit NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidFilters;

interface

type
  TSAsteroidFiltersDTO = class
  private
    FStartDate: string;
    FEndDate: string;
    FHazardous: string;
    FSortBy: string;
    FSortDirection: string;

    FIsAllSelected: Boolean;
    FIsDangerousSelected: Boolean;
    FIsSafeSelected: Boolean;

    FIsSortByDistanceSelected: Boolean;
    FIsSortBySizeSelected: Boolean;

    FIsSortAscSelected: Boolean;
    FIsSortDescSelected: Boolean;

    function GetStartDate: string;
    function GetEndDate: string;
    function GetHazardous: string;
    function GetSortBy: string;
    function GetSortDirection: string;
    function GetIsAllSelected: Boolean;
    function GetIsDangerousSelected: Boolean;
    function GetIsSafeSelected: Boolean;
    function GetIsSortByDistanceSelected: Boolean;
    function GetIsSortBySizeSelected: Boolean;
    function GetIsSortAscSelected: Boolean;
    function GetIsSortDescSelected: Boolean;

    procedure SetStartDate(const Value: string);
    procedure SetEndDate(const Value: string);
    procedure SetHazardous(const Value: string);
    procedure SetSortBy(const Value: string);
    procedure SetSortDirection(const Value: string);
    procedure SetIsAllSelected(const Value: Boolean);
    procedure SetIsDangerousSelected(const Value: Boolean);
    procedure SetIsSafeSelected(const Value: Boolean);
    procedure SetIsSortByDistanceSelected(const Value: Boolean);
    procedure SetIsSortBySizeSelected(const Value: Boolean);
    procedure SetIsSortAscSelected(const Value: Boolean);
    procedure SetIsSortDescSelected(const Value: Boolean);

  published
    property StartDate: string read GetStartDate write SetStartDate;
    property EndDate: string read GetEndDate write SetEndDate;

    property Hazardous: string read GetHazardous write SetHazardous;
    property SortBy: string read GetSortBy write SetSortBy;
    property SortDirection: string read GetSortDirection write SetSortDirection;

    property IsAllSelected: Boolean read GetIsAllSelected write SetIsAllSelected;
    property IsDangerousSelected: Boolean read GetIsDangerousSelected write SetIsDangerousSelected;
    property IsSafeSelected: Boolean read GetIsSafeSelected write SetIsSafeSelected;

    property IsSortByDistanceSelected: Boolean read GetIsSortByDistanceSelected write SetIsSortByDistanceSelected;
    property IsSortBySizeSelected: Boolean read GetIsSortBySizeSelected write SetIsSortBySizeSelected;

    property IsSortAscSelected: Boolean read GetIsSortAscSelected write SetIsSortAscSelected;
    property IsSortDescSelected: Boolean read GetIsSortDescSelected write SetIsSortDescSelected;
  end;

implementation

{ TSAsteroidFiltersDTO }

function TSAsteroidFiltersDTO.GetEndDate: string;
begin
  Result := FEndDate;
end;

function TSAsteroidFiltersDTO.GetHazardous: string;
begin
  Result := FHazardous;
end;

function TSAsteroidFiltersDTO.GetIsAllSelected: Boolean;
begin
  Result := FIsAllSelected;
end;

function TSAsteroidFiltersDTO.GetIsDangerousSelected: Boolean;
begin
  Result := FIsDangerousSelected;
end;

function TSAsteroidFiltersDTO.GetIsSafeSelected: Boolean;
begin
  Result := FIsSafeSelected;
end;

function TSAsteroidFiltersDTO.GetIsSortAscSelected: Boolean;
begin
  Result := FIsSortAscSelected;
end;

function TSAsteroidFiltersDTO.GetIsSortByDistanceSelected: Boolean;
begin
  Result := FIsSortByDistanceSelected;
end;

function TSAsteroidFiltersDTO.GetIsSortBySizeSelected: Boolean;
begin
  Result := FIsSortBySizeSelected;
end;

function TSAsteroidFiltersDTO.GetIsSortDescSelected: Boolean;
begin
  Result := FIsSortDescSelected;
end;

function TSAsteroidFiltersDTO.GetSortBy: string;
begin
  Result := FSortBy;
end;

function TSAsteroidFiltersDTO.GetSortDirection: string;
begin
  Result := FSortDirection;
end;

function TSAsteroidFiltersDTO.GetStartDate: string;
begin
  Result := FStartDate;
end;

procedure TSAsteroidFiltersDTO.SetEndDate(const Value: string);
begin
  FEndDate := Value;
end;

procedure TSAsteroidFiltersDTO.SetHazardous(const Value: string);
begin
  FHazardous := Value;
end;

procedure TSAsteroidFiltersDTO.SetIsAllSelected(const Value: Boolean);
begin
  FIsAllSelected := Value;
end;

procedure TSAsteroidFiltersDTO.SetIsDangerousSelected(const Value: Boolean);
begin
  FIsDangerousSelected := Value;
end;

procedure TSAsteroidFiltersDTO.SetIsSafeSelected(const Value: Boolean);
begin
  FIsSafeSelected := Value;
end;

procedure TSAsteroidFiltersDTO.SetIsSortAscSelected(const Value: Boolean);
begin
  FIsSortAscSelected := Value;
end;

procedure TSAsteroidFiltersDTO.SetIsSortByDistanceSelected(const Value: Boolean);
begin
  FIsSortByDistanceSelected := Value;
end;

procedure TSAsteroidFiltersDTO.SetIsSortBySizeSelected(const Value: Boolean);
begin
  FIsSortBySizeSelected := Value;
end;

procedure TSAsteroidFiltersDTO.SetIsSortDescSelected(const Value: Boolean);
begin
  FIsSortDescSelected := Value;
end;

procedure TSAsteroidFiltersDTO.SetSortBy(const Value: string);
begin
  FSortBy := Value;
end;

procedure TSAsteroidFiltersDTO.SetSortDirection(const Value: string);
begin
  FSortDirection := Value;
end;

procedure TSAsteroidFiltersDTO.SetStartDate(const Value: string);
begin
  FStartDate := Value;
end;

end.
