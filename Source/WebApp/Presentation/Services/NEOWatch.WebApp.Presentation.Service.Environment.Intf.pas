unit NEOWatch.WebApp.Presentation.Service.Environment.Intf;

interface

uses
  NEOWatch.WebApp.Presentation.Service.DTO.Environment;

type
  IEnvironmentService = interface(IInvokable)
    ['{70B8DC6A-9B79-44F5-B853-4C641FD32561}']
    function GetByUser(const Username: string): TWSEnvironmentDTO;
  end;

implementation

end.

