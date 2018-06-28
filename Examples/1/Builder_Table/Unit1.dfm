object Form1: TForm1
  Left = 310
  Top = 156
  Width = 658
  Height = 525
  Caption = #1058#1072#1073#1083#1080#1094#1072
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    650
    491)
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 441
    Height = 390
    Anchors = [akLeft, akTop, akBottom]
    ColCount = 2
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    OnSetEditText = StringGrid1SetEditText
  end
  object Panel1: TPanel
    Left = 446
    Top = 0
    Width = 203
    Height = 390
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
    object Button1: TButton
      Left = 28
      Top = 16
      Width = 146
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 28
      Top = 48
      Width = 146
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 28
      Top = 86
      Width = 146
      Height = 24
      MaxLength = 30
      TabOrder = 2
    end
    object Button3: TButton
      Left = 28
      Top = 112
      Width = 146
      Height = 25
      Caption = #1053#1072#1081#1090#1080' '#1076#1072#1083#1077#1077
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 28
      Top = 177
      Width = 146
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 28
      Top = 229
      Width = 146
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 5
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 28
      Top = 262
      Width = 146
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 6
      OnClick = Button6Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 504
    Top = 408
  end
  object SaveDialog1: TSaveDialog
    Left = 528
    Top = 408
  end
end
