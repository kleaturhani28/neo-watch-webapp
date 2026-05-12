unit NEOWatch.WebApp.Presentation.View.Monitoring.Intf;

interface

uses
  NEOWatch.WebApp.Presentation.Model.DTO.SMonitoring;

type

  IViewMonitoring = interface(IInvokable)
    ['{D5CEC106-E854-496D-A1BE-B93BC747974C}']
    function Render(const Monitoring: TSMonitoringDTO): string;
  end;

implementation

end.
