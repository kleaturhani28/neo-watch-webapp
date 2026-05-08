unit NEOWatch.WebApp.Presentation.Controller.Asteroids;

interface

uses
  Horse,
  Horse.Commons,
  System.SysUtils,
  Spring,
  Fido.Utilities,
  NEOWatch.WebApp.Presentation.View.Monitoring.Intf,
  NEOWatch.WebApp.Presentation.View.AsteroidDetail.Intf,
  NEOWatch.WebApp.Presentation.Model.Monitoring.Intf,
  NEOWatch.WebApp.Presentation.Model.DTO.WSMonitoring,
  NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidDetails;

type

  EAsteroidsControllerException = class(Exception);

  IAsteroidsController = interface(IInvokable)
    ['{FAF876A9-D82C-4FA8-968E-71A85DD7DCD6}']
    procedure RegisterRoutes;
  end;

  TAsteroidsController = class(TInterfacedObject, IAsteroidsController)
  private
    FMonitoringViewFactory: Func<IViewMonitoring>;
    FAsteroidDetailViewFactory: Func<IViewAsteroidDetail>;

    FMonitoringModelFactory: Func<IModelMonitoring>;
    // FAsteroidDetailModelFactory: Func<IModelAsteroidDetail>;

    procedure GetAsteroids(Req: THorseRequest; Res: THorseResponse; Next: TProc);

    procedure GetAsteroidDetail(Req: THorseRequest; Res: THorseResponse; Next: TProc);

  public
    constructor Create(
        const MonitoringViewFactory: Func<IViewMonitoring>;
        const AsteroidDetailViewFactory: Func<IViewAsteroidDetail>;
        const MonitoringModelFactory:
            Func<IModelMonitoring>
                //  const AsteroidDetailModelFactory: Func<IModelAsteroidDetail>
    );

    procedure RegisterRoutes;

  end;

implementation

{ TAsteroidsController }

constructor TAsteroidsController.Create(
    const MonitoringViewFactory: Func<IViewMonitoring>;
    const AsteroidDetailViewFactory: Func<IViewAsteroidDetail>;
    const MonitoringModelFactory:
        Func<IModelMonitoring>
            //  const AsteroidDetailModelFactory: Func<IModelAsteroidDetail>
);
begin
  inherited Create;

  FMonitoringViewFactory :=
      Utilities.CheckNotNullAndSet<Func<IViewMonitoring>>(MonitoringViewFactory, 'MonitoringViewFactory');

  FAsteroidDetailViewFactory :=
      Utilities.CheckNotNullAndSet<Func<IViewAsteroidDetail>>(AsteroidDetailViewFactory, 'AsteroidDetailViewFactory');

  FMonitoringModelFactory :=
      Utilities.CheckNotNullAndSet<Func<IModelMonitoring>>(MonitoringModelFactory, 'MonitoringModelFactory');

  //  FAsteroidDetailModelFactory :=
  //      Utilities
  //          .CheckNotNullAndSet<Func<IModelAsteroidDetail>>(AsteroidDetailModelFactory, 'AsteroidDetailModelFactory');
end;

procedure TAsteroidsController.GetAsteroidDetail(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  View: IViewAsteroidDetail;
  //  Model: IModelAsteroidDetail;
  AsteroidDetailDTO: TWSAsteroidDetailDTO;
  AsteroidId: string;
begin
  View := FAsteroidDetailViewFactory();
  //  Model := FAsteroidDetailModelFactory();

  AsteroidDetailDTO := nil;
  AsteroidId := Req.Params['id'];

  try
    // AsteroidDetailDTO := Model.GetById(AsteroidId);

    Res.Send(View.Render(AsteroidDetailDTO));

  finally
    AsteroidDetailDTO.Free;
  end;
end;

procedure TAsteroidsController.GetAsteroids(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  View: IViewMonitoring;
  Model: IModelMonitoring;
  MonitoringDTO: TWSMonitoringDTO;

  StartDate: string;
  EndDate: string;
  Hazardous: string;
  SortBy: string;
  SortDirection: string;
begin
  View := FMonitoringViewFactory();
  Model := FMonitoringModelFactory();

  MonitoringDTO := nil;

  StartDate := Req.Query['startDate'];
  EndDate := Req.Query['endDate'];
  Hazardous := Req.Query['hazardous'];
  SortBy := Req.Query['sortBy'];
  SortDirection := Req.Query['sortDirection'];

  try
    // MonitoringDTO := Model.GetByFilters(StartDate, EndDate, Hazardous, SortBy, SortDirection);

    Res.Send(View.Render(MonitoringDTO));

  finally
    MonitoringDTO.Free;
  end;
end;

procedure TAsteroidsController.RegisterRoutes;
begin
  THorse.Route('/asteroids').Get(GetAsteroids);
  THorse.Route('/asteroids/:id').Get(GetAsteroidDetail);
end;

end.
