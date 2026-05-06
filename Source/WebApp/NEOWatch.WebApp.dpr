program NEOWatch.WebApp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Asteroid.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.Asteroid in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Asteroid.pas',
  NEOWatch.WebApp.Presentation.Controller.Main in 'Presentation\Controllers\NEOWatch.WebApp.Presentation.Controller.Main.pas',
  NEOWatch.WebApp.Presentation.Controller.Asteroids in 'Presentation\Controllers\NEOWatch.WebApp.Presentation.Controller.Asteroids.pas',
  NEOWatch.WebApp.Presentation.Model.Asteroids.Intf in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.Asteroids.Intf.pas',
  NEOWatch.WebApp.Presentation.Model.Asteroids in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.Asteroids.pas',
  NEOWatch.WebApp.Presentation.Model.Dashboard.Intf in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.Dashboard.Intf.pas',
  NEOWatch.WebApp.Presentation.Model.Dashboard in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.Dashboard.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.WSMonitoring in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.WSMonitoring.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidFilters in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidFilters.pas',
  NEOWatch.WebApp.Presentation.Controller.Dashboard in 'Presentation\Controllers\NEOWatch.WebApp.Presentation.Controller.Dashboard.pas',
  NEOWatch.WebApp.Domain.Entity.Dashboard.Intf in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Dashboard.Intf.pas',
  NEOWatch.WebApp.Domain.Entity.Dashboard in 'Domain\Entities\NEOWatch.WebApp.Domain.Entity.Dashboard.pas',
  NEOWatch.WebApp.Domain.AsteroidRepository.Intf in 'Domain\NEOWatch.WebApp.Domain.AsteroidRepository.Intf.pas',
  NEOWatch.WebApp.Domain.DashboardRepository.Intf in 'Domain\NEOWatch.WebApp.Domain.DashboardRepository.Intf.pas',
  NEOWatch.WebApp.Persistence.Gateway.Asteroid.Intf in 'Persistence\Gateways\NEOWatch.WebApp.Persistence.Gateway.Asteroid.Intf.pas',
  NEOWatch.WebApp.Persistence.Gateway.Dashboard.Intf in 'Persistence\Gateways\NEOWatch.WebApp.Persistence.Gateway.Dashboard.Intf.pas',
  NEOWatch.WebApp.Persistence.Repository.Dashboard in 'Persistence\Repositories\NEOWatch.WebApp.Persistence.Repository.Dashboard.pas',
  NEOWatch.WebApp.Persistence.Repository.Asteroids in 'Persistence\Repositories\NEOWatch.WebApp.Persistence.Repository.Asteroids.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidSummary in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidSummary.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidCard in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidCard.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidDetails in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.WSAsteroidDetails.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.WSCloseApproach in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.WSCloseApproach.pas',
  NEOWatch.WebApp.Presentation.Model.DTO.WSDashboard in 'Presentation\Models\DTOs\NEOWatch.WebApp.Presentation.Model.DTO.WSDashboard.pas',
  NEOWatch.WebApp.Presentation.View.Main.Intf in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Main.Intf.pas',
  NEOWatch.WebApp.Presentation.View.Main.Sempare in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Main.Sempare.pas',
  NEOWatch.WebApp.Presentation.View.AsteroidDetail.Intf in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.AsteroidDetail.Intf.pas',
  NEOWatch.WebApp.Presentation.View.AsteroidDetail.Sempare in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.AsteroidDetail.Sempare.pas',
  NEOWatch.WebApp.Presentation.View.Monitoring.Intf in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Monitoring.Intf.pas',
  NEOWatch.WebApp.Presentation.View.Monitoring.Sempare in 'Presentation\Views\NEOWatch.WebApp.Presentation.View.Monitoring.Sempare.pas',
  NEOWatch.WebApp.Presentation.Model.AsteroidDetail.Intf in 'Presentation\Models\NEOWatch.WebApp.Presentation.Model.AsteroidDetail.Intf.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
