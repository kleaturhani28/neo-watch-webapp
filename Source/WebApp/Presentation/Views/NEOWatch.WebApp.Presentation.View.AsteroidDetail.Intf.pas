unit NEOWatch.WebApp.Presentation.View.AsteroidDetail.Intf;

interface

uses
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidDetails;

type

  IViewAsteroidDetail = interface(IInvokable)
    ['{F3D8CBEF-1BCC-4BCF-B55C-3823E96E082A}']
    function Render(const AsteroidDetail: TSAsteroidDetailDTO): string;
  end;

implementation

end.
