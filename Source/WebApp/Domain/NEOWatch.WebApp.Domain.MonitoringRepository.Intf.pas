unit NEOWatch.WebApp.Domain.MonitoringRepository.Intf;

interface

uses
  NEOWatch.WebApp.Domain.Entity.Monitoring.Intf,
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf;

type

  IMonitoringRepository = interface(IInvokable)
    ['{1230DD63-4261-4DA7-B2A4-A557E2F0FB53}']
    function GetDefaultList: IMonitoring;
    function GetListByFilters(const Filters: IAsteroidFilters): IMonitoring;
  end;

implementation

end.
