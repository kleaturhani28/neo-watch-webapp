unit NEOWatch.WebApp.CommandLine;

interface

uses
  Fido.Immutable,
  IOUtils,
  System.DateUtils,
  SysUtils,
  Spring;

type
  IRunOptions = interface(IInvokable)
    ['{E376A3C3-A9E5-4AD2-9357-EA3553FA6616}']
    function RunWithGUI: Boolean;
    procedure SetRunWithGUI(const Value: Boolean);
    function Line: Integer;
    procedure SetLine(const Value: Integer);
  end;

  TRunOptions = class(TInterfacedObject, IRunOptions)
  private
    FRunWithGUI: TImmutable<Boolean>;
    FLine: Integer;
  public
    function RunWithGUI: Boolean;
    procedure SetRunWithGUI(const Value: Boolean);
    function Line: Integer;
    procedure SetLine(const Value: Integer);
  end;

  IHelpOptions = interface(IInvokable)
    ['{7FB92FE7-F6C9-48B3-B6C4-225AF97FF583}']
    function HelpCommand: string;
    procedure SetHelpCommand(const Value: string);
  end;

  THelpOptions = class(TInterfacedObject, IHelpOptions)
  private
    FHelpCommand: TImmutable<string>;
  public
    function HelpCommand: string;
    procedure SetHelpCommand(const Value: string);
  end;

  IConfigOptions = interface(IInvokable)
    ['{3A036495-7E63-451A-89ED-5AE06DBCAD00}']
    function IniFileName: string;
    function LogFileName: string;
    procedure SetIniFileName(const Value: string);
    procedure SetLogFileName(const Value: string);
  end;

  TConfigOptions = class(TInterfacedObject, IConfigOptions)
  private
    FIniFileName: TImmutable<string>;
    FLogFileName: TImmutable<string>;
  public
    function IniFileName: string;
    function LogFileName: string;
    procedure SetIniFileName(const Value: string);
    procedure SetLogFileName(const Value: string);
  end;

implementation

{ THelpOptions }

function THelpOptions.HelpCommand: string;
begin
  result := FHelpCommand;
end;

procedure THelpOptions.SetHelpCommand(const Value: string);
begin
  FHelpCommand := Value;
end;

function TConfigOptions.IniFileName: string;
begin
  if string(FIniFileName).Trim.IsEmpty then
    result := TPath.ChangeExtension(TPath.Combine(TPath.GetLibraryPath, TPath.GetFileName(ParamStr(0))), '.ini')
  else
    result := FIniFileName;
end;

function TConfigOptions.LogFileName: string;
begin
  if string(FLogFileName).Trim.IsEmpty then
    result := TPath.ChangeExtension(TPath.Combine(TPath.GetLibraryPath, TPath.GetFileName(ParamStr(0))), '.log')
  else
    result := FLogFileName;
end;

procedure TConfigOptions.SetIniFileName(const Value: string);
begin
  FIniFileName := Value;
end;

procedure TConfigOptions.SetLogFileName(const Value: string);
begin
  FLogFileName := Value;
end;

{ TRunOptions }

function TRunOptions.Line: Integer;
begin
  result := FLine;
end;

function TRunOptions.RunWithGUI: Boolean;
begin
  result := FRunWithGUI;
end;

procedure TRunOptions.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TRunOptions.SetRunWithGUI(const Value: Boolean);
begin
  FRunWithGUI := Value;
end;

end.
