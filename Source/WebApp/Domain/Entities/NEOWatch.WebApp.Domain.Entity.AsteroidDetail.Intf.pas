unit NEOWatch.WebApp.Domain.Entity.AsteroidDetail.Intf;

interface

uses
  Spring,
  Spring.Collections,
  NEOWatch.WebApp.Domain.Entity.CloseApproach.Intf;

type
  IAsteroidDetail = interface(IInvokable)
    ['{6DB03913-7C8D-417F-A7EC-ADC047446F75}']

    function Id: string;
    function Name: string;
    function NasaJplUrl: string;

    function AbsoluteMagnitude: extended;

    function DiameterMinKm: extended;
    function DiameterMaxKm: extended;
    function DiameterAverageKm: extended;

    function IsPotentiallyHazardous: Boolean;
    function IsSentryObject: Boolean;

    function OrbitClassType: string;
    function OrbitClassDescription: string;
    function FirstObservationDate: string;
    function LastObservationDate: string;

    function CloseApproaches: IReadOnlyList<ICloseApproach>;

    procedure SetId(const Value: string);
    procedure SetName(const Value: string);
    procedure SetNasaJplUrl(const Value: string);

    procedure SetAbsoluteMagnitude(const Value: extended);

    procedure SetDiameterMinKm(const Value: extended);
    procedure SetDiameterMaxKm(const Value: extended);

    procedure SetIsPotentiallyHazardous(const Value: Boolean);
    procedure SetIsSentryObject(const Value: Boolean);

    procedure SetOrbitClassType(const Value: string);
    procedure SetOrbitClassDescription(const Value: string);
    procedure SetFirstObservationDate(const Value: string);
    procedure SetLastObservationDate(const Value: string);

    procedure AddCloseApproach(const Value: ICloseApproach);
  end;

implementation

end.
