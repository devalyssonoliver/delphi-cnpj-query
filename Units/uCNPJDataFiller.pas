unit uCNPJDataFiller;

interface

uses
  Vcl.StdCtrls, System.JSON, System.SysUtils;

type
  TCNPJDataFiller = class
  private
    FJSONData: TJSONObject;
  public
    constructor Create(AJSONData: TJSONObject);
    procedure PreencherCampos(
  ANome, ASituacao, ACEP, ACnpjRaiz, ACapitalSocial, AResponsavelFederativo,
  APorte, ANaturezaJuridica, AQualificacaoResponsavel: TEdit; AMemoErroConsulta: TMemo
);
  end;

implementation

{ TCNPJDataFiller }

constructor TCNPJDataFiller.Create(AJSONData: TJSONObject);
begin
  FJSONData := AJSONData;
end;

procedure TCNPJDataFiller.PreencherCampos(
  ANome, ASituacao, ACEP, ACnpjRaiz, ACapitalSocial, AResponsavelFederativo,
  APorte, ANaturezaJuridica, AQualificacaoResponsavel: TEdit; AMemoErroConsulta: TMemo
);
begin
  try

    ANome.Text := FJSONData.GetValue<string>('nome');
    ASituacao.Text := FJSONData.GetValue<string>('situacao');
    ACEP.Text := FJSONData.GetValue<string>('cep');
    ACnpjRaiz.Text := FJSONData.GetValue<string>('cnpj');
    ACapitalSocial.Text := FJSONData.GetValue<string>('capital_social');
    AResponsavelFederativo.Text := FJSONData.GetValue<string>('natureza_juridica');
    APorte.Text := FJSONData.GetValue<string>('porte');
    ANaturezaJuridica.Text := FJSONData.GetValue<string>('telefone');
    AQualificacaoResponsavel.Text := FJSONData.GetValue<string>('complemento');



    AMemoErroConsulta.Clear;

  except
    on E: Exception do
    begin
      AMemoErroConsulta.Lines.Add('Erro ao preencher dados: ' + E.Message);
    end;
  end;
end;

end.
