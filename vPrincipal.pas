unit vPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, System.RegularExpressions, uCNPJApiClient;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    pnlMeio: TPanel;
    pnlCampos: TPanel;
    medtCNPJ: TMaskEdit;
    lblCNPJTitle: TLabel;
    btnConsultar: TButton;
    pbConsulta: TProgressBar;
    edtNome: TEdit;
    edtCNPJ: TEdit;
    edtSituacao: TEdit;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Edit1: TEdit;
    Edit2: TEdit;
    edtCEP: TEdit;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FApiCliente: TCNPJApiClient;
    procedure CarregarDadosCNPJ;
    procedure PreencherValoresEdit;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
uses JSON;

{$R *.dfm}

procedure TfrmPrincipal.CarregarDadosCNPJ;
var
  t: TThread;
  lCNPJ: String;
begin
  lCNPJ := Trim(medtCNPJ.Text);
  lCNPJ := TRegEx.Replace(lCNPJ, '\D', '');

  if lCNPJ = '' then
  begin
    ShowMessage('Informe um CNPJ válido.');
    Exit;
  end;

  t := TThread.CreateAnonymousThread(
    procedure
    var
      lResposta: String;
    begin
      try
        TThread.Synchronize(nil,
          procedure
          begin
            pbConsulta.Position := 0;
            pbConsulta.Visible := True;
            pbConsulta.Position := 50;
          end);

        FApiCliente.Requisicao(lCNPJ, lResposta);

        TThread.Synchronize(nil,
          procedure
          begin
            pbConsulta.Position := 100;
           // mmoCONSULTA.Lines.Clear;
            //mmoCONSULTA.Lines.Add(lResposta);
            PreencherValoresEdit;
          end);
      except
        on E: Exception do
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              pbConsulta.Visible := False;
              ShowMessage('Erro ao consultar CNPJ: ' + E.Message);
            end);
        end;
      end;

      TThread.Synchronize(nil,
        procedure
        begin
          pbConsulta.Visible := False;
        end);
    end
  );

  t.Start;
end;


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FApiCliente := TCNPJApiClient.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin

  FreeAndNil(FApiCliente);
end;

procedure TfrmPrincipal.PreencherValoresEdit;
var
 jsValues : TJsonObject;
begin
  //testes
  jsvalues := FApiCliente.RestRequest.Response.JSONValue as TJsonObject;
   edtNome.Text := jsValues.Values['fantasia'].ToString;
   edtSituacao.Text := jsValues.Values['situacao'].ToString;
   edtCEP.Text := jsValues.Values['cep'].ToString;
   edtCNPJ.Text := jsvalues.values['cnpj'].ToString;
end;

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
begin
    CarregarDadosCNPJ;
end;

end.

