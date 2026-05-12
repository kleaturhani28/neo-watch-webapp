unit NEOWatch.WebApp.Domain.Entity.Session.Intf;

interface

type
  ISession = interface(IInvokable)
    ['{25BBE7FA-9689-46BE-AC30-C6E24D5CA55E}']
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
  end;

implementation

end.
