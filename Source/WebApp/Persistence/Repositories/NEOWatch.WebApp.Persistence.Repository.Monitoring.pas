unit NEOWatch.WebApp.Persistence.Repository.Monitoring;

interface

uses
  NEOWatch.WebApp.Domain.MonitoringRepository.Intf,
  NEOWatch.WebApp.Domain.Entity.Monitoring.Intf,
  NEOWatch.WebApp.Domain.Entity.Monitoring;

type

  TMonitoringRepository = class(TInterfacedObject, IMonitoringRepository)

  public
    function GetDefaultList: IMonitoring;
  end;

implementation

function TMonitoringRepository.GetDefaultList: IMonitoring;
var
  Monitoring: IMonitoring;
begin
  Monitoring := TMonitoring.Create;

  Monitoring.SetTotalCount(0);
  Monitoring.SetDangerousCount(0);
  Monitoring.SetSafeCount(0);
  Monitoring.SetHasError(False);
  Monitoring.SetErrorMessage('');

  Result := Monitoring;
end;

end.
