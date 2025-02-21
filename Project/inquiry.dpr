program inquiry;

uses
  Vcl.Forms,
  vPrincipal in '..\vPrincipal.pas' {frmPrincipal},
  uCNPJApiClient in '..\Units\uCNPJApiClient.pas',
  uCNPJDataFiller in '..\Units\uCNPJDataFiller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
