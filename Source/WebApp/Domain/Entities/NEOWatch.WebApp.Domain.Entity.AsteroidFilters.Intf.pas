unit NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf;

interface

type

  TNeoHazardousFilter = (nhfAll, nhfDangerous, nhfSafe);
  TNeoSortBy = (nsbDistance, nsbSize);
  TNeoSortDirection = (nsdAsc, nsdDesc);

  IAsteroidFilters = interface(IInvokable)
    ['{9A79119E-1687-4709-AA25-3DD4CB971C17}']

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

end.
