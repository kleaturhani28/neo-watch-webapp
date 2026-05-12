unit NEOWatch.WebApp.Presentation.Model.DTO.SMonitoring;

interface

uses
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidFilters,
  System.Generics.Collections,
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidSummary,
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidCard,
  NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidDetails;

type
  TSMonitoringDTO = class
  private
    FAsteroids: TObjectList<TSAsteroidCardDTO>;
    FSelectedAsteroid: TSAsteroidCardDTO;

    FFilters: TSAsteroidFiltersDTO;
    FSummary: TSAsteroidSummaryDTO;

    FHasError: Boolean;
    FErrorMessage: string;

    function GetAsteroids: TObjectList<TSAsteroidCardDTO>;
    function GetSelectedAsteroid: TSAsteroidCardDTO;
    function GetFilters: TSAsteroidFiltersDTO;
    function GetSummary: TSAsteroidSummaryDTO;
    function GetHasError: Boolean;
    function GetErrorMessage: string;

    procedure SetSelectedAsteroid(const Value: TSAsteroidCardDTO);
    procedure SetHasError(const Value: Boolean);
    procedure SetErrorMessage(const Value: string);

  published
    property Asteroids: TObjectList<TSAsteroidCardDTO> read GetAsteroids;
    property SelectedAsteroid: TSAsteroidCardDTO read GetSelectedAsteroid write SetSelectedAsteroid;

    property Filters: TSAsteroidFiltersDTO read GetFilters;
    property Summary: TSAsteroidSummaryDTO read GetSummary;

    property HasError: Boolean read GetHasError write SetHasError;
    property ErrorMessage: string read GetErrorMessage write SetErrorMessage;

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TSMonitoringDTO.Create;
begin
  inherited Create;

  FAsteroids := TObjectList<TSAsteroidCardDTO>.Create(True);
  FFilters := TSAsteroidFiltersDTO.Create;
  FSummary := TSAsteroidSummaryDTO.Create;
  FSelectedAsteroid := nil;
end;

destructor TSMonitoringDTO.Destroy;
begin
  FSummary.Free;
  FFilters.Free;
  FAsteroids.Free;

  inherited;
end;

function TSMonitoringDTO.GetAsteroids: TObjectList<TSAsteroidCardDTO>;
begin
  Result := FAsteroids;
end;

function TSMonitoringDTO.GetSelectedAsteroid: TSAsteroidCardDTO;
begin
  Result := FSelectedAsteroid;
end;

procedure TSMonitoringDTO.SetSelectedAsteroid(const Value: TSAsteroidCardDTO);
begin
  FSelectedAsteroid := Value;
end;

function TSMonitoringDTO.GetFilters: TSAsteroidFiltersDTO;
begin
  Result := FFilters;
end;

function TSMonitoringDTO.GetSummary: TSAsteroidSummaryDTO;
begin
  Result := FSummary;
end;

function TSMonitoringDTO.GetHasError: Boolean;
begin
  Result := FHasError;
end;

procedure TSMonitoringDTO.SetHasError(const Value: Boolean);
begin
  FHasError := Value;
end;

function TSMonitoringDTO.GetErrorMessage: string;
begin
  Result := FErrorMessage;
end;

procedure TSMonitoringDTO.SetErrorMessage(const Value: string);
begin
  FErrorMessage := Value;
end;

end.
