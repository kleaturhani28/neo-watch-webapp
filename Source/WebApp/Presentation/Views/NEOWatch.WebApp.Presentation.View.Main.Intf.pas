unit NEOWatch.WebApp.Presentation.View.Main.Intf;

interface

uses
  System.Generics.Collections,
  NEOWatch.WebApp.Presentation.Model.DTO.SMonitoring;

type
  IViewMain = interface(IInvokable)
    ['{2122E1A6-5758-4814-A4F1-02E7D39FE02D}']
    function Render(const Monitoring: TSMonitoringDTO): string;
  end;

implementation

end.
