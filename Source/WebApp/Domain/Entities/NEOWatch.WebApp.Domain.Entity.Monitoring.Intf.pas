unit NEOWatch.WebApp.Domain.Entity.Monitoring.Intf;

interface

uses
  Spring.Collections,
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf;

type

  IMonitoring = interface(IInvokable)
    ['{3A63A581-D438-4F53-BD1D-26DFF41B174C}']
    function Filters: IAsteroidFilters;
    function Asteroids: IReadOnlyList<IAsteroid>;

    function TotalCount: Integer;
    function DangerousCount: Integer;
    function SafeCount: Integer;

    function HasResults: Boolean;

    function HasError: Boolean;
    function ErrorMessage: string;

    procedure SetFilters(const Value: IAsteroidFilters);
    procedure SetAsteroids(const Value: IReadOnlyList<IAsteroid>);

    procedure SetTotalCount(const Value: Integer);
    procedure SetDangerousCount(const Value: Integer);
    procedure SetSafeCount(const Value: Integer);

    procedure SetHasError(const Value: Boolean);
    procedure SetErrorMessage(const Value: string);
  end;

implementation

end.
