object Form_Interfaces: TForm_Interfaces
  Left = 535
  Top = 281
  Width = 570
  Height = 355
  Caption = #1042#1085#1077#1096#1085#1080#1077' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1099
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object PageControl1: TPageControl
    Left = 4
    Top = 8
    Width = 545
    Height = 273
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Modbus'
      object Label1: TLabel
        Left = 64
        Top = 44
        Width = 203
        Height = 18
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' Modbus'
      end
      object Label2: TLabel
        Left = 72
        Top = 96
        Width = 137
        Height = 18
        Caption = #1053#1086#1084#1077#1088' '#1087#1086#1090#1072' Modbus'
      end
      object CheckBox1: TCheckBox
        Left = 332
        Top = 48
        Width = 97
        Height = 17
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 332
        Top = 92
        Width = 121
        Height = 26
        TabOrder = 1
        Text = '502'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'OPC'
      ImageIndex = 1
      object Label3: TLabel
        Left = 72
        Top = 68
        Width = 204
        Height = 18
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' OPC DA'
      end
      object CheckBox2: TCheckBox
        Left = 340
        Top = 72
        Width = 97
        Height = 17
        TabOrder = 0
      end
    end
  end
  object Button_save: TButton
    Left = 384
    Top = 288
    Width = 165
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
  end
end
