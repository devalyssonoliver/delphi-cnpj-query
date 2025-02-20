unit uCNPJApiClient;

interface

uses
  REST.Client,
  System.SysUtils,
  REST.Types,
  System.Classes,
  System.Net.HTTPClient;

type
  TCNPJApiClient = class
  private
    FRestClient: TRESTClient;
    FRestResponse: TRESTResponse;
    FRestRequest: TRESTRequest;
  public
    constructor Create;
    destructor Destroy; override;
    property  RestRequest: TRESTRequest  read FRestRequest write FRestRequest;
    function Requisicao(const ACNPJ: String; out AResposta: String): Boolean;
  end;

const
  CNPJ_API_URL = 'https://receitaws.com.br/v1/cnpj/%s';

implementation

{ TCNPJApiClient }

constructor TCNPJApiClient.Create;
begin
  inherited Create;
  FRestClient := TRESTClient.Create('');
  FRestRequest := TRESTRequest.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);

  if not Assigned(FRestClient)
    or not Assigned(FRestRequest)
    or not Assigned(FRestResponse) then
    raise Exception.Create('Erro ao inicializar os componentes REST.');

  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;

  FRestClient.SecureProtocols := [THTTPSecureProtocol.TLS12];
end;

destructor TCNPJApiClient.Destroy;
begin
  FRestResponse.Free;
  FRestRequest.Free;
  FRestClient.Free;
  inherited Destroy;
end;

function TCNPJApiClient.Requisicao(const ACNPJ: String; out AResposta: String): Boolean;
begin
  Result := False;
  AResposta := '';

  try
    FRestClient.BaseURL := Format(CNPJ_API_URL, [ACNPJ]);
    FRestRequest.Method := rmGET;

    FRestRequest.Execute;

    AResposta := FRestResponse.Content;
    Result := True;
  except
    on E: Exception do
    begin
      AResposta := 'Erro na requisição: ' + E.Message;
      Result := False;
    end;
  end;
end;

end.

