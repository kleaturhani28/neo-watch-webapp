unit NEOWatch.WebApp.Presentation.Model.DTO.WSDashboard;

interface

type

  TWSDashboardDTO = class
  private
    FTitle: string;
    FSubtitle: string;

    FStatusText: string;
    FStatusCssClass: string;

    FCacheStatusText: string;
    FCacheStatusCssClass: string;

    FActiveTab: string;

    FApiInfoTitle: string;
    FApiInfoDescription: string;

    FSettingsTitle: string;

    function GetTitle: string;
    function GetSubtitle: string;
    function GetStatusText: string;
    function GetStatusCssClass: string;
    function GetCacheStatusText: string;
    function GetCacheStatusCssClass: string;
    function GetActiveTab: string;
    function GetApiInfoTitle: string;
    function GetApiInfoDescription: string;
    function GetSettingsTitle: string;

    procedure SetTitle(const Value: string);
    procedure SetSubtitle(const Value: string);
    procedure SetStatusText(const Value: string);
    procedure SetStatusCssClass(const Value: string);
    procedure SetCacheStatusText(const Value: string);
    procedure SetCacheStatusCssClass(const Value: string);
    procedure SetActiveTab(const Value: string);
    procedure SetApiInfoTitle(const Value: string);
    procedure SetApiInfoDescription(const Value: string);
    procedure SetSettingsTitle(const Value: string);

  published
    property Title: string read GetTitle write SetTitle;
    property Subtitle: string read GetSubtitle write SetSubtitle;

    property StatusText: string read GetStatusText write SetStatusText;
    property StatusCssClass: string read GetStatusCssClass write SetStatusCssClass;

    property CacheStatusText: string read GetCacheStatusText write SetCacheStatusText;
    property CacheStatusCssClass: string read GetCacheStatusCssClass write SetCacheStatusCssClass;

    property ActiveTab: string read GetActiveTab write SetActiveTab;

    property ApiInfoTitle: string read GetApiInfoTitle write SetApiInfoTitle;
    property ApiInfoDescription: string read GetApiInfoDescription write SetApiInfoDescription;

    property SettingsTitle: string read GetSettingsTitle write SetSettingsTitle;
  end;

implementation

{ TWSDashboardDTO }

function TWSDashboardDTO.GetActiveTab: string;
begin
  result := FActiveTab;
end;

function TWSDashboardDTO.GetApiInfoDescription: string;
begin
  result := FApiInfoDescription;
end;

function TWSDashboardDTO.GetApiInfoTitle: string;
begin
  result := FApiInfoTitle;
end;

function TWSDashboardDTO.GetCacheStatusCssClass: string;
begin
  result := FCacheStatusCssClass;
end;

function TWSDashboardDTO.GetCacheStatusText: string;
begin
  result := FCacheStatusText;
end;

function TWSDashboardDTO.GetSettingsTitle: string;
begin
  result := FSettingsTitle;
end;

function TWSDashboardDTO.GetStatusCssClass: string;
begin
  result := FStatusCssClass;
end;

function TWSDashboardDTO.GetStatusText: string;
begin
  result := FStatusText;
end;

function TWSDashboardDTO.GetSubtitle: string;
begin
  result := FSubtitle;
end;

function TWSDashboardDTO.GetTitle: string;
begin
  result := FTitle;
end;

procedure TWSDashboardDTO.SetActiveTab(const Value: string);
begin
  FActiveTab := Value;
end;

procedure TWSDashboardDTO.SetApiInfoDescription(const Value: string);
begin
  FApiInfoDescription := Value;
end;

procedure TWSDashboardDTO.SetApiInfoTitle(const Value: string);
begin
  FApiInfoTitle := Value;
end;

procedure TWSDashboardDTO.SetCacheStatusCssClass(const Value: string);
begin
  FCacheStatusCssClass := Value;
end;

procedure TWSDashboardDTO.SetCacheStatusText(const Value: string);
begin
  FCacheStatusText := Value;
end;

procedure TWSDashboardDTO.SetSettingsTitle(const Value: string);
begin
  FSettingsTitle := Value;
end;

procedure TWSDashboardDTO.SetStatusCssClass(const Value: string);
begin
  FStatusCssClass := Value;
end;

procedure TWSDashboardDTO.SetStatusText(const Value: string);
begin
  FStatusText := Value;
end;

procedure TWSDashboardDTO.SetSubtitle(const Value: string);
begin
  FSubtitle := Value;
end;

procedure TWSDashboardDTO.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

end.
