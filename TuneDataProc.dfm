object Form_DataProc_Tune: TForm_DataProc_Tune
  Left = 574
  Top = 289
  Width = 573
  Height = 378
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077'  '#1076#1072#1085#1085#1099#1093
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
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 296
    Width = 169
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Flat = True
    Transparent = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 456
    Top = 296
    Width = 97
    Height = 33
    Caption = #1042#1099#1093#1086#1076
    Flat = True
    Transparent = False
    OnClick = SpeedButton2Click
  end
  object Button_save: TButton
    Left = 232
    Top = 300
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    Visible = False
    OnClick = Button_saveClick
  end
  object PC_DataProcAdjust: TPageControl
    Left = 0
    Top = 0
    Width = 557
    Height = 289
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      object Label1: TLabel
        Left = 36
        Top = 36
        Width = 198
        Height = 18
        Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1092#1072#1081#1083#1072#1093
      end
      object CheckBox_cansave: TCheckBox
        Left = 252
        Top = 37
        Width = 97
        Height = 17
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 36
        Top = 72
        Width = 445
        Height = 153
        Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1085#1085#1099#1093' '#1087#1086' '#1091#1089#1082#1086#1088#1077#1085#1080#1103#1084
        TabOrder = 1
        object Label2: TLabel
          Left = 184
          Top = 96
          Width = 246
          Height = 18
          Caption = #1063#1080#1089#1083#1086' '#1086#1090#1089#1095#1077#1090#1086#1074' '#1074' '#1092#1072#1081#1083#1077' '#1091#1089#1082#1086#1088#1077#1085#1080#1081
        end
        object RadioButton_bin: TRadioButton
          Left = 56
          Top = 32
          Width = 113
          Height = 17
          Caption = #1041#1080#1085#1072#1088#1085#1099#1081
          TabOrder = 0
          OnClick = RadioButton_binClick
        end
        object RadioButton_txt: TRadioButton
          Left = 56
          Top = 64
          Width = 113
          Height = 17
          Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081
          TabOrder = 1
          OnClick = RadioButton_txtClick
        end
        object CheckBox_saveacctxt: TCheckBox
          Left = 180
          Top = 64
          Width = 97
          Height = 17
          TabOrder = 2
          Visible = False
        end
        object ComboBox_ac_file_num: TComboBox
          Left = 56
          Top = 96
          Width = 105
          Height = 26
          ItemHeight = 18
          TabOrder = 3
          Text = 'ComboBox_ac_file_num'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      Enabled = False
      ImageIndex = 1
      TabVisible = False
      object GroupBox2: TGroupBox
        Left = 16
        Top = 16
        Width = 317
        Height = 225
        TabOrder = 0
        object Button1: TButton
          Left = 20
          Top = 32
          Width = 273
          Height = 25
          Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1075#1088#1072#1092#1080#1082#1086#1074
          Enabled = False
          TabOrder = 0
        end
        object Button2: TButton
          Left = 20
          Top = 92
          Width = 273
          Height = 25
          Caption = #1040#1085#1072#1083#1080#1079' '#1089#1087#1077#1082#1090#1088#1086#1074
          Enabled = False
          TabOrder = 1
        end
        object Button3: TButton
          Left = 20
          Top = 152
          Width = 273
          Height = 25
          Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1085#1072#1083#1080#1079
          Enabled = False
          TabOrder = 2
        end
      end
    end
  end
  object Button_exit: TButton
    Left = 320
    Top = 300
    Width = 49
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    Visible = False
    OnClick = Button_exitClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 448
    Top = 148
  end
end
