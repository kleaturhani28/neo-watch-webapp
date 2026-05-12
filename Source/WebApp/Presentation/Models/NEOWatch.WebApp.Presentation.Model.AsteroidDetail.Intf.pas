unit NEOWatch.WebApp.Presentation.Model.AsteroidDetail.Intf;

interface

uses
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidDetails;

type

  IModelAsteroidDetail = interface(IInvokable)
    ['{3E1724AE-DE8F-4ECE-A161-1BF13440AEFA}']

    function GetById(const Id: string): TSAsteroidDetailDTO;
  end;

implementation

end.
