unit NEOWatch.WebApp.Domain.Entity.AsteroidFilters;

interface

uses
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf;

type

  TAsteroidFilters = class(TInterfacedObject, IAsteroidFilters)
  private
    FStartDate: string;
    FEndDate: string;
    FHazardous: string;
    FSortBy: string;
    FSortDirection: string;
  public
    function EndDate: string;
    function Hazardous: string;
    procedure SetEndDate(const Value: string);
    procedure SetHazardous(const Value: string);
    procedure SetSortBy(const Value: string);
    procedure SetSortDirection(const Value: string);
    procedure SetStartDate(const Value: string);
    function SortBy: string;
    function SortDirection: string;
    function StartDate: string;
  end;

implementation

function TAsteroidFilters.StartDate: string;
begin
  Result := FStartDate;
end;

function TAsteroidFilters.EndDate: string;
begin
  Result := FEndDate;
end;

function TAsteroidFilters.Hazardous: string;
begin
  Result := FHazardous;
end;

function TAsteroidFilters.SortBy: string;
begin
  Result := FSortBy;
end;

function TAsteroidFilters.SortDirection: string;
begin
  Result := FSortDirection;
end;

procedure TAsteroidFilters.SetStartDate(const Value: string);
begin
  FStartDate := Value;
end;

procedure TAsteroidFilters.SetEndDate(const Value: string);
begin
  FEndDate := Value;
end;

procedure TAsteroidFilters.SetHazardous(const Value: string);
begin
  FHazardous := Value;
end;

procedure TAsteroidFilters.SetSortBy(const Value: string);
begin
  FSortBy := Value;
end;

procedure TAsteroidFilters.SetSortDirection(const Value: string);
begin
  FSortDirection := Value;
end;

end.
