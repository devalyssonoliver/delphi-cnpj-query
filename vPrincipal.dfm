object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 441
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 3
    Align = alTop
    Color = clBlue
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 624
  end
  object pnlMeio: TPanel
    Left = 0
    Top = 3
    Width = 532
    Height = 438
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    StyleName = 'Windows'
    ExplicitTop = 8
    ExplicitWidth = 764
    ExplicitHeight = 546
    object Nome: TLabel
      Left = 16
      Top = 94
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object CNPJ: TLabel
      Left = 16
      Top = 136
      Width = 27
      Height = 17
      Caption = 'CNPJ'#13#10
    end
    object CEP: TLabel
      Left = 143
      Top = 136
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object lblSituação: TLabel
      Left = 270
      Top = 136
      Width = 45
      Height = 15
      Caption = 'Situac'#227'o'
    end
    object CapitalSocial: TLabel
      Left = 397
      Top = 136
      Width = 71
      Height = 30
      Caption = 'Capital Social'#13#10
    end
    object Respfederativo: TLabel
      Left = 16
      Top = 175
      Width = 71
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Capital Social'#13#10
    end
    object lPorte: TLabel
      Left = 143
      Top = 175
      Width = 28
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Porte'
    end
    object NatJuridica: TLabel
      Left = 270
      Top = 175
      Width = 62
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Nat.Juridica'
    end
    object lblQualiRespons: TLabel
      Left = 397
      Top = 175
      Width = 96
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Quali.Responsavel'
    end
    object lblLOGS: TLabel
      Left = 16
      Top = 230
      Width = 26
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'LOG:'
    end
    object pnlCampos: TPanel
      Left = 0
      Top = 0
      Width = 532
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 624
      object lblCNPJTitle: TLabel
        Left = 16
        Top = 5
        Width = 111
        Height = 17
        Caption = 'Digite o CNPJ aqui:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenu
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object medtCNPJ: TMaskEdit
        Left = 16
        Top = 24
        Width = 143
        Height = 25
        EditMask = '00\.000\.000/0000\-99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 0
        Text = '  .   .   /    -  '
        StyleName = 'Windows'
      end
      object btnConsultar: TButton
        Left = 165
        Top = 25
        Width = 85
        Height = 25
        Caption = 'CONSULTAR'
        TabOrder = 1
        StyleName = 'Windows'
        OnClick = btnConsultarClick
      end
      object btnGerarCSV: TButton
        Left = 256
        Top = 25
        Width = 92
        Height = 25
        Caption = 'Arquivo CSV'
        TabOrder = 2
      end
    end
    object pbConsulta: TProgressBar
      Left = 0
      Top = 421
      Width = 532
      Height = 17
      Align = alBottom
      TabOrder = 5
      ExplicitTop = 424
      ExplicitWidth = 624
    end
    object edtCnpj_raiz: TEdit
      Left = 16
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object edtNome: TEdit
      Left = 16
      Top = 107
      Width = 502
      Height = 23
      TabOrder = 1
    end
    object edtCEP: TEdit
      Left = 143
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object edtSituacao: TEdit
      Left = 270
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 4
    end
    object edtCapital_social: TEdit
      Left = 397
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 6
    end
    object edtResponsavel_federativo: TEdit
      Left = 16
      Top = 187
      Width = 121
      Height = 23
      TabOrder = 7
    end
    object edtPorte: TEdit
      Left = 143
      Top = 187
      Width = 121
      Height = 23
      TabOrder = 8
    end
    object edtNatureza_juridica: TEdit
      Left = 270
      Top = 187
      Width = 121
      Height = 23
      TabOrder = 9
    end
    object edtQualificacao_do_responsavel: TEdit
      Left = 397
      Top = 187
      Width = 121
      Height = 23
      TabOrder = 10
    end
    object mmoLog: TMemo
      Left = 16
      Top = 248
      Width = 502
      Height = 121
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        'mmoLog')
      TabOrder = 11
    end
  end
end
