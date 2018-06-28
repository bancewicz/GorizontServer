object FChartDlg: TFChartDlg
  Left = 766
  Top = 245
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
  ClientHeight = 336
  ClientWidth = 272
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object OKBtn: TButton
    Left = 80
    Top = 302
    Width = 93
    Height = 30
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 179
    Top = 302
    Width = 92
    Height = 30
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object PCDiagram: TPageControl
    Left = 0
    Top = 0
    Width = 273
    Height = 297
    ActivePage = TSScale
    Align = alCustom
    MultiLine = True
    TabIndex = 0
    TabOrder = 2
    object TSScale: TTabSheet
      Caption = #1064#1082#1072#1083#1072
      ImageIndex = 2
      object GBX: TGroupBox
        Left = 0
        Top = 1
        Width = 264
        Height = 132
        Caption = #1054#1089#1100' X'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 38
          Width = 32
          Height = 16
          Caption = #1040#1074#1090#1086
        end
        object Label2: TLabel
          Left = 8
          Top = 20
          Width = 70
          Height = 16
          Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        end
        object LTFmt: TLabel
          Left = 16
          Top = 109
          Width = 51
          Height = 16
          Caption = #1060#1086#1088#1084#1072#1090
        end
        object CBXMin: TCheckBox
          Left = 16
          Top = 60
          Width = 129
          Height = 17
          Caption = #1052#1080#1085'. '#1079#1085#1072#1095'.'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBXMax: TCheckBox
          Left = 16
          Top = 84
          Width = 129
          Height = 17
          Caption = #1052#1072#1082#1089'. '#1079#1085#1072#1095'.'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object EXMin: TEdit
          Left = 114
          Top = 56
          Width = 142
          Height = 24
          TabOrder = 2
          Text = '0'
          OnChange = EXMinChange
        end
        object EXMax: TEdit
          Left = 114
          Top = 80
          Width = 142
          Height = 24
          TabOrder = 8
          Text = '100'
          OnChange = EXMaxChange
        end
        object CBXDiv: TCheckBox
          Left = 16
          Top = 108
          Width = 129
          Height = 17
          Caption = #1062#1077#1085#1072' '#1076#1077#1083'.'
          Checked = True
          State = cbChecked
          TabOrder = 9
        end
        object EXDiv: TEdit
          Left = 114
          Top = 104
          Width = 142
          Height = 24
          TabOrder = 10
          Text = '100'
          OnChange = EXDivChange
        end
        object CBXType: TComboBox
          Left = 88
          Top = 17
          Width = 168
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 0
          Text = #1053#1086#1084#1077#1088' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          OnChange = CBXTypeChange
          Items.Strings = (
            #1053#1086#1084#1077#1088' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
            #1042#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103)
        end
        object DXMin: TDateTimePicker
          Left = 114
          Top = 56
          Width = 62
          Height = 25
          CalAlignment = dtaLeft
          Date = 40280.7452775926
          Time = 40280.7452775926
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
          OnChange = DXMinChange
        end
        object TXMin: TDateTimePicker
          Left = 176
          Top = 56
          Width = 80
          Height = 25
          CalAlignment = dtaLeft
          Date = 40280.7459742014
          Time = 40280.7459742014
          DateFormat = dfShort
          DateMode = dmUpDown
          Kind = dtkTime
          ParseInput = False
          TabOrder = 4
          OnChange = TXMinChange
        end
        object DXMax: TDateTimePicker
          Left = 114
          Top = 80
          Width = 62
          Height = 26
          CalAlignment = dtaLeft
          Date = 40280.7452775926
          Time = 40280.7452775926
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 6
          OnChange = DXMaxChange
        end
        object TXMax: TDateTimePicker
          Left = 176
          Top = 80
          Width = 80
          Height = 26
          CalAlignment = dtaLeft
          Date = 40280.7459742014
          Time = 40280.7459742014
          DateFormat = dfShort
          DateMode = dmUpDown
          Kind = dtkTime
          ParseInput = False
          TabOrder = 7
          OnChange = TXMaxChange
        end
        object CBTFmt: TComboBox
          Left = 114
          Top = 105
          Width = 142
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 11
          OnChange = CBTFmtChange
          Items.Strings = (
            'hh:mm:ss'
            'hh:mm'
            'ss'
            'dd hh:mm'
            'dd.mm hh:mm'
            'dd.mm.yy')
        end
      end
      object GBY: TGroupBox
        Left = 0
        Top = 134
        Width = 264
        Height = 132
        Caption = #1054#1089#1100' Y'
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 38
          Width = 32
          Height = 16
          Caption = #1040#1074#1090#1086
        end
        object Label3: TLabel
          Left = 8
          Top = 20
          Width = 70
          Height = 16
          Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        end
        object CBYMin: TCheckBox
          Left = 16
          Top = 60
          Width = 129
          Height = 17
          Caption = #1052#1080#1085'. '#1079#1085#1072#1095'.'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBYMax: TCheckBox
          Left = 16
          Top = 84
          Width = 129
          Height = 17
          Caption = #1052#1072#1082#1089'. '#1079#1085#1072#1095'.'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object EYMin: TEdit
          Left = 114
          Top = 56
          Width = 142
          Height = 24
          TabOrder = 2
          Text = '0'
          OnChange = EYMinChange
        end
        object EYMax: TEdit
          Left = 114
          Top = 80
          Width = 142
          Height = 24
          TabOrder = 4
          Text = '100'
          OnChange = EYMaxChange
        end
        object CBYDiv: TCheckBox
          Left = 16
          Top = 108
          Width = 129
          Height = 17
          Caption = #1062#1077#1085#1072' '#1076#1077#1083'.'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object EYDiv: TEdit
          Left = 114
          Top = 104
          Width = 142
          Height = 24
          TabOrder = 6
          Text = '100'
          OnChange = EYDivChange
        end
        object CBYType: TComboBox
          Left = 88
          Top = 17
          Width = 168
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 0
          Text = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1052#1055#1072' '
          Items.Strings = (
            #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077', '#1052#1055#1072' '
            #1044#1077#1092#1086#1088#1084#1072#1094#1080#1103', '#1084#1082#1084'/'#1084)
        end
      end
    end
    object TSLeg: TTabSheet
      Caption = #1051#1077#1075#1077#1085#1076#1072
      ImageIndex = 3
      object Bevel6: TBevel
        Left = 0
        Top = 0
        Width = 264
        Height = 230
        Shape = bsFrame
      end
      object Label9: TLabel
        Left = 8
        Top = 14
        Width = 57
        Height = 16
        Caption = #1055#1086#1079#1080#1094#1080#1103
      end
      object Label10: TLabel
        Left = 8
        Top = 44
        Width = 47
        Height = 16
        Caption = #1054#1090#1089#1090#1091#1087
      end
      object Label11: TLabel
        Left = 8
        Top = 76
        Width = 51
        Height = 16
        Caption = #1064#1080#1088#1080#1085#1072
      end
      object Label5: TLabel
        Left = 8
        Top = 166
        Width = 147
        Height = 16
        Caption = #1047#1085#1072#1082#1086#1074' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081
      end
      object Label6: TLabel
        Left = 8
        Top = 198
        Width = 108
        Height = 16
        Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1083#1073#1094#1072
      end
      object CBLOn: TCheckBox
        Left = 8
        Top = 124
        Width = 185
        Height = 25
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1083#1077#1075#1077#1085#1076#1091
        TabOrder = 6
        OnClick = CBLOnClick
      end
      object CBLPos: TComboBox
        Left = 72
        Top = 10
        Width = 113
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 0
        OnChange = CBLPosChange
        Items.Strings = (
          #1057#1083#1077#1074#1072
          #1057#1087#1088#1072#1074#1072
          #1057#1074#1077#1088#1093#1091
          #1057#1085#1080#1079#1091)
      end
      object ELTop: TEdit
        Left = 72
        Top = 40
        Width = 41
        Height = 24
        ReadOnly = True
        TabOrder = 1
        Text = '1'
      end
      object UDLTop: TUpDown
        Left = 113
        Top = 40
        Width = 19
        Height = 24
        Associate = ELTop
        Min = 0
        Position = 1
        TabOrder = 2
        Thousands = False
        Wrap = False
        OnClick = UDLTopClick
      end
      object ELWidth: TEdit
        Left = 72
        Top = 72
        Width = 41
        Height = 24
        ReadOnly = True
        TabOrder = 3
        Text = '1'
      end
      object UDLWidth: TUpDown
        Left = 113
        Top = 72
        Width = 19
        Height = 24
        Associate = ELWidth
        Min = 0
        Position = 1
        TabOrder = 4
        Thousands = False
        Wrap = False
        OnClick = UDLWidthClick
      end
      object CBLLines: TCheckBox
        Left = 8
        Top = 100
        Width = 249
        Height = 25
        Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100#1085#1099#1077' '#1083#1080#1085#1080#1080
        TabOrder = 5
        OnClick = CBLLinesClick
      end
      object CBFormat: TComboBox
        Left = 176
        Top = 162
        Width = 65
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        ItemIndex = 1
        TabOrder = 7
        Text = '1'
        OnChange = CBFormatChange
        Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
      end
      object CBCWidth: TComboBox
        Left = 176
        Top = 194
        Width = 65
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        ItemIndex = 1
        TabOrder = 8
        Text = '100%'
        OnChange = CBCWidthChange
        Items.Strings = (
          '75%'
          '100%'
          '125%'
          '150%'
          '175%'
          '200%'
          '300%'
          '400%')
      end
    end
    object TSLine: TTabSheet
      Caption = #1051#1080#1085#1080#1103
      object Bevel5: TBevel
        Left = 0
        Top = 231
        Width = 264
        Height = 35
        Shape = bsFrame
      end
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 264
        Height = 230
        Shape = bsFrame
      end
      object Label12: TLabel
        Left = 8
        Top = 12
        Width = 32
        Height = 16
        Caption = #1062#1074#1077#1090
      end
      object Label13: TLabel
        Left = 8
        Top = 44
        Width = 58
        Height = 16
        Caption = #1058#1086#1083#1097#1080#1085#1072
      end
      object Label14: TLabel
        Left = 8
        Top = 76
        Width = 25
        Height = 16
        Caption = #1058#1080#1087
      end
      object Label7: TLabel
        Left = 8
        Top = 240
        Width = 40
        Height = 16
        Caption = #1050#1072#1085#1072#1083
      end
      object CBLCol: TColorBox
        Left = 72
        Top = 10
        Width = 113
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnChange = CBLColChange
      end
      object CBLStyle: TComboBox
        Left = 72
        Top = 72
        Width = 113
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 3
        OnChange = CBLStyleChange
        Items.Strings = (
          'Solid'
          'Dash'
          'Dot'
          'Dash Dot'
          'Dash Dot Dot')
      end
      object CBPOn: TCheckBox
        Left = 8
        Top = 110
        Width = 185
        Height = 25
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1083#1080#1085#1080#1102
        TabOrder = 4
        OnClick = CBPOnClick
      end
      object UpLWidth: TUpDown
        Left = 113
        Top = 40
        Width = 19
        Height = 24
        Associate = ELnWidth
        Min = 1
        Position = 1
        TabOrder = 2
        Thousands = False
        Wrap = False
        OnClick = UpLWidthClick
      end
      object ELnWidth: TEdit
        Left = 72
        Top = 40
        Width = 41
        Height = 24
        ReadOnly = True
        TabOrder = 1
        Text = '1'
      end
      object CBCh1: TComboBox
        Left = 72
        Top = 236
        Width = 78
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 5
        Text = '1A'
        OnChange = CBCh1Change
        Items.Strings = (
          '1A'
          '1B'
          '2A'
          '2B'
          '3A'
          '3B'
          '4A'
          '4B'
          '5A'
          '5B'
          '6A'
          '6B'
          '7A'
          '7B'
          '8A'
          '8B'
          '9A'
          '9B'
          '10A'
          '10B'
          '11A'
          '11B'
          '12A'
          '12B'
          '13A'
          '13B'
          '14A'
          '14B'
          '15A'
          '15B'
          '16A'
          '16B')
      end
      object CBChOn1: TCheckBox
        Left = 156
        Top = 236
        Width = 103
        Height = 25
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100
        TabOrder = 6
        OnClick = CBChOn1Click
      end
    end
    object TSPoint: TTabSheet
      Caption = #1052#1072#1088#1082#1077#1088
      ImageIndex = 1
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 264
        Height = 230
        Shape = bsFrame
      end
      object Label15: TLabel
        Left = 8
        Top = 13
        Width = 32
        Height = 16
        Caption = #1062#1074#1077#1090
      end
      object Label16: TLabel
        Left = 8
        Top = 44
        Width = 51
        Height = 16
        Caption = #1064#1080#1088#1080#1085#1072
      end
      object Label17: TLabel
        Left = 144
        Top = 44
        Width = 48
        Height = 16
        Caption = #1042#1099#1089#1086#1090#1072
      end
      object Label18: TLabel
        Left = 8
        Top = 76
        Width = 25
        Height = 16
        Caption = #1058#1080#1087
      end
      object Label19: TLabel
        Left = 8
        Top = 175
        Width = 108
        Height = 16
        Caption = #1058#1086#1083#1097#1080#1085#1072' '#1082#1088#1086#1084#1082#1080
      end
      object Label20: TLabel
        Left = 8
        Top = 144
        Width = 82
        Height = 16
        Caption = #1062#1074#1077#1090' '#1082#1088#1086#1084#1082#1080
      end
      object Bevel4: TBevel
        Left = 0
        Top = 231
        Width = 264
        Height = 35
        Shape = bsFrame
      end
      object Label8: TLabel
        Left = 8
        Top = 240
        Width = 40
        Height = 16
        Caption = #1050#1072#1085#1072#1083
      end
      object CBPCol: TColorBox
        Left = 72
        Top = 10
        Width = 113
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnChange = CBPColChange
      end
      object CBPtOn: TCheckBox
        Left = 8
        Top = 110
        Width = 161
        Height = 25
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1084#1072#1088#1082#1077#1088
        TabOrder = 6
        OnClick = CBPtOnClick
      end
      object UDPWidth: TUpDown
        Left = 113
        Top = 40
        Width = 19
        Height = 24
        Associate = EPWidth
        Min = 1
        Position = 1
        TabOrder = 2
        Thousands = False
        Wrap = False
        OnClick = UDPWidthClick
      end
      object UDPHeight: TUpDown
        Left = 241
        Top = 40
        Width = 19
        Height = 24
        Associate = EPHeight
        Min = 1
        Position = 1
        TabOrder = 4
        Thousands = False
        Wrap = False
        OnClick = UDPHeightClick
      end
      object CBPStyle: TComboBox
        Left = 72
        Top = 72
        Width = 113
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 5
        OnChange = CBPStyleChange
        Items.Strings = (
          'Square'
          'Circle'
          'Triangle'
          'Down Triangle'
          'Cross'
          'Diagonal Cross'
          'Star'
          'Diamond'
          'Small Dot')
      end
      object UDBWidth: TUpDown
        Left = 163
        Top = 172
        Width = 19
        Height = 24
        Associate = EBWidth
        Min = 1
        Position = 1
        TabOrder = 9
        Thousands = False
        Wrap = False
        OnClick = UDBWidthClick
      end
      object CBBCol: TColorBox
        Left = 120
        Top = 142
        Width = 113
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 7
        OnChange = CBBColChange
      end
      object CBBOn: TCheckBox
        Left = 8
        Top = 202
        Width = 169
        Height = 25
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1082#1088#1086#1084#1082#1091
        TabOrder = 10
        OnClick = CBBOnClick
      end
      object EPWidth: TEdit
        Left = 72
        Top = 40
        Width = 41
        Height = 24
        ReadOnly = True
        TabOrder = 1
        Text = '1'
      end
      object EPHeight: TEdit
        Left = 200
        Top = 40
        Width = 41
        Height = 24
        ReadOnly = True
        TabOrder = 3
        Text = '1'
      end
      object EBWidth: TEdit
        Left = 122
        Top = 172
        Width = 41
        Height = 24
        ReadOnly = True
        TabOrder = 8
        Text = '1'
      end
      object CBCh2: TComboBox
        Left = 72
        Top = 236
        Width = 78
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 11
        Text = '1A'
        OnChange = CBCh2Change
        Items.Strings = (
          '1A'
          '1B'
          '2A'
          '2B'
          '3A'
          '3B'
          '4A'
          '4B'
          '5A'
          '5B'
          '6A'
          '6B'
          '7A'
          '7B'
          '8A'
          '8B'
          '9A'
          '9B'
          '10A'
          '10B'
          '11A'
          '11B'
          '12A'
          '12B'
          '13A'
          '13B'
          '14A'
          '14B'
          '15A'
          '15B'
          '16A'
          '16B')
      end
      object CBChOn2: TCheckBox
        Left = 156
        Top = 236
        Width = 103
        Height = 25
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100
        TabOrder = 12
        OnClick = CBChOn2Click
      end
    end
  end
end
