unit uWebSrvCep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Cep, ComCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    edtCep: TEdit;
    lvRetorno: TListView;
    edtLogradouro: TEdit;
    Label1: TLabel;
    edtCidade: TEdit;
    edtUF: TEdit;
    pnMsg: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    spbPesquisa: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    edtUsuario: TEdit;
    Label7: TLabel;
    edtSenha: TEdit;
    function CustomSortProc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
    procedure spbPesquisaClick(Sender: TObject);
    procedure HabilitaCep(Habilita : Boolean = false);
    procedure edtLogradouroChange(Sender: TObject);
    procedure edtCepChange(Sender: TObject);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ColumnToSort: Integer;

implementation

{$R *.dfm}

function TForm1.CustomSortProc(Item1, Item2: TListItem;
  ParamSort: integer): integer;
begin
  Result := -CompareText(Item2.Caption,Item1.Caption);
end;

procedure TForm1.HabilitaCep(Habilita : Boolean = false);
Const
  CorDisable : TColor = clGray;
  CorEnable : TColor = clWindowText;
begin
  if Habilita then
  begin
      edtCep.Font.Color := CorEnable;
      edtLogradouro.Font.Color := CorDisable;
      edtCidade.Font.Color := CorDisable;
      edtUF.Font.Color := CorDisable;
  end
  else
  begin
      edtCep.Font.Color := CorDisable;
      edtLogradouro.Font.Color := CorEnable;
      edtCidade.Font.Color := CorEnable;
      edtUF.Font.Color := CorEnable;
  end;
end;

procedure TForm1.spbPesquisaClick(Sender: TObject);
var
  CEP :CEPServicePort;
  Dados : ArrayOfstring;
  i, x, p, p2 : integer;
  lvItem : TListItem;
  Dado1, Dado2 : string;
  Tempo, TempoIni, TempoFim : Real;
begin

  CEP := GetCEPServicePort();
  pnMsg.Caption := '';
  Application.ProcessMessages;
  if (edtCep.Text <> '') and (Pos(ActiveControl.Name, 'edtCep, edtUsuario, edtSenha') > 0) then
  begin
    if (Trim(edtCep.Text)='') or (Length(edtCep.Text)<>8) then
    begin
      Showmessage('Informe o CEP caso queira pesquisar por cep!');
      Exit;
    end;
    TempoIni := GetTickCount;
    SetLength(Dados,1);
    if (edtUsuario.Text <> '') and (edtSenha.Text <> '') then
      Dados[0] := CEP.obterLogradouroAuth(edtCep.Text, edtUsuario.Text, edtSenha.Text)
    else
      Dados[0] := CEP.obterLogradouro(edtCep.Text);
    TempoFim := GetTickCount;
    if (Pos(',',Dados[0])>0) then
      Dados[0] := edtCep.Text+','+dados[0];
    Tempo := TempoFim-TempoIni;
  end
  else
  begin
    if (Trim(edtLogradouro.Text)='') OR (Trim(edtCidade.Text)='') OR (Trim(edtUF.Text)='') then
    begin
      Showmessage('Os campos Logradouro, Cidade e UF são obrigatórios para pesquisa por logradouro!');
      exit;
    end;
    TempoIni := GetTickCount;
    if (edtUsuario.Text <> '') and (edtSenha.Text <> '') then
      Dados := CEP.obterCEPAuth(edtLogradouro.Text,edtCidade.Text,edtUF.Text, edtUsuario.Text, edtSenha.Text)
    else
      Dados := CEP.obterCEP(edtLogradouro.Text,edtCidade.Text,edtUF.Text);
    TempoFim := GetTickCount;
    Tempo := TempoFim-TempoIni;
  end;

  lvRetorno.Items.Clear;
  if (Dados[0] = 'Usuário ou senha inválidos') then
  begin
    Showmessage('Usuário ou senha inválidos!'#13'Contate o administrador do sistema!');
    exit;
  end
  else if (Pos(',',Dados[0]) = 0 ) then
  begin
    pnMsg.Caption := 'Logradouro/Cep não encontrado!';
    exit;
  end;

  pnMsg.Caption := 'Total de registros:'+IntToStr(Length(Dados))+' em '+FormatFloat('0.###',tempo/1000)+' segundos';

  for i:=0 to Length(Dados)-1 do
  begin
    lvItem := lvRetorno.Items.Add;
    lvItem.Caption := Copy(Dados[i],1,8);
    lvItem.SubItems.Clear;
    p := 10;
    For x:=0 to 4 do
    begin
        Dado1 :=Copy(Dados[i],p,Length(Dados[i]));
        p2 :=Pos(',',Dado1)-1;
        if  p2>0 then
          Dado2 :=Copy(Dado1,1,p2)
        else
          Dado2 := Dado1;
        lvItem.SubItems.Add(Dado2);
        p := p+Length(lvItem.SubItems.Strings[x])+1;
    end;
  end;

//  lvRetorno.CustomSort(@CustomSortProc, 1);



end;

procedure TForm1.edtLogradouroChange(Sender: TObject);
begin
  HabilitaCep();
end;

procedure TForm1.edtCepChange(Sender: TObject);
begin
  HabilitaCep(true);
end;

procedure TForm1.edtCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_RETURN then
      spbPesquisaClick(sender);
end;

procedure TForm1.edtUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    spbPesquisaClick(sender);
end;

end.
