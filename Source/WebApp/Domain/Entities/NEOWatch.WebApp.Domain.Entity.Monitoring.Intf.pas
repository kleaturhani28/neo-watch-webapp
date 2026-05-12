unit NEOWatch.WebApp.Domain.Entity.Monitoring.Intf;

interface

uses
  Spring.Collections,
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf;

type

  IMonitoring = interface(IInvokable)
    ['{3A63A581-D438-4F53-BD1D-26DFF41B174C}']
    function Asteroids: IReadOnlyList<IAsteroid>;

    function TotalCount: Integer;
    function DangerousCount: Integer;
    function SafeCount: Integer;

    function HasError: Boolean;
    function ErrorMessage: string;

    function CacheHitCount: Integer;
    function CacheMissCount: Integer;

    procedure AddAsteroid(const Value: IAsteroid);

    procedure SetTotalCount(const Value: Integer);
    procedure SetDangerousCount(const Value: Integer);
    procedure SetSafeCount(const Value: Integer);

    procedure SetHasError(const Value: Boolean);
    procedure SetErrorMessage(const Value: string);

    procedure SetCacheHitCount(const Value: Integer);
    procedure SetCacheMissCount(const Value: Integer);
  end;

implementation

end.
