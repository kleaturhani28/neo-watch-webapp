unit NEOWatch.WebApp.Domain.AsteroidDetailRepository.Intf;

interface

uses
  Spring,
  NEOWatch.WebApp.Domain.Entity.AsteroidDetail.Intf;

type
  IAsteroidDetailRepository = interface(IInvokable)
    ['{15DA1620-91A1-42E3-81C5-2B72BF0DEC25}']

    function GetById(const Id: string): IAsteroidDetail;
  end;

implementation

end.
