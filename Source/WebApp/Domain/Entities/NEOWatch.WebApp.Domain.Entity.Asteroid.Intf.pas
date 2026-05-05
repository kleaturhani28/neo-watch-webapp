unit NEOWatch.WebApp.Domain.Entity.Asteroid.Intf;

interface

type

  IAsteroid = interface(IInvokable)
    ['{59F9B86F-7B04-4107-B0CF-27EFADB8DB3D}']
    function Name: string;
    function MinDistanceKm: extended;
    function EstimatedDiameterMinKm: extended;
    function EstimatedDiameterMaxKm: extended;
    function RelativeVelocityKmPerHour: extended;
    function IsPotentiallyHazardousAsteroid: Boolean;

    procedure SetName(const Value: string);
    procedure SetMinDistanceKm(const Value: extended);
    procedure SetEstimatedDiameterMinKm(const Value: extended);
    procedure SetEstimatedDiameterMaxKm(const Value: extended);
    procedure SetIsPotentiallyHazardousAsteroid(const Value: Boolean);
  end;

implementation

end.
