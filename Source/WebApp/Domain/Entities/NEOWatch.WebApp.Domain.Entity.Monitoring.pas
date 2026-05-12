unit NEOWatch.WebApp.Domain.Entity.Monitoring;

interface

uses
  Spring.Collections,
  NEOWatch.WebApp.Domain.Entity.Monitoring.Intf,
  NEOWatch.WebApp.Domain.Entity.Asteroid.Intf;

type
  TMonitoring = class(TInterfacedObject, IMonitoring)
  private
    FAsteroids: IList<IAsteroid>;

    FTotalCount: Integer;
    FDangerousCount: Integer;
    FSafeCount: Integer;

    FHasError: Boolean;
    FErrorMessage: string;

    FCacheHitCount: Integer;
    FCacheMissCount: Integer;
  public
    constructor Create;

    function Asteroids: IReadOnlyList<IAsteroid>;

    function TotalCount: Integer;
    function DangerousCount: Integer;
    function SafeCount: Integer;

    function HasError: Boolean;
    function ErrorMessage: string;

    function CacheHitCount: Integer;
    function CacheMissCount: Integer;

    procedure AddAsteroid(const Value: IAsteroid);

    procedure SetTotalCount(const Value: Integer);
    procedure SetDangerousCount(const Value: Integer);
    procedure SetSafeCount(const Value: Integer);

    procedure SetHasError(const Value: Boolean);
    procedure SetErrorMessage(const Value: string);

    procedure SetCacheHitCount(const Value: Integer);
    procedure SetCacheMissCount(const Value: Integer);
  end;

implementation

{ TMonitoring }

constructor TMonitoring.Create;
begin
  inherited Create;

  FAsteroids := TCollections.CreateList<IAsteroid>;
end;

function TMonitoring.Asteroids: IReadOnlyList<IAsteroid>;
begin
  Result := FAsteroids.AsReadOnly;
end;

procedure TMonitoring.AddAsteroid(const Value: IAsteroid);
begin
  FAsteroids.Add(Value);
end;

function TMonitoring.TotalCount: Integer;
begin
  Result := FTotalCount;
end;

function TMonitoring.DangerousCount: Integer;
begin
  Result := FDangerousCount;
end;

function TMonitoring.SafeCount: Integer;
begin
  Result := FSafeCount;
end;

function TMonitoring.HasError: Boolean;
begin
  Result := FHasError;
end;

function TMonitoring.ErrorMessage: string;
begin
  Result := FErrorMessage;
end;

function TMonitoring.CacheHitCount: Integer;
begin
  Result := FCacheHitCount;
end;

function TMonitoring.CacheMissCount: Integer;
begin
  Result := FCacheMissCount;
end;

procedure TMonitoring.SetTotalCount(const Value: Integer);
begin
  FTotalCount := Value;
end;

procedure TMonitoring.SetDangerousCount(const Value: Integer);
begin
  FDangerousCount := Value;
end;

procedure TMonitoring.SetSafeCount(const Value: Integer);
begin
  FSafeCount := Value;
end;

procedure TMonitoring.SetHasError(const Value: Boolean);
begin
  FHasError := Value;
end;

procedure TMonitoring.SetErrorMessage(const Value: string);
begin
  FErrorMessage := Value;
end;

procedure TMonitoring.SetCacheHitCount(const Value: Integer);
begin
  FCacheHitCount := Value;
end;

procedure TMonitoring.SetCacheMissCount(const Value: Integer);
begin
  FCacheMissCount := Value;
end;

end.
