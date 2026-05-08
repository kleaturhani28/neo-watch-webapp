unit NEOWatch.WebApp.Presentation.Service.DTO.SessionInfo;

interface

type
  TSessionInfoDTO = class
  private
    FId: string;
    FUserName: string;
    FLastAccess: TDateTime;
    FIsValid: Boolean;
    FPreviousAccess: TDateTime;
    FMessage: string;
    FIsAdmin: Boolean;
    procedure SetId(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetLastAccess(const Value: TDateTime);
    function GetId: string;
    function GetUserName: string;
    function GetLastAccess: TDateTime;
    function GetIsValid: Boolean;
    procedure SetIsValid(const Value: Boolean);
    function GetPreviousAccess: TDateTime;
    procedure SetPreviousAccess(const Value: TDateTime);
    function GetMessage: string;
    procedure SetMessage(const Value: string);
    function GetIsAdmin: Boolean;
    procedure SetIsAdmin(const Value: Boolean);
  published
    property Id: string read GetId write SetId;
    property UserName: string read GetUserName write SetUserName;
    property LastAccess: TDateTime read GetLastAccess write SetLastAccess;
    property IsValid: Boolean read GetIsValid write SetIsValid;
    property PreviousAccess: TDateTime read GetPreviousAccess write SetPreviousAccess;
    property Message: string read GetMessage write SetMessage;
    property IsAdmin: Boolean read GetIsAdmin write SetIsAdmin;
  end;

implementation

{ TSessionInfoDTO }

function TSessionInfoDTO.GetId: string;
begin
  result := FId;
end;

function TSessionInfoDTO.GetLastAccess: TDateTime;
begin
  result := FLastAccess;
end;

procedure TSessionInfoDTO.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TSessionInfoDTO.SetLastAccess(const Value: TDateTime);
begin
  FLastAccess := Value;
end;

procedure TSessionInfoDTO.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

function TSessionInfoDTO.GetUserName: string;
begin
  result := FUserName;
end;

function TSessionInfoDTO.GetIsAdmin: Boolean;
begin
  result := FIsAdmin;
end;

function TSessionInfoDTO.GetIsValid: Boolean;
begin
  result := FIsValid;
end;

procedure TSessionInfoDTO.SetIsAdmin(const Value: Boolean);
begin
  FIsAdmin := Value;
end;

procedure TSessionInfoDTO.SetIsValid(const Value: Boolean);
begin
  FIsValid := Value;
end;

function TSessionInfoDTO.GetPreviousAccess: TDateTime;
begin
  result := FPreviousAccess;
end;

procedure TSessionInfoDTO.SetPreviousAccess(const Value: TDateTime);
begin
  FPreviousAccess := Value;
end;

function TSessionInfoDTO.GetMessage: string;
begin
  result := FMessage;
end;

procedure TSessionInfoDTO.SetMessage(const Value: string);
begin
  FMessage := Value;
end;

end.
