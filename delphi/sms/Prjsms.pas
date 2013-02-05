// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.byjg.com.br/site/webservice.php/ws/sms?WSDL
// Encoding : utf-8
// Version  : 1.0
// (11/12/2009 13:48:05 - 1.33.2.5)
// ************************************************************************ //

unit Prjsms;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:http://www.byjg.com.br
  // soapAction: urn:SMSServiceAction
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SMSServiceBinding
  // service   : SMSService
  // port      : SMSServicePort
  // URL       : http://www.byjg.com.br/site/webservice.php/ws/sms
  // ************************************************************************ //
  SMSServicePort = interface(IInvokable)
  ['{BCC775BE-5423-B0E7-C1D7-9EE52D383604}']
    function  obterVersao: WideString; stdcall;
    function  enviarSMS(const ddd: WideString; const celular: WideString; const mensagem: WideString; const usuario: WideString; const senha: WideString): WideString; stdcall;
    function  enviarSMS2(const ddd: WideString; const celular: WideString; const mensagem: WideString; const usuario: WideString; const senha: WideString; const senderid: WideString): WideString; stdcall;
    function  enviarListaSMS(const lista: WideString; const mensagem: WideString; const usuario: WideString; const senha: WideString; const senderid: WideString): WideString; stdcall;
    function  recursos(const usuario: WideString; const senha: WideString): WideString; stdcall;
    function  creditos(const usuario: WideString; const senha: WideString): WideString; stdcall;
    function  enviarSMSInternacional(const codpais: WideString; const ddd: WideString; const celular: WideString; const mensagem: WideString; const usuario: WideString; const senha: WideString): WideString; stdcall;
  end;

function GetSMSServicePort(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SMSServicePort;


implementation

uses USms;

function GetSMSServicePort(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SMSServicePort;
const
  defWSDL = 'http://www.byjg.com.br/site/webservice.php/ws/sms?WSDL';
  defURL  = 'http://www.byjg.com.br/site/webservice.php/ws/sms';
  defSvc  = 'SMSService';
  defPrt  = 'SMSServicePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as SMSServicePort);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(SMSServicePort), 'urn:http://www.byjg.com.br', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SMSServicePort), 'urn:SMSServiceAction');

end.