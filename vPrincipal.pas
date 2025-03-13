unit vPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, System.RegularExpressions, uCNPJApiClient, uCNPJDataFiller,
  System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    pnlMeio: TPanel;
    pnlCampos: TPanel;
    medtCNPJ: TMaskEdit;
    lblCNPJTitle: TLabel;
    pbConsulta: TProgressBar;
    edtNome: TEdit;
    edtCnpj_raiz: TEdit;
    edtCEP: TEdit;
    edtSituacao: TEdit;
    edtCapital_social: TEdit;
    edtResponsavel_federativo: TEdit;
    edtPorte: TEdit;
    edtNatureza_juridica: TEdit;
    edtQualificacao_do_responsavel: TEdit;
    mmoLog: TMemo;
    Nome: TLabel;
    CNPJ: TLabel;
    CEP: TLabel;
    lblSitua��o: TLabel;
    CapitalSocial: TLabel;
    Respfederativo: TLabel;
    lPorte: TLabel;
    NatJuridica: TLabel;
    lblQualiRespons: TLabel;
    lblLOGS: TLabel;
    btnConsultar: TBitBtn;
    illist: TImageList;
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
    ShowMessage('Informe um CNPJ v�lido.');
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
  jsValues: TJSONObject;
  DataFiller: TCNPJDataFiller;
begin
  jsValues := FApiCliente.RestRequest.Response.JSONValue as TJSONObject;

  if Assigned(jsValues) then
  begin
    DataFiller := TCNPJDataFiller.Create(jsValues);
    try
      DataFiller.PreencherCampos(
        edtNome, edtSituacao, edtCEP, edtCnpj_raiz, edtCapital_social,
        edtResponsavel_federativo, edtPorte, edtNatureza_juridica,
        edtQualificacao_do_responsavel, mmoLog
      );
    finally
      DataFiller.Free;
    end;
  end;
end;

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
begin
  CarregarDadosCNPJ;
end;

end.

