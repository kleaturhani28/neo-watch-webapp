unit NEOWatch.WebApp.Presentation.Model.AsteroidDetail;

interface

uses
  NEOWatch.WebApp.Presentation.Model.AsteroidDetail.Intf,
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidDetails,
  NEOWatch.WebApp.Domain.AsteroidDetailRepository.Intf,
  Fido.Utilities,
  NEOWatch.WebApp.Domain.Entity.AsteroidDetail.Intf,
  Fido.Mappers,
  System.SysUtils,
  NEOWatch.WebApp.Domain.Entity.CloseApproach.Intf,
  NEOWatch.WebApp.Presentation.Model.DTO.SCloseApproach;

type
  TModelAsteroidDetail = class(TInterfacedObject, IModelAsteroidDetail)
  private
    FAsteroidDetailRepository: IAsteroidDetailRepository;
  public
    function GetById(const Id: string): TSAsteroidDetailDTO;

    constructor Create(const AsteroidDetailRepository: IAsteroidDetailRepository);
  end;

implementation

constructor TModelAsteroidDetail.Create(const AsteroidDetailRepository: IAsteroidDetailRepository);
begin
  inherited Create;
  FAsteroidDetailRepository := Utilities.CheckNotNullAndSet(AsteroidDetailRepository, 'AsteroidDetailRepository');
end;

function TModelAsteroidDetail.GetById(const Id: string): TSAsteroidDetailDTO;
var
  AsteroidDetail: IAsteroidDetail;
begin
  Result := TSAsteroidDetailDTO.Create;

  try
    AsteroidDetail := FAsteroidDetailRepository.GetById(Id);

    Mappers.Map(AsteroidDetail, Result);
  except
    on E: Exception do begin
      //
    end;
  end;
end;

initialization
  Mappers.RegisterMapper<ICloseApproach, TSCloseApproachDTO>(
      procedure(const Source: ICloseApproach; var Destination: TSCloseApproachDTO)
      begin
        Destination.CloseApproachDate := Source.CloseApproachDate;
        Destination.CloseApproachDateText := Source.CloseApproachDateText;

        Destination.MissDistanceKm := Source.MissDistanceKm;
        Destination.MissDistanceKmText := FormatFloat('#,##0', Source.MissDistanceKm) + ' km';

        Destination.RelativeVelocityKmH := Source.RelativeVelocityKmH;
        Destination.RelativeVelocityText := FormatFloat('#,##0', Source.RelativeVelocityKmH) + ' km/h';

        Destination.OrbitingBody := Source.OrbitingBody;
      end
  );

  Mappers.RegisterMapper<IAsteroidDetail, TSAsteroidDetailDTO>(
      procedure(const Source: IAsteroidDetail; var Destination: TSAsteroidDetailDTO)
      var
        CloseApproach: ICloseApproach;
        CloseApproachDTO: TSCloseApproachDTO;
      begin
        Destination.Id := Source.Id;
        Destination.Name := Source.Name;
        Destination.NasaJplUrl := Source.NasaJplUrl;

        Destination.IsPotentiallyHazardous := Source.IsPotentiallyHazardous;

        Destination.EstimatedDiameterMinMeters := Source.DiameterMinKm * 1000;
        Destination.EstimatedDiameterMaxMeters := Source.DiameterMaxKm * 1000;
        Destination.DiameterText :=
            FormatFloat('0.000', Source.DiameterMinKm) + ' - ' + FormatFloat('0.000', Source.DiameterMaxKm) + ' km';

        Destination.AbsoluteMagnitude := Source.AbsoluteMagnitude;
        Destination.AbsoluteMagnitudeText := FormatFloat('0.00', Source.AbsoluteMagnitude);

        Destination.OrbitClassText := Source.OrbitClassType;
        Destination.OrbitClassText := Source.OrbitClassType;

        if not Source.OrbitClassDescription.Trim.IsEmpty then
          Destination.OrbitClassText := Source.OrbitClassType + ' - ' + Source.OrbitClassDescription;

        Destination.FirstObservationDateText := Source.FirstObservationDate;
        Destination.LastObservationDateText := Source.LastObservationDate;

        if Source.IsPotentiallyHazardous then begin
          Destination.HazardousLabel := 'Dangerous';
          Destination.HazardousCssClass := 'risk-badge risk-danger';
          Destination.AsteroidCardCssClass := 'asteroid-card dangerous';
        end
        else begin
          Destination.HazardousLabel := 'Safe';
          Destination.HazardousCssClass := 'risk-badge risk-safe';
          Destination.AsteroidCardCssClass := 'asteroid-card';
        end;

        Destination.CloseApproaches.Clear;

        for CloseApproach in Source.CloseApproaches do begin
          CloseApproachDTO := TSCloseApproachDTO.Create;
          Mappers.Map(CloseApproach, CloseApproachDTO);
          Destination.CloseApproaches.Add(CloseApproachDTO);
        end;

        if Destination.CloseApproaches.Count > 0 then begin
          Destination.CloseApproachDateText := Destination.CloseApproaches[0].CloseApproachDateText;

          Destination.MinDistanceKmText := Destination.CloseApproaches[0].MissDistanceKmText;

          Destination.RelativeVelocityText := Destination.CloseApproaches[0].RelativeVelocityText;
        end;
      end
  );

end.
