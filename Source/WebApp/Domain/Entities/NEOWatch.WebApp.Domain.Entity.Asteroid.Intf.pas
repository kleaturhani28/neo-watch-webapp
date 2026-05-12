unit NEOWatch.WebApp.Domain.Entity.Asteroid.Intf;

interface

type

  IAsteroid = interface(IInvokable)
    ['{59F9B86F-7B04-4107-B0CF-27EFADB8DB3D}']
    function Id: string;
    function Name: string;
    function NasaJplUrl: string;

    function AbsoluteMagnitude: extended;

    function DiameterMinKm: extended;
    function DiameterMaxKm: extended;
    function DiameterAverageKm: extended;

    function IsPotentiallyHazardous: Boolean;
    function IsSentryObject: Boolean;

    function CloseApproachDate: TDateTime;
    function MinDistanceKm: extended;
    function RelativeVelocityKmH: extended;

    procedure SetId(const Value: string);
    procedure SetName(const Value: string);
    procedure SetNasaJplUrl(const Value: string);

    procedure SetAbsoluteMagnitude(const Value: extended);

    procedure SetDiameterMinKm(const Value: extended);
    procedure SetDiameterMaxKm(const Value: extended);

    procedure SetIsPotentiallyHazardous(const Value: Boolean);
    procedure SetIsSentryObject(const Value: Boolean);

    procedure SetCloseApproachDate(const Value: TDateTime);
    procedure SetMinDistanceKm(const Value: extended);
    procedure SetRelativeVelocityKmH(const Value: extended);
  end;

implementation

end.
