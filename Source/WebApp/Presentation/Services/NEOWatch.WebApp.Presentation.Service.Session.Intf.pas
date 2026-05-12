unit NEOWatch.WebApp.Presentation.Service.Session.Intf;

interface

uses
  NEOWatch.WebApp.Presentation.Service.DTO.SessionInfo,
  Spring;

type
  ISessionService = interface(IInvokable)
    ['{1C4E7272-1A11-4865-BA95-EAF05CF4CCEA}']
    function New: TSessionInfoDTO;
    function GetBySessionId(const Value: string): TSessionInfoDTO;
    procedure Save(const SessionInfo: TSessionInfoDTO; const AfterSave: Action<string> = nil);
    procedure Update(const SessionInfo: TSessionInfoDTO);
  end;

implementation

end.

