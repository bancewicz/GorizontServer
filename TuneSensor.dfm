object Form_SENSOR_Tune: TForm_SENSOR_Tune
  Left = 608
  Top = 299
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' '#1089#1080#1089#1090#1077#1084#1099' '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075#1072' ['#1076#1072#1090#1095#1080#1082']'
  ClientHeight = 451
  ClientWidth = 672
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
    Top = 408
    Width = 185
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Flat = True
    Transparent = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton_exit: TSpeedButton
    Left = 576
    Top = 408
    Width = 89
    Height = 33
    Caption = #1042#1099#1093#1086#1076
    Flat = True
    Transparent = False
    OnClick = SpeedButton_exitClick
  end
  object Button_apply: TButton
    Left = 296
    Top = 416
    Width = 41
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    Visible = False
    OnClick = Button_applyClick
  end
  object Button_save: TButton
    Left = 240
    Top = 416
    Width = 93
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    Visible = False
    OnClick = Button_saveClick
  end
  object Button_default: TButton
    Left = 312
    Top = 408
    Width = 41
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Enabled = False
    TabOrder = 2
    TabStop = False
    Visible = False
  end
  object Button_exit: TButton
    Left = 368
    Top = 416
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    Visible = False
    OnClick = Button_exitClick
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 12
    Width = 661
    Height = 389
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = #1041#1072#1079#1086#1074#1099#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnContextPopup = TabSheet1ContextPopup
      object Label1: TLabel
        Left = 28
        Top = 60
        Width = 86
        Height = 18
        Caption = #1058#1080#1087' '#1076#1072#1090#1095#1080#1082#1072
      end
      object Label_ac: TLabel
        Left = 536
        Top = 172
        Width = 221
        Height = 18
        Caption = #1048#1079#1084#1077#1088#1077#1085#1080#1077' '#1091#1089#1082#1086#1088#1077#1085#1080#1081' '#1074#1082#1083#1102#1095#1077#1085#1086
        Visible = False
      end
      object Label4: TLabel
        Left = 28
        Top = 108
        Width = 186
        Height = 18
        Caption = #1053#1086#1084#1077#1088' '#1076#1072#1090#1095#1080#1082#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1077
      end
      object Label5: TLabel
        Left = 28
        Top = 200
        Width = 165
        Height = 18
        Caption = #1054#1087#1088#1086#1089' '#1076#1072#1090#1095#1080#1082#1072' '#1074#1082#1083#1102#1095#1077#1085
      end
      object Label6: TLabel
        Left = 28
        Top = 156
        Width = 166
        Height = 18
        Caption = #1040#1076#1088#1077#1089' '#1076#1072#1090#1095#1080#1082#1072' '#1085#1072' '#1083#1080#1085#1080#1080
      end
      object Label8: TLabel
        Left = 32
        Top = 316
        Width = 34
        Height = 18
        Caption = #1055#1086#1088#1090
        Enabled = False
        Visible = False
      end
      object Label9: TLabel
        Left = 256
        Top = 312
        Width = 170
        Height = 18
        Caption = #1053#1086#1084#1077#1088' '#1076#1072#1090#1095#1080#1082#1072' '#1085#1072' '#1087#1086#1088#1090#1091
        Enabled = False
        Visible = False
      end
      object Label2: TLabel
        Left = 28
        Top = 16
        Width = 181
        Height = 18
        Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1077
      end
      object Label_accOn: TLabel
        Left = 28
        Top = 244
        Width = 220
        Height = 18
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1080#1079#1084#1077#1088#1077#1085#1080#1077' '#1091#1089#1082#1086#1088#1077#1085#1080#1103
      end
      object Image_sensor: TImage
        Left = 488
        Top = 120
        Width = 129
        Height = 129
      end
      object ComboBox_name: TComboBox
        Left = 284
        Top = 60
        Width = 253
        Height = 26
        ItemHeight = 18
        TabOrder = 0
        Text = #1040#1053'-'#1044'3'
        OnChange = ComboBox_nameChange
      end
      object CheckBox_ac: TCheckBox
        Left = 544
        Top = 132
        Width = 97
        Height = 17
        TabOrder = 1
        Visible = False
        OnClick = CheckBox_acClick
      end
      object ComboBox_gnum: TComboBox
        Left = 284
        Top = 104
        Width = 145
        Height = 26
        Enabled = False
        ItemHeight = 18
        TabOrder = 2
        Text = '1'
      end
      object CheckBox_on: TCheckBox
        Left = 284
        Top = 204
        Width = 97
        Height = 17
        TabOrder = 3
      end
      object ComboBox_adr: TComboBox
        Left = 284
        Top = 148
        Width = 145
        Height = 26
        ItemHeight = 18
        TabOrder = 4
        Text = '1'
      end
      object Edit3: TEdit
        Left = 80
        Top = 312
        Width = 157
        Height = 26
        Enabled = False
        TabOrder = 5
        Text = #1055#1086#1088#1090'1 [COM1]'
        Visible = False
      end
      object ComboBox4: TComboBox
        Left = 444
        Top = 312
        Width = 145
        Height = 26
        Enabled = False
        ItemHeight = 18
        TabOrder = 6
        Text = '1'
        Visible = False
      end
      object Edit_place: TEdit
        Left = 280
        Top = 12
        Width = 249
        Height = 26
        TabOrder = 7
        Text = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1077
      end
      object CheckBox_accelOn: TCheckBox
        Left = 284
        Top = 245
        Width = 25
        Height = 17
        TabOrder = 8
        OnClick = CheckBox_accelOnClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1077
      ImageIndex = 1
      object Label7: TLabel
        Left = 20
        Top = 20
        Width = 324
        Height = 18
        Caption = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088' '#1087#1077#1088#1074#1080#1095#1085#1086#1075#1086' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label_to: TLabel
        Left = 16
        Top = 132
        Width = 312
        Height = 18
        Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103' '#1085#1091#1083#1103' '#1076#1072#1090#1095#1080#1082#1072' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099', '#1075#1088#1072#1076'.'
      end
      object Label13: TLabel
        Left = 16
        Top = 164
        Width = 340
        Height = 18
        Caption = #1048#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1089#1100' Y '#1089#1080#1089#1090#1077#1084#1099' '#1082#1086#1086#1088#1076#1080#1085#1072#1090' '#1076#1072#1090#1095#1080#1082#1072
      end
      object Label14: TLabel
        Left = 16
        Top = 200
        Width = 304
        Height = 18
        Caption = #1059#1075#1086#1083' '#1074#1088#1072#1097#1077#1085#1080#1103' '#1089#1080#1089#1090#1077#1084#1099' '#1082#1086#1086#1088#1076#1080#1085#1072#1090' '#1076#1072#1090#1095#1080#1082#1072
      end
      object Label15: TLabel
        Left = 16
        Top = 229
        Width = 169
        Height = 18
        Caption = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1076#1072#1090#1095#1080#1082#1072
      end
      object Label16: TLabel
        Left = 16
        Top = 258
        Width = 172
        Height = 18
        Caption = #1044#1072#1090#1072' '#1102#1089#1090#1080#1088#1086#1074#1082#1080' '#1076#1072#1090#1095#1080#1082#1072
      end
      object Label17: TLabel
        Left = 16
        Top = 292
        Width = 206
        Height = 18
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      end
      object Edit_snd3: TEdit
        Left = 364
        Top = 16
        Width = 121
        Height = 26
        Enabled = False
        TabOrder = 0
        Text = '12345'
      end
      object GroupBox1: TGroupBox
        Left = 12
        Top = 52
        Width = 497
        Height = 69
        Caption = #1057#1084#1077#1097#1077#1085#1080#1077' '#1085#1091#1083#1103' '#1076#1072#1090#1095#1080#1082#1072' '#1087#1086#1089#1083#1077' '#1102#1089#1090#1080#1088#1086#1074#1082#1080', '#1091#1075#1083'. '#1089#1077#1082'.'
        TabOrder = 1
        object Label10: TLabel
          Left = 36
          Top = 32
          Width = 9
          Height = 18
          Caption = 'X'
        end
        object Label11: TLabel
          Left = 300
          Top = 28
          Width = 10
          Height = 18
          Caption = 'Y'
        end
        object Edit_xo: TEdit
          Left = 60
          Top = 28
          Width = 121
          Height = 26
          TabOrder = 0
          Text = '0'
        end
        object Edit_yo: TEdit
          Left = 348
          Top = 24
          Width = 121
          Height = 26
          TabOrder = 1
          Text = '0'
        end
      end
      object Edit_to: TEdit
        Left = 388
        Top = 128
        Width = 121
        Height = 26
        TabOrder = 2
        Text = '0'
      end
      object CheckBox_invy: TCheckBox
        Left = 388
        Top = 168
        Width = 97
        Height = 17
        TabOrder = 3
      end
      object Edit_rotx: TEdit
        Left = 388
        Top = 196
        Width = 121
        Height = 26
        TabOrder = 4
        Text = '0'
      end
      object Edit_setdata: TEdit
        Left = 388
        Top = 224
        Width = 121
        Height = 26
        TabOrder = 5
      end
      object Edit_adjdata: TEdit
        Left = 388
        Top = 252
        Width = 121
        Height = 26
        TabOrder = 6
      end
      object Edit_note: TEdit
        Left = 236
        Top = 288
        Width = 277
        Height = 26
        TabOrder = 7
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 620
    Top = 52
  end
end
