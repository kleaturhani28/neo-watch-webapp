program NEOWatch.WebApp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.ServerStatic in '..\Shared\Horse.ServerStatic.pas',
  Horse.HandleException,
  Horse.Jhonson,
  Spring,
  Spring.Container,
  System.IniFiles,
  Fido.CommandLine.Intf,
  System.IOUtils,
  Fido.Registration,
  FireDAC.Comp.UI,
  Spring.Logging,
  Fido.Db.Migrations.Model.Intf,
  Fido.JSON.Marshalling,
  System.JSON,
  Fido.KVStore.Intf,
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Asteroid.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.Asteroid in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Asteroid.pas',
  NEOWatch.WebApp.Presentation.Controller.Main in 'Presentation\Controllers\NEOWatch.WebApp.Presentation.Controller.Main.pas',
  NEOWatch.WebApp.Presentation.Controller.Asteroids in 'Presentation\Controllers\NEOWatch.WebApp.Presentation.Controller.Asteroids.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.SMonitoring in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.SMonitoring.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidFilters in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidFilters.pas',
  NEOWatch.WebApp.Domain.Entity.Monitoring.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Monitoring.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.Monitoring in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Monitoring.pas',
  NEOWatch.WebApp.Domain.MonitoringRepository.Intf in 'Domain\NEOWatch.WebApp.Domain.MonitoringRepository.Intf.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidSummary in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidSummary.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidCard in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidCard.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidDetails in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidDetails.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.SCloseApproach in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.SCloseApproach.pas',
  NEOWatch.WebApp.Presentation.View.Main.Intf in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Main.Intf.pas',
  NEOWatch.WebApp.Presentation.View.Main.Sempare in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Main.Sempare.pas',
  NEOWatch.WebApp.Presentation.View.AsteroidDetail.Intf in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.AsteroidDetail.Intf.pas',
  NEOWatch.WebApp.Presentation.View.AsteroidDetail.Sempare in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.AsteroidDetail.Sempare.pas',
  NEOWatch.WebApp.Presentation.View.Monitoring.Intf in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Monitoring.Intf.pas',
  NEOWatch.WebApp.Presentation.View.Monitoring.Sempare in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Monitoring.Sempare.pas',
  NEOWatch.WebApp.Registrations in 'NEOWatch.WebApp.Registrations.pas',
  NEOWatch.WebApp.Presentation.Model.Monitoring.Intf in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.Monitoring.Intf.pas',
  NEOWatch.WebApp.Presentation.Model.Monitoring in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.Monitoring.pas',
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.AsteroidFilters.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.AsteroidFilters in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.AsteroidFilters.pas',
  NEOWatch.WebApp.Presentation.Service.DTO.Authorizations in 'Presentation\Services\DTOs\NEOWatch.WebApp.Presentation.Service.DTO.Authorizations.pas',
  NEOWatch.WebApp.Presentation.Service.DTO.Environment in 'Presentation\Services\DTOs\NEOWatch.WebApp.Presentation.Service.DTO.Environment.pas',
  NEOWatch.WebApp.Presentation.Service.DTO.SessionInfo in 'Presentation\Services\DTOs\NEOWatch.WebApp.Presentation.Service.DTO.SessionInfo.pas',
  NEOWatch.WebApp.Presentation.Service.Session.Utils in 'Presentation\Services\NEOWatch.WebApp.Presentation.Service.Session.Utils.pas',
  NEOWatch.WebApp.CommandLine in 'NEOWatch.WebApp.CommandLine.pas',
  NEOWatch.WebApp.Presentation.Service.Session.Intf in 'Presentation\Services\NEOWatch.WebApp.Presentation.Service.Session.Intf.pas',
  NEOWatch.WebApp.Presentation.Service.Session in 'Presentation\Services\NEOWatch.WebApp.Presentation.Service.Session.pas',
  NEOWatch.WebApp.Domain.Entity.Session in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Session.pas',
  NEOWatch.WebApp.Domain.Entity.Session.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Session.Intf.pas',
  NEOWatch.WebApp.Domain.SessionRepository.Intf in 'Domain\NEOWatch.WebApp.Domain.SessionRepository.Intf.pas',
  NEOWatch.WebApp.Persistence.Repository.Session in 'Persistence\Repositories\NEOWatch.WebApp.Persistence.Repository.Session.pas',
  NEOWatch.WebApp.Constants in 'NEOWatch.WebApp.Constants.pas',
  NEOWatch.WebApp.Persistence.Repository.Monitoring in 'Persistence\Repositories\NEOWatch.WebApp.Persistence.Repository.Monitoring.pas',
  NEOWatch.WebApp.Persistence.Gateway.NasaApi.Intf in 'Persistence\Gateways\NEOWatch.WebApp.Persistence.Gateway.NasaApi.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.CloseApproach.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.CloseApproach.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.CloseApproach in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.CloseApproach.pas',
  NEOWatch.WebApp.Domain.Entity.AsteroidDetail.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.AsteroidDetail.Intf.pas',
  NEOWatch.WebApp.Domain.AsteroidDetailRepository.Intf in 'Domain\NEOWatch.WebApp.Domain.AsteroidDetailRepository.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.AsteroidDetail in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.AsteroidDetail.pas',
  NEOWatch.WebApp.Persistence.Repository.AsteroidDetail in 'Persistence\Repositories\NEOWatch.WebApp.Persistence.Repository.AsteroidDetail.pas',
  NEOWatch.WebApp.Presentation.Model.AsteroidDetail in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.AsteroidDetail.pas',
  NEOWatch.WebApp.Presentation.Model.AsteroidDetail.Intf in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.AsteroidDetail.Intf.pas';

var
  Container: IShared<TContainer>;
  IniFile: IShared<TMemIniFile>;
  CommandLine: IFidoCommandLine;
  FDCursor: IShared<TFDGUIxWaitCursor>;
begin
{$IFDEF MSWINDOWS}
  // Under windows when the console closes with readln it goes in a loop
  IsConsole := False;
{$ENDIF}
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  try
    Container := Shared.Make<TContainer>(TContainer.Create);

    NEOWatchRegistrations.RegisterCommandLine(Container);
    CommandLine := Container.Resolve<IFidoCommandLine>;
    CommandLine.Parse;
    if CommandLine.HasErrors then
      raise Exception.Create(CommandLine.ErrorText);

    IniFile := Shared.Make<TMemIniFile>(TMemIniFile.Create(Container.Resolve<IConfigOptions>.IniFileName));

    Registration.RegisterFramework(Container);

    NEOWatchRegistrations.Register(Container, IniFile);

    Container.Build;

    Container.Resolve<IMainController>.RegisterRoutes;
    Container.Resolve<IAsteroidsController>.RegisterRoutes;

    THorse
        .Use(Jhonson)
        .Use(HandleException)
{$IF defined(DEBUG) and not defined(LINUX)}
        .Use(
            ServerStatic(
                TPath.Combine(['..', '..', '..', '..', 'Source', 'WebApp', 'Presentation', 'Views', 'Templates']),
                False
            ))
{$ELSE}
        .Use(ServerStatic('Templates', False))
{$ENDIF}
        .Use(NEOWatch.WebApp.Presentation.Service.Session.Utils.Utils.Session.SimpleSession(Container));

    THorse.Listen(
        9000,
        procedure
        begin
          Writeln(Format('Server is runing on %s:%d', [THorse.Host, THorse.Port]));
{$IFDEF LINUX}
          while True do
            Sleep(1000);
{$ELSE}
          ReadLn;
{$ENDIF}
        end
    );
  except
    on E: Exception do begin
      Writeln(E.ClassName, ': ', E.Message);
{$IF defined(DEBUG)}
      ReadLn;
{$ENDIF}
      Halt(Integer(E));
    end;
  end;
end.
