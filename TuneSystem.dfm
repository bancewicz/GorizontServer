object Form_SYSTEM_Tune: TForm_SYSTEM_Tune
  Left = 530
  Top = 266
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' '#1089#1080#1089#1090#1077#1084#1099' '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075#1072' ['#1057#1080#1089#1090#1077#1084#1072']'
  ClientHeight = 451
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 18
  object SpeedButton_save: TSpeedButton
    Left = 8
    Top = 400
    Width = 201
    Height = 41
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Flat = True
    Transparent = False
    OnClick = SpeedButton_saveClick
    OnMouseMove = SpeedButton_saveMouseMove
  end
  object SpeedButton_exit: TSpeedButton
    Left = 560
    Top = 400
    Width = 89
    Height = 41
    Caption = #1042#1099#1093#1086#1076
    Flat = True
    Transparent = False
    OnClick = SpeedButton_exitClick
    OnMouseMove = SpeedButton_exitMouseMove
  end
  object Button_exit: TButton
    Left = 248
    Top = 400
    Width = 118
    Height = 41
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 0
    Visible = False
    OnClick = Button_exitClick
  end
  object PCTuneSystem: TPageControl
    Left = 1
    Top = 2
    Width = 657
    Height = 393
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1041#1072#1079#1086#1074#1099#1077
      OnContextPopup = TabSheet1ContextPopup
      object Label1: TLabel
        Left = 11
        Top = 12
        Width = 150
        Height = 18
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      end
      object Label2: TLabel
        Left = 11
        Top = 42
        Width = 93
        Height = 18
        Caption = #1048#1084#1103' '#1057#1080#1089#1090#1077#1084#1099
      end
      object Label3: TLabel
        Left = 11
        Top = 70
        Width = 168
        Height = 18
        Caption = #1063#1080#1089#1083#1086' '#1087#1086#1088#1090#1086#1074' '#1074' '#1089#1080#1089#1090#1077#1084#1077
      end
      object Label4: TLabel
        Left = 11
        Top = 102
        Width = 226
        Height = 18
        Caption = #1057#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1074' '#1090#1088#1077#1081' '#1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077
      end
      object Label5: TLabel
        Left = 11
        Top = 134
        Width = 229
        Height = 18
        Caption = #1053#1077' '#1087#1088#1077#1076#1091#1087#1088#1077#1078#1076#1072#1090#1100' '#1087#1088#1080' '#1079#1072#1082#1088#1099#1090#1080#1080
      end
      object Image_system: TImage
        Left = 424
        Top = 128
        Width = 153
        Height = 149
      end
      object Edit_program_title: TEdit
        Left = 256
        Top = 10
        Width = 351
        Height = 26
        TabOrder = 0
        Text = 'GorizontServer ('#1076#1077#1084#1086#1085#1089#1090#1088#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1088#1089#1080#1103')'
      end
      object Edit_system_name: TEdit
        Left = 256
        Top = 36
        Width = 351
        Height = 26
        TabOrder = 1
        Text = 'GorizontServer'
      end
      object ComboBox_system_ports_num: TComboBox
        Left = 256
        Top = 62
        Width = 115
        Height = 26
        ItemHeight = 18
        TabOrder = 2
        Text = '1'
      end
      object CheckBox_canhide: TCheckBox
        Left = 258
        Top = 104
        Width = 97
        Height = 17
        TabOrder = 3
      end
      object CheckBox_canclose: TCheckBox
        Left = 258
        Top = 134
        Width = 97
        Height = 17
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1077
      ImageIndex = 1
      TabVisible = False
      object PageControl1: TPageControl
        Left = -8
        Top = 16
        Width = 649
        Height = 345
        ActivePage = TabSheet4
        TabIndex = 0
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = #1057#1080#1089#1090#1077#1084#1072
          TabVisible = False
          object Label6: TLabel
            Left = 22
            Top = 40
            Width = 177
            Height = 18
            Caption = #1053#1086#1084#1077#1088' '#1087#1086#1088#1090#1072' Modbus TCP'
            Visible = False
          end
          object Label7: TLabel
            Left = 510
            Top = 48
            Width = 269
            Height = 18
            Caption = #1053#1086#1084#1077#1088' '#1087#1086#1088#1090#1072'  ADC24 TCP ('#1089#1083#1091#1078#1077#1073#1085#1099#1081')'
            Enabled = False
            Visible = False
          end
          object Label8: TLabel
            Left = 20
            Top = 184
            Width = 278
            Height = 18
            Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1101#1083#1077#1084#1077#1085#1090#1099
            Enabled = False
            Visible = False
          end
          object Label9: TLabel
            Left = 20
            Top = 208
            Width = 253
            Height = 18
            Caption = #1047#1072#1087#1091#1089#1082' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1082#1086#1087#1080#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          end
          object Label10: TLabel
            Left = 20
            Top = 232
            Width = 229
            Height = 18
            Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074' '#1092#1072#1081#1083#1072#1093
            Visible = False
          end
          object Label11: TLabel
            Left = 22
            Top = 68
            Width = 263
            Height = 18
            Caption = #1063#1080#1089#1083#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1074#1086'  '#1074#1082#1083#1072#1076#1082#1077' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
          end
          object Label12: TLabel
            Left = 22
            Top = 96
            Width = 261
            Height = 18
            Caption = #1059#1076#1072#1083#1103#1090#1100' '#1079#1072#1087#1080#1089#1077#1081' '#1087#1086#1089#1083#1077' '#1087#1077#1088#1077#1087#1086#1083#1085#1077#1085#1080#1103
          end
          object Label13: TLabel
            Left = 22
            Top = 124
            Width = 275
            Height = 18
            Caption = #1056#1072#1079#1084#1077#1088' '#1094#1080#1082#1083#1080#1095#1077#1089#1082#1086#1075#1086' '#1073#1091#1092#1077#1088#1072' ('#1087#1072#1082#1077#1090#1086#1074')'
          end
          object Label14: TLabel
            Left = 22
            Top = 152
            Width = 256
            Height = 18
            Caption = #1063#1080#1089#1083#1086' '#1080#1079#1084#1077#1088#1077#1085#1080#1081' '#1091#1089#1082#1086#1088#1077#1085#1080#1081' '#1074' '#1092#1072#1081#1083#1077
            Visible = False
          end
          object Label15: TLabel
            Left = 20
            Top = 256
            Width = 279
            Height = 18
            Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1076#1072#1090#1095#1080#1082#1077
            Enabled = False
            Visible = False
          end
          object Label16: TLabel
            Left = 20
            Top = 280
            Width = 204
            Height = 18
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' OPC DA'
            Enabled = False
            Visible = False
          end
          object Label35: TLabel
            Left = 22
            Top = 8
            Width = 203
            Height = 18
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' Modbus'
            Visible = False
          end
          object Edit_modbusTCP: TEdit
            Left = 324
            Top = 32
            Width = 97
            Height = 26
            TabOrder = 0
            Text = '502'
            Visible = False
          end
          object Edit2: TEdit
            Left = 508
            Top = 18
            Width = 97
            Height = 26
            Enabled = False
            TabOrder = 1
            Text = '503'
            Visible = False
          end
          object CheckBox_show_advanced: TCheckBox
            Left = 324
            Top = 188
            Width = 97
            Height = 17
            Enabled = False
            TabOrder = 2
            Visible = False
          end
          object CheckBox_can_copy: TCheckBox
            Left = 324
            Top = 208
            Width = 97
            Height = 17
            TabOrder = 3
          end
          object CheckBox_can_save: TCheckBox
            Left = 324
            Top = 232
            Width = 97
            Height = 17
            TabOrder = 4
            Visible = False
          end
          object ComboBox_records_memo_view: TComboBox
            Left = 324
            Top = 64
            Width = 97
            Height = 26
            ItemHeight = 18
            TabOrder = 5
            Text = '60'
          end
          object ComboBox_records_memo_delete: TComboBox
            Left = 324
            Top = 92
            Width = 97
            Height = 26
            ItemHeight = 18
            TabOrder = 6
            Text = '1'
          end
          object ComboBox_bufsize: TComboBox
            Left = 324
            Top = 120
            Width = 97
            Height = 26
            ItemHeight = 18
            TabOrder = 7
            Text = '8192'
          end
          object ComboBox_ac_file_num: TComboBox
            Left = 324
            Top = 148
            Width = 97
            Height = 26
            ItemHeight = 18
            TabOrder = 8
            Text = '2'
            Visible = False
          end
          object CheckBox_can_info: TCheckBox
            Left = 324
            Top = 256
            Width = 97
            Height = 17
            Enabled = False
            TabOrder = 9
            Visible = False
          end
          object CheckBox_opc_da: TCheckBox
            Left = 324
            Top = 280
            Width = 97
            Height = 17
            Enabled = False
            TabOrder = 10
            Visible = False
          end
          object CheckBox_canmodbus: TCheckBox
            Left = 324
            Top = 8
            Width = 97
            Height = 17
            TabOrder = 11
            Visible = False
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1058#1072#1081#1084#1077#1088#1099' ('#1084#1089')'
          ImageIndex = 1
          object Label17: TLabel
            Left = 32
            Top = 44
            Width = 396
            Height = 18
            Caption = #1055#1077#1088#1080#1086#1076' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1074#1080#1079#1091#1072#1083#1100#1085#1099#1093' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          end
          object Label18: TLabel
            Left = 32
            Top = 92
            Width = 192
            Height = 18
            Caption = #1055#1077#1088#1080#1086#1076' '#1086#1087#1088#1086#1089#1072' '#1057#1054#1052'-'#1087#1086#1088#1090#1086#1074
          end
          object Label19: TLabel
            Left = 32
            Top = 140
            Width = 301
            Height = 18
            Caption = #1042#1088#1077#1084#1103' '#1080#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1080' '#1088#1077#1089#1091#1088#1089#1086#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          end
          object Label20: TLabel
            Left = 32
            Top = 196
            Width = 291
            Height = 18
            Caption = #1055#1077#1088#1080#1086#1076' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1074' '#1092#1072#1081#1083#1072#1093
          end
          object ComboBox_timers_update_int: TComboBox
            Left = 436
            Top = 44
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 0
            Text = 'ComboBox_timers_update_int'
          end
          object ComboBox_timers_run: TComboBox
            Left = 436
            Top = 88
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 1
            Text = 'ComboBox_timers_run'
          end
          object ComboBox_timers_start: TComboBox
            Left = 436
            Top = 140
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 2
            Text = 'ComboBox_timers_start'
          end
          object ComboBox_timers_save: TComboBox
            Left = 436
            Top = 192
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 3
            Text = 'ComboBox_timers_save'
          end
        end
        object TabSheet5: TTabSheet
          Caption = #1055#1072#1091#1079#1099' ('#1084#1089')'
          ImageIndex = 2
          object Label21: TLabel
            Left = 40
            Top = 20
            Width = 204
            Height = 18
            Caption = #1050#1074#1072#1085#1090' '#1074#1088#1077#1084#1077#1085#1080' '#1076#1083#1103' '#1079#1072#1076#1077#1088#1078#1077#1082
          end
          object Label22: TLabel
            Left = 40
            Top = 54
            Width = 309
            Height = 18
            Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1087#1086#1089#1083#1077' '#1085#1077#1091#1076#1072#1095#1085#1086#1075#1086' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1087#1086#1088#1090#1072
          end
          object Label23: TLabel
            Left = 40
            Top = 89
            Width = 225
            Height = 18
            Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1087#1086#1089#1083#1077' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1087#1086#1088#1090#1072
          end
          object Label24: TLabel
            Left = 40
            Top = 124
            Width = 366
            Height = 18
            Caption = #1042#1088#1077#1084#1103' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1103' '#1088#1077#1089#1091#1088#1089#1086#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          end
          object Label31: TLabel
            Left = 40
            Top = 168
            Width = 185
            Height = 18
            Caption = #1055#1072#1091#1079#1072' '#1087#1086#1089#1083#1077' '#1089#1084#1077#1085#1099' '#1072#1076#1088#1077#1089#1072
          end
          object Label32: TLabel
            Left = 40
            Top = 200
            Width = 193
            Height = 18
            Caption = #1055#1072#1091#1079#1072' '#1087#1077#1088#1077#1076' '#1094#1080#1082#1083#1086#1084' '#1086#1087#1088#1086#1089#1072
          end
          object Label33: TLabel
            Left = 40
            Top = 232
            Width = 194
            Height = 18
            Caption = #1055#1072#1091#1079#1072' '#1087#1086#1089#1083#1077' '#1086#1096#1080#1073#1082#1080' '#1095#1090#1077#1085#1080#1103
          end
          object Label34: TLabel
            Left = 40
            Top = 264
            Width = 173
            Height = 18
            Caption = #1055#1072#1091#1079#1072' '#1087#1086#1089#1083#1077' '#1086#1096#1080#1073#1082#1080' CRC'
          end
          object ComboBox_pauses_tick: TComboBox
            Left = 424
            Top = 16
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 0
            Text = 'ComboBox_pauses_tick'
          end
          object ComboBox_pauses_reopen: TComboBox
            Left = 424
            Top = 48
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 1
            Text = 'ComboBox_pauses_reopen'
          end
          object ComboBox_pauses_close: TComboBox
            Left = 424
            Top = 80
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 2
            Text = 'ComboBox_pauses_close'
          end
          object ComboBox_pauses_exit: TComboBox
            Left = 424
            Top = 116
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 3
            Text = 'ComboBox_pauses_exit'
          end
          object ComboBox_pause_addr: TComboBox
            Left = 424
            Top = 164
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 4
            Text = 'ComboBox_pause_addr'
          end
          object ComboBox_pause_cycle: TComboBox
            Left = 424
            Top = 196
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 5
            Text = 'ComboBox_pause_cycle'
          end
          object ComboBox_pause_r: TComboBox
            Left = 424
            Top = 228
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 6
            Text = 'ComboBox_pause_r'
          end
          object ComboBox_pause_c: TComboBox
            Left = 424
            Top = 260
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 7
            Text = 'ComboBox_pause_c'
          end
        end
        object TabSheet6: TTabSheet
          Caption = #1058#1072#1081#1084#1072#1091#1090#1099' ('#1084#1089')'
          ImageIndex = 3
          object Label25: TLabel
            Left = 40
            Top = 40
            Width = 216
            Height = 18
            Caption = #1063#1090#1077#1085#1080#1077' '#1082#1086#1084#1072#1085#1076#1099' '#1080#1079' '#1057#1054#1052'-'#1087#1086#1088#1090#1072
          end
          object Label26: TLabel
            Left = 40
            Top = 88
            Width = 198
            Height = 18
            Caption = #1047#1072#1087#1080#1089#1100' '#1082#1086#1084#1072#1085#1076#1099' '#1074' '#1057#1054#1052'-'#1087#1086#1088#1090
          end
          object Label27: TLabel
            Left = 40
            Top = 136
            Width = 207
            Height = 18
            Caption = #1063#1090#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1057#1054#1052'-'#1087#1086#1088#1090#1072
          end
          object Label28: TLabel
            Left = 40
            Top = 184
            Width = 189
            Height = 18
            Caption = #1047#1072#1087#1080#1089#1100' '#1076#1072#1085#1085#1099#1093' '#1074' '#1057#1054#1052'-'#1087#1086#1088#1090
          end
          object ComboBox_tout_rcom: TComboBox
            Left = 320
            Top = 36
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 0
            Text = 'ComboBox_tout_rcom'
          end
          object ComboBox_tout_wcom: TComboBox
            Left = 320
            Top = 84
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 1
            Text = 'ComboBox_tout_wcom'
          end
          object ComboBox_tout_rdat: TComboBox
            Left = 320
            Top = 136
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 2
            Text = 'ComboBox_tout_rdat'
          end
          object ComboBox_tout_wdat: TComboBox
            Left = 320
            Top = 180
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 3
            Text = 'ComboBox_tout_wdat'
          end
        end
        object TabSheet7: TTabSheet
          Caption = #1054#1096#1080#1073#1082#1080
          ImageIndex = 4
          object Label29: TLabel
            Left = 60
            Top = 76
            Width = 319
            Height = 18
            Caption = #1055#1086#1088#1086#1075' '#1076#1083#1103' '#1074#1099#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1092#1083#1072#1075#1072' '#1086#1096#1080#1073#1086#1082' '#1095#1090#1077#1085#1080#1103
          end
          object Label30: TLabel
            Left = 60
            Top = 156
            Width = 298
            Height = 18
            Caption = #1055#1086#1088#1086#1075' '#1076#1083#1103' '#1074#1099#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1092#1083#1072#1075#1072' '#1086#1096#1080#1073#1086#1082' CRC'
          end
          object ComboBox_rerr: TComboBox
            Left = 428
            Top = 72
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 0
            Text = 'ComboBox_rerr'
          end
          object ComboBox_cerr: TComboBox
            Left = 428
            Top = 144
            Width = 145
            Height = 26
            ItemHeight = 18
            TabOrder = 1
            Text = 'ComboBox_cerr'
          end
        end
      end
    end
  end
  object Button_save: TButton
    Left = 376
    Top = 408
    Width = 188
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    Visible = False
    OnClick = Button_saveClick
  end
  object Button_apply: TButton
    Left = 363
    Top = 408
    Width = 99
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    Visible = False
    OnClick = Button_applyClick
  end
  object Button_default: TButton
    Left = 488
    Top = 400
    Width = 45
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 4
    Visible = False
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 540
    Top = 400
  end
  object ImageList1: TImageList
    Left = 16
    Top = 332
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002020200000000000202
      0200000000003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003030300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020202000000000001010100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000F07B000000000000F883000000000000C137000000000000
      DF77000000000000DF77000000000000C48F000000000000D3FF000000000000
      DBEF000000000000DFEF000000000000C00F000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end