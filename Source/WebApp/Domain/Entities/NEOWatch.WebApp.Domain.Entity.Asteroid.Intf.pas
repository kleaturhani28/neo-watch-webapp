unit NEOWatch.WebApp.Domain.Entity.Asteroid.Intf;

interface

type

  IAsteroid = interface(IInvokable)
    ['{59F9B86F-7B04-4107-B0CF-27EFADB8DB3D}']
    function Id: string;
    function Name: string;
    function MinDistanceKm: Extended;
    function EstimatedDiameterMinMeters: Extended;
    function EstimatedDiameterMaxMeters: Extended;
    function RelativeVelocityKmH: Extended;
    function CloseApproachDate: TDateTime;
    function IsPotentiallyHazardous: Boolean;
    function NasaJplUrl: string;

    procedure SetId(const Value: string);
    procedure SetName(const Value: string);
    procedure SetMinDistanceKm(const Value: extended);
    procedure SetEstimatedDiameterMinMeters(const Value: extended);
    procedure SetEstimatedDiameterMaxMeters(const Value: extended);
    procedure SetRelativeVelocityKmH(const Value: Extended);
    procedure SetCloseApproachDate(const Value: TDateTime);
    procedure SetIsPotentiallyHazardous(const Value: Boolean);
    procedure SetNasaJplUrl(const Value: string);
  end;

implementation

end.
