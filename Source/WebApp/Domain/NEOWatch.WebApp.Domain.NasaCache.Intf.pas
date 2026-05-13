unit NEOWatch.WebApp.Domain.NasaCache.Intf;

interface

uses
  Spring;

type
  INasaCache = interface(IInvokable)
    ['{1805259E-F830-453B-8DDE-908601AEC0A9}']

    function TryGet(const Key: string; out Value: string): Boolean;

    procedure SetValue(const Key: string; const Value: string; const TtlSeconds: Integer);
  end;

implementation

end.
