unit NEOWatch.WebApp.Presentation.Model.DTO.SAsteroidSummary;

interface

type
  TSAsteroidSummaryDTO = class
  private
    FTotalCount: Integer;
    FDangerousCount: Integer;
    FSafeCount: Integer;

    FTotalCountText: string;
    FDangerousCountText: string;
    FSafeCountText: string;

    FHasResults: Boolean;

    FCacheStatusText: string;
    FCacheBadgeClass: string;
    FCacheDescription: string;

    FSummaryMessage: string;
    FSummaryTrendClass: string;

    function GetTotalCount: Integer;
    function GetDangerousCount: Integer;
    function GetSafeCount: Integer;
    function GetTotalCountText: string;
    function GetDangerousCountText: string;
    function GetSafeCountText: string;
    function GetHasResults: Boolean;
    function GetCacheStatusText: string;
    function GetCacheBadgeClass: string;
    function GetCacheDescription: string;
    function GetSummaryMessage: string;
    function GetSummaryTrendClass: string;

    procedure SetTotalCount(const Value: Integer);
    procedure SetDangerousCount(const Value: Integer);
    procedure SetSafeCount(const Value: Integer);
    procedure SetTotalCountText(const Value: string);
    procedure SetDangerousCountText(const Value: string);
    procedure SetSafeCountText(const Value: string);
    procedure SetHasResults(const Value: Boolean);
    procedure SetCacheStatusText(const Value: string);
    procedure SetCacheBadgeClass(const Value: string);
    procedure SetCacheDescription(const Value: string);
    procedure SetSummaryMessage(const Value: string);
    procedure SetSummaryTrendClass(const Value: string);

  published
    property TotalCount: Integer read GetTotalCount write SetTotalCount;
    property DangerousCount: Integer read GetDangerousCount write SetDangerousCount;
    property SafeCount: Integer read GetSafeCount write SetSafeCount;

    property TotalCountText: string read GetTotalCountText write SetTotalCountText;
    property DangerousCountText: string read GetDangerousCountText write SetDangerousCountText;
    property SafeCountText: string read GetSafeCountText write SetSafeCountText;

    property HasResults: Boolean read GetHasResults write SetHasResults;

    property CacheStatusText: string read GetCacheStatusText write SetCacheStatusText;
    property CacheBadgeClass: string read GetCacheBadgeClass write SetCacheBadgeClass;
    property CacheDescription: string read GetCacheDescription write SetCacheDescription;

    property SummaryMessage: string read GetSummaryMessage write SetSummaryMessage;
    property SummaryTrendClass: string read GetSummaryTrendClass write SetSummaryTrendClass;
  end;

implementation

{ TSAsteroidSummaryDTO }

function TSAsteroidSummaryDTO.GetCacheBadgeClass: string;
begin
  Result := FCacheBadgeClass;
end;

function TSAsteroidSummaryDTO.GetCacheDescription: string;
begin
  Result := FCacheDescription;
end;

function TSAsteroidSummaryDTO.GetCacheStatusText: string;
begin
  Result := FCacheStatusText;
end;

function TSAsteroidSummaryDTO.GetDangerousCount: Integer;
begin
  Result := FDangerousCount;
end;

function TSAsteroidSummaryDTO.GetDangerousCountText: string;
begin
  Result := FDangerousCountText;
end;

function TSAsteroidSummaryDTO.GetHasResults: Boolean;
begin
  Result := FHasResults;
end;

function TSAsteroidSummaryDTO.GetSafeCount: Integer;
begin
  Result := FSafeCount;
end;

function TSAsteroidSummaryDTO.GetSafeCountText: string;
begin
  Result := FSafeCountText;
end;

function TSAsteroidSummaryDTO.GetSummaryMessage: string;
begin
  Result := FSummaryMessage;
end;

function TSAsteroidSummaryDTO.GetSummaryTrendClass: string;
begin
  Result := FSummaryTrendClass;
end;

function TSAsteroidSummaryDTO.GetTotalCount: Integer;
begin
  Result := FTotalCount;
end;

function TSAsteroidSummaryDTO.GetTotalCountText: string;
begin
  Result := FTotalCountText;
end;

procedure TSAsteroidSummaryDTO.SetCacheBadgeClass(const Value: string);
begin
  FCacheBadgeClass := Value;
end;

procedure TSAsteroidSummaryDTO.SetCacheDescription(const Value: string);
begin
  FCacheDescription := Value;
end;

procedure TSAsteroidSummaryDTO.SetCacheStatusText(const Value: string);
begin
  FCacheStatusText := Value;
end;

procedure TSAsteroidSummaryDTO.SetDangerousCount(const Value: Integer);
begin
  FDangerousCount := Value;
end;

procedure TSAsteroidSummaryDTO.SetDangerousCountText(const Value: string);
begin
  FDangerousCountText := Value;
end;

procedure TSAsteroidSummaryDTO.SetHasResults(const Value: Boolean);
begin
  FHasResults := Value;
end;

procedure TSAsteroidSummaryDTO.SetSafeCount(const Value: Integer);
begin
  FSafeCount := Value;
end;

procedure TSAsteroidSummaryDTO.SetSafeCountText(const Value: string);
begin
  FSafeCountText := Value;
end;

procedure TSAsteroidSummaryDTO.SetSummaryMessage(const Value: string);
begin
  FSummaryMessage := Value;
end;

procedure TSAsteroidSummaryDTO.SetSummaryTrendClass(const Value: string);
begin
  FSummaryTrendClass := Value;
end;

procedure TSAsteroidSummaryDTO.SetTotalCount(const Value: Integer);
begin
  FTotalCount := Value;
end;

procedure TSAsteroidSummaryDTO.SetTotalCountText(const Value: string);
begin
  FTotalCountText := Value;
end;

end.
