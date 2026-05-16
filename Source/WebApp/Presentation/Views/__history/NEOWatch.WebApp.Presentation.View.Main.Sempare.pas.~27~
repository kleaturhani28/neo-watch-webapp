unit NEOWatch.WebApp.Presentation.View.Main.Sempare;

interface

uses
  System.SysUtils,
  System.IOUtils,
  Spring.Logging,
  Fido.Utilities,
  Sempare.Template,
  Sempare.Template.Context,
  NEOWatch.WebApp.Presentation.View.Main.Intf,
  NEOWatch.WebApp.Presentation.Model.DTO.SMonitoring;

type

  TViewMainSempare = class(TInterfacedObject, IViewMain)
  private
    const
      DashboardTemplateFileName: array[0..1] of string = ('Partials', 'Dashboard');
      MonitoringTemplateFileName: array[0..2] of string = ('Partials', 'Monitoring', 'Monitoring');
      ChartsTemplateFileName: array[0..2] of string = ('Partials', 'Charts', 'charts');
  private
    FLogger: ILogger;
    procedure HandleTemplateError(const TemplateName: string; const AMessage: string);
  public
    constructor Create(const Logger: ILogger);
    function Render(const Monitoring: TSMonitoringDTO): string;
  end;

implementation

constructor TViewMainSempare.Create(const Logger: ILogger);
begin
  inherited Create;
  FLogger := Utilities.CheckNotNullAndSet(Logger, 'Logger');
end;

procedure TViewMainSempare.HandleTemplateError(const TemplateName: string; const AMessage: string);
begin
  FLogger.Error('Error parsing Sempare template "%s": %s', [TemplateName, AMessage]);
end;

function TViewMainSempare.Render(const Monitoring: TSMonitoringDTO): string;
var
  DashboardTemplate: ITemplate;
  MonitoringTemplate: ITemplate;
  ChartsTemplate: ITemplate;
  Context: ITemplateContext;
  MonitoringHtml: string;
  ChartsHtml: string;
  DashboardTemplatePath: string;
  MonitoringTemplatePath: string;
  ChartsTemplatePath: string;
begin
  Result := '';

  DashboardTemplatePath := TPath.Combine(DashboardTemplateFileName);
  MonitoringTemplatePath := TPath.Combine(MonitoringTemplateFileName);
  ChartsTemplatePath := TPath.Combine(ChartsTemplateFileName);

  try
    Context := Sempare.Template.Template.Context;

    Context.Variables['monitoring'] := Monitoring;
    Context.Variables['filters'] := Monitoring.Filters;
    Context.Variables['summary'] := Monitoring.Summary;
    Context.Variables['asteroids'] := Monitoring.Asteroids;
    Context.Variables['selectedasteroid'] := Monitoring.SelectedAsteroid;

    MonitoringTemplate := TTemplateRegistry.Instance.GetTemplate(MonitoringTemplatePath);

    MonitoringHtml := Sempare.Template.Template.Eval(Context, MonitoringTemplate);

    Context.Variables['monitoringHtml'] := MonitoringHtml;

    ChartsTemplate := TTemplateRegistry.Instance.GetTemplate(ChartsTemplatePath);

    ChartsHtml := Sempare.Template.Template.Eval(Context, ChartsTemplate);

    Context.Variables['chartsHtml'] := ChartsHtml;

    DashboardTemplate := TTemplateRegistry.Instance.GetTemplate(DashboardTemplatePath);

    Result := Sempare.Template.Template.Eval(Context, DashboardTemplate);
  except
    on E: Exception do begin
      HandleTemplateError(
          Format('%s / %s / %s', [DashboardTemplatePath, MonitoringTemplatePath, ChartsTemplatePath]),
          E.Message
      );

      raise;
    end;
  end;
end;

end.
