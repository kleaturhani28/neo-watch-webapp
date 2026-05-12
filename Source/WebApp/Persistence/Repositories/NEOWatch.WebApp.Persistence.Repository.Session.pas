unit NEOWatch.WebApp.Persistence.Repository.Session;

interface

uses
  NEOWatch.WebApp.Domain.SessionRepository.Intf,
  NEOWatch.WebApp.Domain.Entity.Session.Intf,
  Fido.KVStore.Intf,
  Fido.Utilities,
  SysUtils,
  Fido.JSON.Marshalling,
  Fido.Mappers,
  Spring,
  System.DateUtils;

type
  TSessionDTO = record
  public
    Id: string;
    UserName: string;
    LastAccess: string;
    PreviousAccess: string;
  end;

  TSessionRepository = class(TInterfacedObject, ISessionRepository)
  private
    FSessionGateway: IKVStore;
    FSessionFactory: Func<ISession>;

  public
    function GetBySessionId(const Id: string): ISession;
    function New: ISession;
    function Save(const Value: ISession): ISession;
    procedure Delete(const Value: ISession);

    constructor Create(const SessionFactory: Func<ISession>; const SessionGateway: IKVStore);
  end;

implementation

constructor TSessionRepository.Create(const SessionFactory: Func<ISession>; const SessionGateway: IKVStore);
begin
  inherited Create;
  FSessionFactory := Utilities.CheckNotNullAndSet<Func<ISession>>(SessionFactory, 'SessionFactory');
  FSessionGateway := Utilities.CheckNotNullAndSet(SessionGateway, 'SessionGateway');
end;

procedure TSessionRepository.Delete(const Value: ISession);
begin
  FSessionGateway.Delete(Format('synchroplan::session::%s', [Value.Id])).Value;
end;

function TSessionRepository.GetBySessionId(const Id: string): ISession;
var
  StringSession: string;
  SessionDTO: TSessionDTO;
begin
  result := FSessionFactory();
  StringSession := '';

  if not Id.trim.IsEmpty then
    StringSession := FSessionGateway.Get(Format('synchroplan::session::%s', [Id])).Value;

  if StringSession.trim.IsEmpty then begin
    result.SetIsValid(False);
    result.SetMessage('Empty session');
    Exit;
  end;

  try
    SessionDTO := JSONUnmarshaller.to<TSessionDTO>(StringSession);
    Mappers.Map(SessionDTO, result);
    result.SetIsValid(True);
    result.SetMessage('ok');
  except
    on E: Exception do begin
      result.SetIsValid(False);
      result.SetMessage(Format('Error retrieving session #%s from KVStore: %s', [Id, E.Message]));
    end;
  end;
end;

function TSessionRepository.New: ISession;
begin
  result := FSessionFactory();
end;

function TSessionRepository.Save(const Value: ISession): ISession;
var
  SessionString: string;
  SessionDTO: TSessionDTO;
begin
  SessionDTO.Id := Value.Id;
  SessionDTO.UserName := Value.UserName;
  SessionDTO.LastAccess := Value.LastAccess.ToISO8601();
  SessionDTO.PreviousAccess := Value.PreviousAccess.ToISO8601();
  SessionString := JSONMarshaller.From<TSessionDTO>(SessionDTO);
  try
    FSessionGateway.Put(Format('synchroplan::session::%s', [SessionDTO.Id]), SessionString).Value;

    result := FSessionFactory();
    Mappers.Map(SessionDTO, result);
  except
    on E: Exception do
      raise ESessionRepositoryException.CreateFmt('Error saving session #%s to KVStore: %s', [Value.Id, E.Message]);
  end;
end;

initialization

  Mappers.RegisterMapper<TSessionDTO, ISession>(
      procedure(const Source: TSessionDTO; var Destination: ISession)
      var
        AppDate: TDateTime;
      begin
        Destination.SetId(Source.Id);
        Destination.SetUserName(Source.UserName);
        if TryISO8601ToDate(Source.LastAccess, AppDate) then
          Destination.SetLastAccess(AppDate);
        if TryISO8601ToDate(Source.PreviousAccess, AppDate) then
          Destination.SetPreviousAccess(AppDate);
      end
  );

end.
