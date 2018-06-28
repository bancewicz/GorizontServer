object Form_new_addr: TForm_new_addr
  Left = 751
  Top = 451
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1099#1081' '#1072#1076#1088#1077#1089' '#1048#1053'-'#1044'3'
  ClientHeight = 119
  ClientWidth = 259
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
  object Button_apply: TButton
    Left = 72
    Top = 48
    Width = 121
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button_applyClick
  end
  object Button_cancel: TButton
    Left = 72
    Top = 80
    Width = 121
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button_cancelClick
  end
  object ComboBox_new_addr: TComboBox
    Left = 72
    Top = 8
    Width = 121
    Height = 26
    ItemHeight = 18
    TabOrder = 2
  end
  object Timer_start: TTimer
    OnTimer = Timer_startTimer
    Left = 16
    Top = 40
  end
end
