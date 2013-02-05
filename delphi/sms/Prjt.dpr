program Prjt;

uses
  Forms,
  USms in 'USms.pas' {Form1},
  Prjsms in 'Prjsms.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Envio de Sms';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
