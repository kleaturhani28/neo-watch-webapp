unit NEOWatch.WebApp.Presentation.Service.DTO.Authorizations;

interface

uses
  System.Generics.Collections,
  System.SysUtils;

type
  TWSAuthorizationsDTO = class

  private
    Dict: TDictionary<string, Boolean>;
    procedure SetItems(const Name: string; const Value: Boolean);
  public
    function Can(const Name: string): Boolean;

    property Items[const Name: string]: Boolean read Can write SetItems; default;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TWSAuthorizationsDTO.Create;
begin
  inherited Create;
  Dict := TDictionary<string, Boolean>.Create;
end;

destructor TWSAuthorizationsDTO.Destroy;
begin
  Dict.Free;
  inherited;
end;

function TWSAuthorizationsDTO.Can(const Name: string): Boolean;
begin
  Result := False;
  if Dict.ContainsKey(Name.Trim.toUpper) then
    Result := Dict[Name.Trim.toUpper];
end;

procedure TWSAuthorizationsDTO.SetItems(const Name: string; const Value: Boolean);
begin
  if Dict.ContainsKey(Name) then
    Dict[Name] := Value
  else
    Dict.Add(Name, Value);
end;

end.

