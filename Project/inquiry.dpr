program inquiry;

uses
  Vcl.Forms,
  vPrincipal in '..\vPrincipal.pas' {frmPrincipal},
  uCNPJApiClient in '..\Units\uCNPJApiClient.pas',
  uCNPJDataFiller in '..\Units\uCNPJDataFiller.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 White Smoke');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
