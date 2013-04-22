object Form1: TForm1
  Left = 272
  Top = 208
  Caption = 'Pesquisa de Endere'#231'o'
  ClientHeight = 347
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 13
    Width = 54
    Height = 13
    Caption = 'Logradouro'
  end
  object Label2: TLabel
    Left = 26
    Top = 36
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label3: TLabel
    Left = 45
    Top = 59
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object Label4: TLabel
    Left = 39
    Top = 81
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object spbPesquisa: TSpeedButton
    Left = 175
    Top = 74
    Width = 89
    Height = 22
    Caption = 'Pesquisar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333300
      3333333333333333FF333333333330EC033333333333333FE7F3330000000ECC
      00333333FFFFFFFE77FF33033330ECC330333333F8888FE7788F330FFF0ECC3F
      30333333F333FE77838F3300003CC3FF30333333FFFF8778338F303E30003FFF
      3033333F8E8FFF83338F0FE3E303FFFF303333F3E8E8F833338F0EFE3E03FFFF
      303333FE3E8EF833338F0FEFE303FFFF303333F3E3E8F833338F30FEF03FFFFF
      3033333F3E3F8333338F330003FFFFFF30333333FFF83333338F330FFFFFFF00
      00333333F3333333FFFF330FFFFFFF3F03333333F333333383F3330FFFFFFF30
      33333333F33333338F3333000000000333333333FFFFFFFFF333}
    NumGlyphs = 2
    OnClick = spbPesquisaClick
  end
  object Label5: TLabel
    Left = 271
    Top = 8
    Width = 374
    Height = 91
    Caption = 
      'Obs:'#13'N'#227'o use acentua'#231#227'o na pesquisa;'#13'Mai'#250'sculo e Minisc'#250'lo n'#227'o i' +
      'nterferem no resultado;'#13'Para pesquisa por logradouro os campos C' +
      'idade e UF tambem s'#227'o obrigat'#243'rios;'#13'Para pesquisa por cep os dem' +
      'ais campos ser'#227'o desconsiderados.'#13#13'* Somente a pesquisa autentic' +
      'ada retornar'#225' o c'#243'digo do munic'#237'pio IBGE.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 22
    Top = 105
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label7: TLabel
    Left = 27
    Top = 129
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object edtCep: TEdit
    Left = 63
    Top = 77
    Width = 58
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    OnChange = edtCepChange
    OnKeyDown = edtCepKeyDown
  end
  object lvRetorno: TListView
    Left = 0
    Top = 178
    Width = 773
    Height = 169
    Align = alBottom
    Columns = <
      item
        Caption = 'CEP'
        Width = 60
      end
      item
        Caption = 'Logradouro'
        Width = 230
      end
      item
        Caption = 'Bairro'
        Width = 150
      end
      item
        Caption = 'Cidade'
        Width = 150
      end
      item
        Caption = 'UF'
        Width = 40
      end
      item
        Caption = 'C'#243'd. Munic'#237'po IBGE'
        Width = 120
      end>
    RowSelect = True
    ShowWorkAreas = True
    SortType = stText
    TabOrder = 3
    ViewStyle = vsReport
    ExplicitWidth = 800
  end
  object edtLogradouro: TEdit
    Left = 63
    Top = 10
    Width = 202
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    OnChange = edtLogradouroChange
    OnKeyDown = edtUFKeyDown
  end
  object edtCidade: TEdit
    Left = 63
    Top = 33
    Width = 201
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    OnChange = edtLogradouroChange
    OnKeyDown = edtUFKeyDown
  end
  object edtUF: TEdit
    Left = 63
    Top = 55
    Width = 22
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    OnChange = edtLogradouroChange
    OnKeyDown = edtUFKeyDown
  end
  object pnMsg: TPanel
    Left = 0
    Top = 151
    Width = 773
    Height = 27
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 7
    ExplicitWidth = 800
  end
  object edtUsuario: TEdit
    Left = 63
    Top = 101
    Width = 201
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    OnChange = edtCepChange
    OnKeyDown = edtCepKeyDown
  end
  object edtSenha: TEdit
    Left = 63
    Top = 125
    Width = 201
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    PasswordChar = '*'
    TabOrder = 2
    OnChange = edtCepChange
    OnKeyDown = edtCepKeyDown
  end
end
