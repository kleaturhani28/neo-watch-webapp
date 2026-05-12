unit NEOWatch.WebApp.Domain.Entity.AsteroidFilters;

interface

uses
  System.SysUtils,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf;

type

  TAsteroidFilters = class(TInterfacedObject, IAsteroidFilters)
  private
    FStartDate: TDate;
    FEndDate: TDate;
    FHazardousFilter: TNeoHazardousFilter;
    FSortBy: TNeoSortBy;
    FSortDirection: TNeoSortDirection;
  public
    constructor Create; overload;
    constructor Create(
        const StartDate: TDate;
        const EndDate: TDate;
        const HazardousFilter: TNeoHazardousFilter;
        const SortBy: TNeoSortBy;
        const SortDirection: TNeoSortDirection
    ); overload;

    function StartDate: TDate;
    function EndDate: TDate;
    function HazardousFilter: TNeoHazardousFilter;
    function SortBy: TNeoSortBy;
    function SortDirection: TNeoSortDirection;

    procedure SetStartDate(const Value: TDate);
    procedure SetEndDate(const Value: TDate);
    procedure SetHazardousFilter(const Value: TNeoHazardousFilter);
    procedure SetSortBy(const Value: TNeoSortBy);
    procedure SetSortDirection(const Value: TNeoSortDirection);
  end;

implementation

constructor TAsteroidFilters.Create;
begin
  inherited Create;

  FStartDate := Date - 7;
  FEndDate := Date;
  FHazardousFilter := nhfAll;
  FSortBy := nsbDistance;
  FSortDirection := nsdAsc;
end;

constructor TAsteroidFilters.Create(
    const StartDate: TDate;
    const EndDate: TDate;
    const HazardousFilter: TNeoHazardousFilter;
    const SortBy: TNeoSortBy;
    const SortDirection: TNeoSortDirection
);
begin
  inherited Create;

  FStartDate := StartDate;
  FEndDate := EndDate;
  FHazardousFilter := HazardousFilter;
  FSortBy := SortBy;
  FSortDirection := SortDirection;
end;

function TAsteroidFilters.StartDate: TDate;
begin
  Result := FStartDate;
end;

function TAsteroidFilters.EndDate: TDate;
begin
  Result := FEndDate;
end;

function TAsteroidFilters.HazardousFilter: TNeoHazardousFilter;
begin
  Result := FHazardousFilter;
end;

function TAsteroidFilters.SortBy: TNeoSortBy;
begin
  Result := FSortBy;
end;

function TAsteroidFilters.SortDirection: TNeoSortDirection;
begin
  Result := FSortDirection;
end;

procedure TAsteroidFilters.SetStartDate(const Value: TDate);
begin
  FStartDate := Value;
end;

procedure TAsteroidFilters.SetEndDate(const Value: TDate);
begin
  FEndDate := Value;
end;

procedure TAsteroidFilters.SetHazardousFilter(const Value: TNeoHazardousFilter);
begin
  FHazardousFilter := Value;
end;

procedure TAsteroidFilters.SetSortBy(const Value: TNeoSortBy);
begin
  FSortBy := Value;
end;

procedure TAsteroidFilters.SetSortDirection(const Value: TNeoSortDirection);
begin
  FSortDirection := Value;
end;

end.
