unit NEOWatch.WebApp.Domain.Entity.Session;

interface

uses
  NEOWatch.WebApp.Domain.Entity.Session.Intf,
  SysUtils;

type
  TSession = class(TInterfacedObject, ISession)
  private
    FId: string;
    FUserName: string;
    FLastAccess: TDateTime;
    FIsValid: Boolean;
    FPreviousAccess: TDateTime;
    FMessage: string;
    FIsAdmin: Boolean;
    function GenerateSessionId: string;
  public
    function Id: string;
    function UserName: string;
    function LastAccess: TDateTime;
    function IsValid: Boolean;
    function PreviousAccess: TDateTime;
    function Message: string;
    function IsAdmin: Boolean;

    procedure SetIsAdmin(const Value: Boolean);
    procedure SetId(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetLastAccess(const Value: TDateTime);
    procedure SetIsValid(const Value: Boolean);
    procedure SetPreviousAccess(const Value: TDateTime);
    procedure SetMessage(const Value: string);

    constructor Create; overload;

  end;

implementation

{ TSession }

constructor TSession.Create;
begin
  inherited Create;
  FId := GenerateSessionId;
  FUserName := '';
  FMessage := '';
  FLastAccess := Now;
  FPreviousAccess := 0;
  FIsValid := True;
end;

function TSession.Id: string;
begin
  Result := FId;
end;

function TSession.IsValid: Boolean;
begin
  Result := FIsValid;
end;

function TSession.LastAccess: TDateTime;
begin
  Result := FLastAccess;
end;

function TSession.Message: string;
begin
  Result := FMessage;
end;

function TSession.PreviousAccess: TDateTime;
begin
  Result := FPreviousAccess;
end;

function TSession.UserName: string;
begin
  Result := FUserName;
end;

procedure TSession.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TSession.SetIsValid(const Value: Boolean);
begin
  FIsValid := Value;
end;

procedure TSession.SetLastAccess(const Value: TDateTime);
begin
  FPreviousAccess := FLastAccess;
  FLastAccess := Value;
end;

procedure TSession.SetMessage(const Value: string);
begin
  FMessage := Value;
end;

procedure TSession.SetPreviousAccess(const Value: TDateTime);
begin
  FPreviousAccess := Value;
end;

procedure TSession.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

function TSession.GenerateSessionId: string;
begin
  Result := GUIDToString(TGUID.NewGuid);
end;

function TSession.IsAdmin: Boolean;
begin
  result := FIsAdmin;
end;

procedure TSession.SetIsAdmin(const Value: Boolean);
begin
  FIsAdmin := Value;
end;

end.
