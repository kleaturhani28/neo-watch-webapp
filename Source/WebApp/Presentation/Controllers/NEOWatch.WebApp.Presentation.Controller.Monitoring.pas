unit NEOWatch.WebApp.Presentation.Controller.Monitoring;

interface

uses
  System.SysUtils,
  Spring,
  Horse.Commons,
  Horse,
  Fido.Utilities,
  NEOWatch.WebApp.Presentation.View.Monitoring.Intf,
  NEOWatch.WebApp.Presentation.Model.Monitoring.Intf,
  NEOWatch.WebApp.Presentation.Model.DTO.WSMonitoring;

type
  EMonitoringControllerException = class(Exception);

  IMonitoringController = interface(IInvokable)
    ['{6AF47167-D62C-492B-8985-637E145F9926}']
    procedure RegisterRoutes;
  end;

  TMonitoringController = class(TInterfacedObject, IMonitoringController)
  private
    FViewFactory: Func<IViewMonitoring>;
    FMonitoringModalModelFactory: Func<IModelMonitoring>;

    procedure Monitoring(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  public
    procedure RegisterRoutes;

    constructor Create(const ViewFactory: Func<IViewMonitoring>; const MonitoringModelFactory: Func<IModelMonitoring>);

  end;

implementation

constructor TMonitoringController.Create(
    const ViewFactory: Func<IViewMonitoring>;
    const MonitoringModelFactory: Func<IModelMonitoring>
);
begin
  inherited Create;

  FViewFactory := Utilities.CheckNotNullAndSet<Func<IViewMonitoring>>(ViewFactory, 'ViewFactory');

  FMonitoringModalModelFactory :=
      Utilities.CheckNotNullAndSet<Func<IModelMonitoring>>(MonitoringModelFactory, 'MonitoringModelFactory');
end;

procedure TMonitoringController.Monitoring(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  View: IViewMonitoring;
  MonitoringModalModel: IModelMonitoring;
begin
  View := FViewFactory();
  MonitoringModalModel := FMonitoringModalModelFactory();

  Res.Send(View.Render(MonitoringModalModel.GetDefaultList));

end;

procedure TMonitoringController.RegisterRoutes;
begin
  THorse.Route('/monitoring').Get(Monitoring);
end;

end.
