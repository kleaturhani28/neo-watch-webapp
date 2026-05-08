unit NEOWatch.WebApp.Presentation.Service.Environment;

interface

uses
  System.DateUtils,
  System.SysUtils,
  Fido.Utilities,
  Fido.Mappers,
  NEOWatch.WebApp.Presentation.Service.DTO.Environment,
  NEOWatch.WebApp.Domain.EnvironmentRepository.Intf,
  NEOWatch.WebApp.Presentation.Service.Environment.Intf,
  NEOWatch.WebApp.Presentation.Service.Authorization.Intf;

type
  TEnvironmentService = class(TInterfacedObject, IEnvironmentService)

  private
    FRepository: IEnvironmentRepository;
    FAuthService: IAuthorizationService;
  public
    function GetByUser(const Username: string): TWSEnvironmentDTO;

    constructor Create(const Repository: IEnvironmentRepository; const AuthService: IAuthorizationService);
  end;

implementation

uses
  SynchroPlan.WebApp.Domain.Entity.Environment.Intf;

constructor TEnvironmentService.Create(
  const Repository: IEnvironmentRepository;
  const AuthService: IAuthorizationService
);
begin
  inherited Create;
  FRepository := Utilities.CheckNotNullAndSet(Repository, 'EnvironmentRepository');
  FAuthService := Utilities.CheckNotNullAndSet(AuthService, 'Enforcer');
end;

function TEnvironmentService.GetByUser(const Username: string): TWSEnvironmentDTO;
var
  Environment: IEnvironment;
begin
  Environment := FRepository.GetByUser(Username);

  //  if not FAuthService.Can(Username, 'test', 'access') then
  //    Environment.SetTest(-1);

  result := TWSEnvironmentDTO.Create;
  Mappers.Map(Environment, result);
end;

initialization

  Mappers.RegisterMapper<IEnvironment, TWSEnvironmentDTO>(
    procedure(const Source: IEnvironment; var Destination: TWSEnvironmentDTO)
    begin
      Destination.CurrentDate := Source.CurrentDate.ToISO8601.Substring(0, 10);
      Destination.ConsumptionUrl := Source.ConsumptionUrl;
      Destination.Test := Source.Test;
    end
  );

end.
