object Form_PORT_Tune: TForm_PORT_Tune
  Left = 386
  Top = 180
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' '#1089#1080#1089#1090#1077#1084#1099' '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075#1072' ['#1087#1086#1088#1090']'
  ClientHeight = 308
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 93
    Height = 18
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object Label2: TLabel
    Left = 12
    Top = 62
    Width = 164
    Height = 18
    Caption = #1053#1086#1084#1077#1088' '#1057#1054#1052'-'#1087#1086#1088#1090#1072' '#1074' '#1054#1057
  end
  object Label3: TLabel
    Left = 348
    Top = 64
    Width = 32
    Height = 18
    Caption = #1057#1054#1052
  end
  object Label4: TLabel
    Left = 12
    Top = 109
    Width = 118
    Height = 18
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1086#1073#1084#1077#1085#1072
  end
  object Label5: TLabel
    Left = 12
    Top = 156
    Width = 150
    Height = 18
    Caption = #1054#1087#1088#1086#1089' '#1087#1086#1088#1090#1072' '#1074#1082#1083#1102#1095#1077#1085
  end
  object Label6: TLabel
    Left = 12
    Top = 200
    Width = 214
    Height = 18
    Caption = #1063#1080#1089#1083#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1085#1099#1093' '#1076#1072#1090#1095#1080#1082#1086#1074
  end
  object Image_port: TImage
    Left = 484
    Top = 76
    Width = 133
    Height = 133
  end
  object SpeedButton_save: TSpeedButton
    Left = 8
    Top = 264
    Width = 169
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Flat = True
    Transparent = False
    OnClick = SpeedButton_saveClick
  end
  object SpeedButton_exit: TSpeedButton
    Left = 560
    Top = 264
    Width = 97
    Height = 33
    Caption = #1042#1099#1093#1086#1076
    Flat = True
    Transparent = False
    OnClick = SpeedButton_exitClick
  end
  object Button_apply: TButton
    Left = 324
    Top = 260
    Width = 97
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    Visible = False
    OnClick = Button_applyClick
  end
  object Button_save: TButton
    Left = 196
    Top = 260
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    TabOrder = 1
    Visible = False
    OnClick = Button_saveClick
  end
  object Button_default: TButton
    Left = 248
    Top = 260
    Width = 105
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Enabled = False
    TabOrder = 2
    Visible = False
  end
  object Button_exit: TButton
    Left = 428
    Top = 260
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    Visible = False
    OnClick = Button_exitClick
  end
  object ComboBox_com: TComboBox
    Left = 276
    Top = 60
    Width = 65
    Height = 26
    ItemHeight = 18
    TabOrder = 4
    Text = '1'
  end
  object ComboBox_baud: TComboBox
    Left = 276
    Top = 104
    Width = 145
    Height = 26
    ItemHeight = 18
    TabOrder = 5
    Text = '9600'
  end
  object CheckBox_on: TCheckBox
    Left = 288
    Top = 160
    Width = 97
    Height = 17
    TabOrder = 6
  end
  object ComboBox_name: TComboBox
    Left = 276
    Top = 16
    Width = 317
    Height = 26
    ItemHeight = 18
    TabOrder = 7
    Text = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1099#1081' '#1057#1054#1052'-'#1087#1086#1088#1090
  end
  object ComboBox_sensors_num: TComboBox
    Left = 276
    Top = 200
    Width = 145
    Height = 26
    Enabled = False
    ItemHeight = 18
    TabOrder = 8
    Text = '1'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 640
    Top = 228
  end
end
