object FMain: TFMain
  Left = 208
  Top = 80
  Width = 1605
  Height = 1100
  Caption = #1057#1077#1088#1074#1077#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu_server
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  object SplitterTV: TSplitter
    Left = 437
    Top = 0
    Width = 1
    Height = 1017
    Cursor = crHSplit
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object Panel3: TPanel
    Left = 438
    Top = 0
    Width = 1151
    Height = 1017
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'Panel3'
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 1
      Top = 246
      Width = 1149
      Height = 8
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      ResizeStyle = rsUpdate
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 1149
      Height = 245
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel4'
      Constraints.MinHeight = 100
      Constraints.MinWidth = 100
      TabOrder = 0
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 1149
        Height = 245
        ActivePage = TSSens
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabIndex = 1
        TabOrder = 0
        object TSPrs: TTabSheet
          Caption = #1055#1086#1088#1090#1099
          object PortsList: TListView
            Left = 0
            Top = 0
            Width = 1141
            Height = 212
            Align = alClient
            BevelInner = bvLowered
            BorderStyle = bsNone
            Columns = <
              item
                Caption = #1055#1086#1088#1090
                Width = 80
              end
              item
                Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
                Width = 220
              end
              item
                Alignment = taRightJustify
                Caption = #1042#1088#1077#1084#1103
                Width = 100
              end
              item
                Alignment = taRightJustify
                Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086
                Width = 100
              end
              item
                Caption = #1055#1088#1080#1085#1103#1090#1086
                Width = 100
              end
              item
                AutoSize = True
                Caption = #1055#1086#1087#1099#1090#1086#1082
              end>
            ColumnClick = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            FlatScrollBars = True
            GridLines = True
            IconOptions.Arrangement = iaLeft
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            SmallImages = Images16x16
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = PortsListSelectItem
          end
        end
        object TSSens: TTabSheet
          Caption = #1044#1072#1090#1095#1080#1082#1080
          ImageIndex = 1
          object SensList: TListView
            Left = 0
            Top = 0
            Width = 1141
            Height = 212
            Align = alClient
            BorderStyle = bsNone
            Columns = <
              item
                Caption = #1044#1072#1090#1095#1080#1082
                Width = 100
              end
              item
                Alignment = taCenter
                Caption = 'Mx'
                Width = 70
              end
              item
                Alignment = taCenter
                Caption = 'My'
                Width = 70
              end
              item
                Alignment = taCenter
                Caption = 'Amax'
                Width = 70
              end
              item
                Alignment = taCenter
                Caption = 'Arms'
                Width = 70
              end
              item
                Alignment = taCenter
                Caption = 'T'
                Width = 70
              end
              item
                Alignment = taCenter
                Width = 70
              end
              item
                Alignment = taCenter
                Width = 70
              end
              item
                AutoSize = True
                Caption = #1057#1090#1072#1090#1091#1089
              end>
            ColumnClick = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            FlatScrollBars = True
            GridLines = True
            IconOptions.Arrangement = iaLeft
            Items.Data = {
              730000000100000008000000FFFFFFFFFFFFFFFF080000000000000009C4E0F2
              F7E8EA203636062B302E363636062D302E363636062B33352E30300331303504
              33332E33113033203030303020303030302030303030063136302E3030053136
              302E30FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            SmallImages = Images16x16
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = SensListSelectItem
          end
        end
        object TSCOM: TTabSheet
          Caption = #1055#1086#1088#1090
          ImageIndex = 2
          object COMList: TListView
            Left = 0
            Top = 0
            Width = 1141
            Height = 212
            Align = alClient
            BorderStyle = bsNone
            Columns = <
              item
                Width = 250
              end
              item
                AutoSize = True
              end>
            ColumnClick = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            FlatScrollBars = True
            GridLines = True
            IconOptions.Arrangement = iaLeft
            Items.Data = {
              DE0100000B00000000000000FFFFFFFFFFFFFFFF01000000000000000BCAEEEC
              ECE5EDF2E0F0E8E91A010000000B000000CAEEECECE5EDF2E0F0E8E9001E0000
              00010000000000FFFFFFFFFFFFFFFF010000000000000009D1EEF1F2EEFFEDE8
              E508CEF2EAEBFEF7E5ED00000000FFFFFFFFFFFFFFFF01000000000000000CC2
              F0E5ECFF20EEEFF0EEF1E007303A30303A303000000000FFFFFFFFFFFFFFFF01
              0000000000000014C2F0E5ECFF20EFEEF1EBE520EEF2EAF0FBF2E8FF07303A30
              303A303000000000FFFFFFFFFFFFFFFF01000000000000000FCEF2EFF0E0E2EB
              E5EDEE20E1E0E9F2013000000000FFFFFFFFFFFFFFFF01000000000000000CCF
              F0E8EDFFF2EE20E1E0E9F2013000000000FFFFFFFFFFFFFFFF01000000000000
              0010CFEEEFFBF2EEEA20EEF2EAF0FBF2E8FF013000000000FFFFFFFFFFFFFFFF
              01000000000000000DCEF8E8E1EEEA20E7E0EFE8F1E8013000000000FFFFFFFF
              FFFFFFFF01000000000000000DCEF8E8E1EEEA20F7F2E5EDE8FF013000000000
              FFFFFFFFFFFFFFFF01000000000000000ACEF8E8E1EEEA204352430130000000
              00FFFFFFFFFFFFFFFF010000000000000014CAEEE420EFEEF1EBE5E4EDE5E920
              EEF8E8E1EAE80130FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            ShowColumnHeaders = False
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = COMListSelectItem
          end
        end
        object TSSrs: TTabSheet
          Caption = #1044#1072#1090#1095#1080#1082
          ImageIndex = 3
          object SrsList: TListView
            Left = 0
            Top = 0
            Width = 1141
            Height = 212
            Align = alClient
            BorderStyle = bsNone
            Columns = <
              item
                Width = 250
              end
              item
                AutoSize = True
              end>
            ColumnClick = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            FlatScrollBars = True
            GridLines = True
            IconOptions.Arrangement = iaLeft
            Items.Data = {
              EE0100000B00000000000000FFFFFFFFFFFFFFFF01000000000000000BCAEEEC
              ECE5EDF2E0F0E8E90DC0E4E0EFF2E5F020525334383500000000FFFFFFFFFFFF
              FFFF010000000000000009D1EEF1F2EEFFEDE8E508CEF2EAEBFEF7E5ED000000
              00FFFFFFFFFFFFFFFF01000000000000001ED3E3EBFB20CCF52C204D792C20E3
              F0E0E42E2028F3E3EB2E20F1E5EA2E29012A00000000FFFFFFFFFFFFFFFF0100
              00000000000017D3F1EAEEF0E5EDE8FF2041782C20C0F32C20ECEC2FF132012A
              00000000FFFFFFFFFFFFFFFF010000000000000014D2E5ECEFE5F0E0F2F3F0E0
              20542C20E3F0E0E42E012A00000000FFFFFFFFFFFFFFFF010000000000000019
              D1EAEEF0EEF1F2FC20E2E5F2F0E020552C20562C2020EC2FF1012A00000000FF
              FFFFFFFFFFFFFF010000000000000014D2E5F0ECEEF1F2E0F22C20252028EEE1
              2E2FF129012A00000000FFFFFFFFFFFFFFFF01000000000000000FD1EBEEE2EE
              20F1EEF1F2EEFFEDE8FF044646464600000000FFFFFFFFFFFFFFFF0100000000
              0000000DCFE5F0E8EEE420EEEFF0EEF1E0013000000000FFFFFFFFFFFFFFFF01
              000000000000000DCEF8E8E1EEEA20F7F2E5EDE8FF013000000000FFFFFFFFFF
              FFFFFF01000000000000000ACEF8E8E1EEEA204352430130FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            ShowColumnHeaders = False
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = SrsListSelectItem
          end
        end
        object TSLens: TTabSheet
          Caption = #1051#1091#1087#1072
          ImageIndex = 4
          TabVisible = False
          object Label2: TLabel
            Left = 8
            Top = 5
            Width = 46
            Height = 97
            Caption = 'X'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -80
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 10
            Top = 108
            Width = 46
            Height = 97
            Caption = 'Y'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -80
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ELX: TEdit
            Left = 72
            Top = 0
            Width = 673
            Height = 105
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -80
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = '+3600.0'
          end
          object ELY: TEdit
            Left = 72
            Top = 104
            Width = 673
            Height = 105
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -80
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '-3600.0'
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 254
      Width = 1149
      Height = 762
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel5'
      Constraints.MinHeight = 100
      Constraints.MinWidth = 100
      TabOrder = 1
      object PC: TPageControl
        Left = 0
        Top = 0
        Width = 1149
        Height = 762
        ActivePage = TSLog
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabIndex = 2
        TabOrder = 0
        OnChange = PCChange
        object TSSetup: TTabSheet
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
          ImageIndex = 1
          object Image2: TImage
            Left = 408
            Top = 219
            Width = 15
            Height = 15
            Picture.Data = {
              07544269746D617006030000424D060300000000000036000000280000000F00
              00000F0000000100180000000000D00200000000000000000000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF8080808080
              80808080808080808080808080808080808080808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFF
              FF000000000000000000000000000000FFFFFF808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF8080808080
              80808080808080808080808080808080808080808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          end
          object Image1: TImage
            Left = 392
            Top = 219
            Width = 15
            Height = 15
            Picture.Data = {
              07544269746D617006030000424D060300000000000036000000280000000F00
              00000F0000000100180000000000D00200000000000000000000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF8080808080
              80808080808080808080808080808080808080808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFF
              FF000000000000000000000000000000FFFFFF808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF8080808080
              80808080808080808080808080808080808080808080FFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          end
          object TVSrv: TTreeView
            Left = 0
            Top = 0
            Width = 1141
            Height = 729
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Indent = 20
            ParentFont = False
            ReadOnly = True
            RowSelect = True
            ShowLines = False
            TabOrder = 0
            OnCustomDrawItem = TVSrvCustomDrawItem
          end
          object TVPrt: TTreeView
            Left = 0
            Top = 0
            Width = 1141
            Height = 729
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Indent = 20
            ParentFont = False
            ReadOnly = True
            RowSelect = True
            ShowLines = False
            TabOrder = 1
            OnCustomDrawItem = TVSrvCustomDrawItem
          end
          object TVSrs: TTreeView
            Left = 0
            Top = 0
            Width = 1141
            Height = 729
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            Indent = 20
            ParentFont = False
            ReadOnly = True
            RowSelect = True
            ShowLines = False
            TabOrder = 2
            OnCustomDrawItem = TVSrvCustomDrawItem
          end
        end
        object TSSrsLog: TTabSheet
          Caption = #1048#1079#1084#1077#1088#1077#1085#1080#1103
          ImageIndex = 3
          object Memo: TMemo
            Left = 0
            Top = 0
            Width = 1115
            Height = 729
            Align = alClient
            BorderStyle = bsNone
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TSLog: TTabSheet
          Caption = #1046#1091#1088#1085#1072#1083
          object RichEdit: TRichEdit
            Left = 0
            Top = 0
            Width = 1141
            Height = 729
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
        end
        object TSTest: TTabSheet
          Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1077
          ImageIndex = 2
          TabVisible = False
          object PCW: TPageControl
            Left = 0
            Top = 0
            Width = 1141
            Height = 729
            ActivePage = TSStat
            Align = alClient
            TabIndex = 0
            TabOrder = 0
            object TSStat: TTabSheet
              Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
              object Label1: TLabel
                Left = 33
                Top = 146
                Width = 27
                Height = 18
                Caption = 'Info'
              end
              object SBLens: TSpeedButton
                Left = 272
                Top = 144
                Width = 25
                Height = 25
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33033333333333333F7F3333333333333000333333333333F777333333333333
                  000333333333333F777333333333333000333333333333F77733333333333300
                  033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
                  33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
                  3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
                  33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
                  333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
                  333333773FF77333333333370007333333333333777333333333}
                NumGlyphs = 2
                OnClick = SBLensClick
              end
              object SBGrid: TSpeedButton
                Left = 297
                Top = 144
                Width = 25
                Height = 25
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                  C8807FF7777777777FF700000000000000007777777777777777333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
              end
              object GroupBox2: TGroupBox
                Left = 220
                Top = 10
                Width = 110
                Height = 130
                Caption = 'Pack'
                TabOrder = 0
                object Eprtm: TLabeledEdit
                  Left = 24
                  Top = 27
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 18
                  EditLabel.Height = 18
                  EditLabel.Caption = 'tm'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 0
                end
                object Epdrz: TLabeledEdit
                  Left = 24
                  Top = 51
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 20
                  EditLabel.Height = 18
                  EditLabel.Caption = 'drz'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 1
                end
                object Epne: TLabeledEdit
                  Left = 24
                  Top = 75
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 16
                  EditLabel.Height = 18
                  EditLabel.Caption = 'ne'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 2
                end
                object Epr1: TLabeledEdit
                  Left = 24
                  Top = 99
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 'r1'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 3
                end
              end
              object GroupBox9: TGroupBox
                Left = 0
                Top = 10
                Width = 110
                Height = 130
                Caption = #1048#1053'-'#1044'3 2^32'
                TabOrder = 1
                object Esn: TLabeledEdit
                  Left = 24
                  Top = 27
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 15
                  EditLabel.Height = 18
                  EditLabel.Caption = 'sn'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 0
                end
                object Ete: TLabeledEdit
                  Left = 24
                  Top = 51
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 'te'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 1
                end
                object Ece: TLabeledEdit
                  Left = 24
                  Top = 75
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 15
                  EditLabel.Height = 18
                  EditLabel.Caption = 'ce'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 2
                end
                object Ere: TLabeledEdit
                  Left = 24
                  Top = 99
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 're'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 3
                end
              end
              object GroupBox1: TGroupBox
                Left = 110
                Top = 10
                Width = 110
                Height = 130
                Caption = #1048#1053'-'#1044'3 51x300'
                TabOrder = 2
                object Eedr: TLabeledEdit
                  Left = 24
                  Top = 27
                  Width = 80
                  Height = 24
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 'dr'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  Text = '00000:00000'
                end
                object Eete: TLabeledEdit
                  Left = 24
                  Top = 51
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 'te'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 1
                end
                object Eece: TLabeledEdit
                  Left = 24
                  Top = 75
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 15
                  EditLabel.Height = 18
                  EditLabel.Caption = 'ce'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 3
                end
                object Eere: TLabeledEdit
                  Left = 24
                  Top = 99
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 're'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 2
                end
              end
              object GroupBox10: TGroupBox
                Left = 330
                Top = 10
                Width = 110
                Height = 130
                Caption = 'TMP05'
                TabOrder = 3
                object Etsn: TLabeledEdit
                  Left = 24
                  Top = 27
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 15
                  EditLabel.Height = 18
                  EditLabel.Caption = 'sn'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 3
                end
                object Ette: TLabeledEdit
                  Left = 24
                  Top = 51
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 'te'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 2
                end
                object Etre: TLabeledEdit
                  Left = 24
                  Top = 75
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 're'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 1
                end
                object Etae: TLabeledEdit
                  Left = 24
                  Top = 99
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 16
                  EditLabel.Height = 18
                  EditLabel.Caption = 'ae'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object GroupBox4: TGroupBox
                Left = 440
                Top = 10
                Width = 110
                Height = 130
                Caption = 'WindObserver'
                TabOrder = 4
                object EWsn: TLabeledEdit
                  Left = 24
                  Top = 27
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 15
                  EditLabel.Height = 18
                  EditLabel.Caption = 'sn'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 3
                end
                object EWte: TLabeledEdit
                  Left = 24
                  Top = 51
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 'te'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 2
                end
                object EWce: TLabeledEdit
                  Left = 24
                  Top = 75
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 15
                  EditLabel.Height = 18
                  EditLabel.Caption = 'ce'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 1
                end
                object EWse: TLabeledEdit
                  Left = 24
                  Top = 99
                  Width = 80
                  Height = 26
                  Color = clBtnFace
                  EditLabel.Width = 15
                  EditLabel.Height = 18
                  EditLabel.Caption = 'se'
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object EInfo: TEdit
                Left = 172
                Top = 144
                Width = 90
                Height = 24
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object CBXInfo: TComboBox
                Left = 67
                Top = 144
                Width = 103
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ItemHeight = 16
                ItemIndex = 4
                ParentFont = False
                TabOrder = 6
                Text = 'Version'
                Items.Strings = (
                  'pb_clock'
                  't2_clock'
                  'heat_pwr'
                  'cool_pwr'
                  'Version'
                  'Address'
                  'Time100'
                  'd3r.tm'
                  'tmp05_max'
                  'stp.n50'
                  'AN10'
                  'AN11'
                  'RTCC Time'
                  'RTCC Date'
                  'Read Flash ID'
                  'Read Flash'
                  'Flash status')
              end
              object CBStat: TCheckBox
                Left = 3
                Top = 148
                Width = 17
                Height = 17
                TabOrder = 7
              end
              object Panel6: TPanel
                Left = 550
                Top = 18
                Width = 140
                Height = 122
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 8
                object ETmSave: TLabeledEdit
                  Left = 7
                  Top = 29
                  Width = 65
                  Height = 24
                  EditLabel.Width = 55
                  EditLabel.Height = 18
                  EditLabel.Caption = 'TmSave'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  LabelPosition = lpRight
                  LabelSpacing = 3
                  ParentFont = False
                  TabOrder = 0
                  OnChange = ETmSaveChange
                end
                object ETmRun: TLabeledEdit
                  Left = 7
                  Top = 5
                  Width = 65
                  Height = 24
                  EditLabel.Width = 48
                  EditLabel.Height = 18
                  EditLabel.Caption = 'TmRun'
                  EditLabel.Font.Charset = DEFAULT_CHARSET
                  EditLabel.Font.Color = clWindowText
                  EditLabel.Font.Height = -15
                  EditLabel.Font.Name = 'Tahoma'
                  EditLabel.Font.Style = []
                  EditLabel.ParentFont = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  LabelPosition = lpRight
                  LabelSpacing = 3
                  ParentFont = False
                  TabOrder = 1
                  OnChange = ETmRunChange
                end
                object CBFile: TCheckBox
                  Left = 72
                  Top = 54
                  Width = 25
                  Height = 25
                  TabOrder = 2
                end
                object BFile: TButton
                  Left = 8
                  Top = 56
                  Width = 60
                  Height = 20
                  Caption = 'File'
                  TabOrder = 3
                  TabStop = False
                  OnClick = BFileClick
                end
                object BHide: TButton
                  Left = 8
                  Top = 76
                  Width = 60
                  Height = 20
                  Caption = 'Hide'
                  TabOrder = 4
                  TabStop = False
                  OnClick = BHideClick
                end
                object BINI: TButton
                  Left = 8
                  Top = 96
                  Width = 60
                  Height = 20
                  Caption = 'INI'
                  TabOrder = 5
                  TabStop = False
                  OnClick = BINIClick
                end
              end
              object Panel2: TPanel
                Left = 0
                Top = 173
                Width = 265
                Height = 92
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 9
                object CBFIR1: TCheckBox
                  Left = 5
                  Top = 6
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 0
                end
                object BFIR1: TButton
                  Left = 23
                  Top = 5
                  Width = 60
                  Height = 20
                  Caption = 'FIR1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  TabStop = False
                  OnClick = BResetClick
                end
                object BFIR2: TButton
                  Left = 23
                  Top = 26
                  Width = 60
                  Height = 20
                  Caption = 'FIR2'
                  TabOrder = 2
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBFIR2: TCheckBox
                  Left = 5
                  Top = 27
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR2'
                  TabOrder = 3
                end
                object CBIdle: TCheckBox
                  Left = 93
                  Top = 47
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 4
                end
                object BIdle: TButton
                  Left = 111
                  Top = 46
                  Width = 60
                  Height = 20
                  Caption = 'Idle'
                  TabOrder = 5
                  TabStop = False
                  OnClick = BResetClick
                end
                object BTOut: TButton
                  Left = 111
                  Top = 26
                  Width = 60
                  Height = 20
                  Caption = 'TOuts'
                  TabOrder = 6
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBTOut: TCheckBox
                  Left = 93
                  Top = 27
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 7
                end
                object Bt5av: TButton
                  Left = 111
                  Top = 5
                  Width = 60
                  Height = 20
                  Caption = 'T5Av'
                  TabOrder = 8
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBt5av: TCheckBox
                  Left = 93
                  Top = 6
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 9
                end
                object BTermo: TButton
                  Left = 199
                  Top = 5
                  Width = 60
                  Height = 20
                  Caption = 'Termo'
                  TabOrder = 10
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBTermo: TCheckBox
                  Left = 181
                  Top = 6
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 11
                end
                object BDAdr: TButton
                  Left = 111
                  Top = 66
                  Width = 60
                  Height = 20
                  Caption = 'DAdr'
                  TabOrder = 12
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBDAdr: TCheckBox
                  Left = 93
                  Top = 67
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 13
                end
                object BAcmp: TButton
                  Left = 23
                  Top = 66
                  Width = 60
                  Height = 20
                  Caption = 'acmp'
                  TabOrder = 14
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBAcmp: TCheckBox
                  Left = 5
                  Top = 67
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 15
                end
                object BFIR3: TButton
                  Left = 23
                  Top = 46
                  Width = 60
                  Height = 20
                  Caption = 'FIR3'
                  TabOrder = 16
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBFIR3: TCheckBox
                  Left = 5
                  Top = 47
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR3'
                  TabOrder = 17
                end
                object BPwr: TButton
                  Left = 199
                  Top = 26
                  Width = 60
                  Height = 20
                  Caption = 'Pwr'
                  TabOrder = 18
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBPwr: TCheckBox
                  Left = 181
                  Top = 27
                  Width = 17
                  Height = 17
                  Caption = 'CBPwr'
                  TabOrder = 19
                end
                object CBMStack: TCheckBox
                  Left = 181
                  Top = 47
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 20
                end
                object BStack: TButton
                  Left = 199
                  Top = 46
                  Width = 60
                  Height = 20
                  Caption = 'Stack'
                  TabOrder = 21
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBMeteo: TCheckBox
                  Left = 181
                  Top = 67
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  TabOrder = 22
                end
                object BMeteo: TButton
                  Left = 199
                  Top = 66
                  Width = 60
                  Height = 20
                  Caption = 'Meteo'
                  TabOrder = 23
                  TabStop = False
                  OnClick = BResetClick
                end
              end
              object TPanel
                Left = 265
                Top = 173
                Width = 110
                Height = 92
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
                object Bn50: TButton
                  Left = 8
                  Top = 5
                  Width = 60
                  Height = 20
                  Caption = 'n50'
                  TabOrder = 0
                  TabStop = False
                  OnClick = BResetClick
                end
                object En50: TEdit
                  Left = 69
                  Top = 3
                  Width = 33
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  Text = '50'
                end
                object BBSAdr: TButton
                  Left = 8
                  Top = 46
                  Width = 60
                  Height = 20
                  Caption = 'BS Adr'
                  TabOrder = 2
                  TabStop = False
                  OnClick = BResetClick
                end
                object BAdr: TButton
                  Left = 8
                  Top = 26
                  Width = 60
                  Height = 20
                  Caption = 'D3 Adr'
                  TabOrder = 3
                  TabStop = False
                  OnClick = BResetClick
                end
                object EAdr: TEdit
                  Left = 70
                  Top = 23
                  Width = 33
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 4
                  Text = '5'
                end
                object EBSAdr: TEdit
                  Left = 69
                  Top = 43
                  Width = 33
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 5
                  Text = '99'
                end
                object BRQAdr: TButton
                  Left = 8
                  Top = 66
                  Width = 60
                  Height = 20
                  Caption = 'RQ Adr'
                  TabOrder = 6
                  TabStop = False
                  OnClick = BResetClick
                end
                object ERQAdr: TEdit
                  Left = 69
                  Top = 63
                  Width = 33
                  Height = 24
                  Color = clLime
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 7
                  Text = '12'
                end
              end
              object TPanel
                Left = 0
                Top = 266
                Width = 690
                Height = 92
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 11
                object Ecpn: TEdit
                  Left = 232
                  Top = 4
                  Width = 451
                  Height = 24
                  Color = clBtnFace
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object EdpCT: TEdit
                  Left = 232
                  Top = 29
                  Width = 451
                  Height = 24
                  Color = clBtnFace
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object Eptm: TEdit
                  Left = 232
                  Top = 54
                  Width = 451
                  Height = 24
                  Color = clBtnFace
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object BStackOn: TButton
                  Left = 4
                  Top = 23
                  Width = 60
                  Height = 20
                  Caption = 'Start'
                  TabOrder = 3
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBStack: TCheckBox
                  Left = 4
                  Top = 4
                  Width = 60
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Stack'
                  TabOrder = 4
                end
                object BStack0On: TButton
                  Left = 68
                  Top = 23
                  Width = 60
                  Height = 20
                  Caption = 'Start 0'
                  TabOrder = 5
                  TabStop = False
                  OnClick = BResetClick
                end
                object BStackOff: TButton
                  Left = 4
                  Top = 43
                  Width = 60
                  Height = 20
                  Caption = 'Stop'
                  TabOrder = 6
                  TabStop = False
                  OnClick = BResetClick
                end
                object BStack0Off: TButton
                  Left = 68
                  Top = 43
                  Width = 60
                  Height = 20
                  Caption = 'Stop 0'
                  TabOrder = 7
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBSClrOn: TCheckBox
                  Left = 134
                  Top = 25
                  Width = 40
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Clr'
                  Checked = True
                  State = cbChecked
                  TabOrder = 8
                end
                object CBSClrOff: TCheckBox
                  Left = 134
                  Top = 42
                  Width = 40
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Clr'
                  TabOrder = 9
                end
                object CBSProgClrOff: TCheckBox
                  Left = 180
                  Top = 42
                  Width = 40
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Clr'
                  TabOrder = 10
                end
                object CBSProgClrOn: TCheckBox
                  Left = 180
                  Top = 25
                  Width = 40
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Clr'
                  Checked = True
                  State = cbChecked
                  TabOrder = 11
                end
                object ESNGroup: TEdit
                  Left = 5
                  Top = 64
                  Width = 60
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 12
                  Text = '0'
                end
                object CBAver2: TCheckBox
                  Left = 180
                  Top = 58
                  Width = 40
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Av'
                  TabOrder = 13
                  OnClick = CBAver2Click
                end
              end
              object TPanel
                Left = 487
                Top = 173
                Width = 73
                Height = 92
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 12
                object BReset0: TButton
                  Left = 6
                  Top = 66
                  Width = 60
                  Height = 20
                  Caption = 'Reset 0'
                  TabOrder = 0
                  TabStop = False
                  OnClick = BResetClick
                end
                object BReset: TButton
                  Left = 6
                  Top = 46
                  Width = 60
                  Height = 20
                  Caption = 'Reset'
                  TabOrder = 1
                  TabStop = False
                  OnClick = BResetClick
                end
                object BProg: TButton
                  Left = 6
                  Top = 5
                  Width = 60
                  Height = 20
                  Caption = 'Prog'
                  TabOrder = 2
                  TabStop = False
                  OnClick = BResetClick
                end
                object BD3Set: TButton
                  Left = 7
                  Top = 25
                  Width = 60
                  Height = 20
                  Caption = 'D3 Set'
                  TabOrder = 3
                  TabStop = False
                  OnClick = BResetClick
                end
              end
              object GroupBox3: TGroupBox
                Left = 560
                Top = 165
                Width = 130
                Height = 100
                TabOrder = 13
                object Etr: TLabeledEdit
                  Left = 24
                  Top = 36
                  Width = 101
                  Height = 24
                  EditLabel.Width = 10
                  EditLabel.Height = 18
                  EditLabel.Caption = 'tr'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ParentFont = False
                  TabOrder = 1
                  Text = '1000'
                end
                object Ept: TLabeledEdit
                  Left = 24
                  Top = 62
                  Width = 101
                  Height = 24
                  EditLabel.Width = 13
                  EditLabel.Height = 18
                  EditLabel.Caption = 'pt'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  LabelPosition = lpLeft
                  LabelSpacing = 3
                  ParentFont = False
                  TabOrder = 0
                  Text = '500'
                end
                object BPulse: TButton
                  Left = 24
                  Top = 13
                  Width = 60
                  Height = 20
                  Caption = 'Pulse'
                  TabOrder = 2
                  TabStop = False
                  OnClick = BResetClick
                end
                object Edtype: TEdit
                  Left = 88
                  Top = 11
                  Width = 33
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  Text = '3'
                end
              end
              object GroupBox8: TGroupBox
                Left = 375
                Top = 165
                Width = 112
                Height = 100
                TabOrder = 14
                object ETmax: TEdit
                  Left = 64
                  Top = 10
                  Width = 33
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  Text = '35'
                end
                object BTmax: TButton
                  Left = 3
                  Top = 12
                  Width = 60
                  Height = 20
                  Caption = 'Tmax'
                  TabOrder = 1
                  TabStop = False
                  OnClick = BResetClick
                end
                object Bto10: TButton
                  Left = 23
                  Top = 74
                  Width = 60
                  Height = 20
                  Caption = 'to10'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  TabStop = False
                  OnClick = BResetClick
                end
                object CBto10: TCheckBox
                  Left = 5
                  Top = 75
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 3
                end
                object CBtostart: TCheckBox
                  Left = 5
                  Top = 55
                  Width = 17
                  Height = 17
                  Caption = 'CBFIR1'
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 4
                end
                object Btostart: TButton
                  Left = 23
                  Top = 52
                  Width = 60
                  Height = 20
                  Caption = 'toStart'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  TabStop = False
                  OnClick = BResetClick
                end
              end
              object CBServer2: TComboBox
                Left = 331
                Top = 144
                Width = 103
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ItemHeight = 16
                ItemIndex = 0
                ParentFont = False
                TabOrder = 15
                Text = 'X, Y'
                Items.Strings = (
                  'X, Y'
                  'XAver, YAver'
                  'XMax, YMax'
                  'XRms, YRms'
                  'XYRms'
                  'Time'
                  'U, V'
                  'UAver, VAver'
                  'UMax, VMax'
                  'WS'
                  'WTime')
              end
              object CB128: TCheckBox
                Left = 520
                Top = 66
                Width = 17
                Height = 17
                Caption = 'CB128'
                TabOrder = 16
                OnClick = CB128Click
              end
              object CBisX: TCheckBox
                Left = 439
                Top = 148
                Width = 33
                Height = 17
                Alignment = taLeftJustify
                Caption = 'X'
                Checked = True
                State = cbChecked
                TabOrder = 17
              end
            end
            object TabSheet2: TTabSheet
              Caption = #1055#1086#1088#1090
              ImageIndex = 1
              object GroupBox6: TGroupBox
                Left = 0
                Top = 123
                Width = 689
                Height = 42
                TabOrder = 2
                object BWriteStp: TButton
                  Left = 622
                  Top = 14
                  Width = 60
                  Height = 20
                  Caption = 'Write'
                  TabOrder = 0
                  TabStop = False
                  OnClick = BResetClick
                end
                object BGetStpC: TButton
                  Left = 169
                  Top = 14
                  Width = 60
                  Height = 20
                  Caption = 'Cur'
                  TabOrder = 1
                  TabStop = False
                  OnClick = BResetClick
                end
                object BGetStpT: TButton
                  Left = 291
                  Top = 14
                  Width = 60
                  Height = 20
                  Caption = 'Tmp'
                  TabOrder = 2
                  TabStop = False
                  OnClick = BResetClick
                end
                object BGetStpN: TButton
                  Left = 352
                  Top = 14
                  Width = 60
                  Height = 20
                  Caption = 'NVM'
                  TabOrder = 3
                  TabStop = False
                  OnClick = BResetClick
                end
                object BSetTmp: TButton
                  Left = 5
                  Top = 14
                  Width = 60
                  Height = 20
                  Caption = 'SetTmp'
                  TabOrder = 4
                  TabStop = False
                  OnClick = BResetClick
                end
                object EB1: TEdit
                  Left = 69
                  Top = 13
                  Width = 33
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 5
                  Text = '4'
                end
                object EB2: TEdit
                  Left = 109
                  Top = 13
                  Width = 33
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 6
                  Text = '99'
                end
                object BCopyStp: TButton
                  Left = 230
                  Top = 14
                  Width = 60
                  Height = 20
                  Caption = 'Copy'
                  TabOrder = 7
                  TabStop = False
                  OnClick = BResetClick
                end
              end
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 328
                Height = 105
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 0
                object BOpen: TButton
                  Left = 5
                  Top = 7
                  Width = 74
                  Height = 24
                  Caption = 'Open'
                  TabOrder = 0
                  TabStop = False
                  OnClick = BOpenClick
                end
                object CBRes: TCheckBox
                  Left = 301
                  Top = 12
                  Width = 17
                  Height = 15
                  TabStop = False
                  Caption = 'CBRes'
                  TabOrder = 1
                end
                object BClose: TButton
                  Left = 83
                  Top = 7
                  Width = 74
                  Height = 24
                  Caption = 'Close'
                  TabOrder = 2
                  TabStop = False
                  OnClick = BCloseClick
                end
                object BWrite: TButton
                  Left = 5
                  Top = 39
                  Width = 74
                  Height = 24
                  Caption = 'Write'
                  TabOrder = 3
                  TabStop = False
                  OnClick = BWriteClick
                end
                object BRead: TButton
                  Left = 5
                  Top = 71
                  Width = 74
                  Height = 24
                  Caption = 'Read'
                  TabOrder = 4
                  TabStop = False
                  OnClick = BReadClick
                end
                object ETime: TEdit
                  Left = 163
                  Top = 7
                  Width = 73
                  Height = 26
                  TabStop = False
                  TabOrder = 5
                end
                object EWBytes: TEdit
                  Left = 83
                  Top = 40
                  Width = 73
                  Height = 26
                  TabStop = False
                  TabOrder = 6
                  Text = '8'
                end
                object EWTOut: TEdit
                  Left = 163
                  Top = 40
                  Width = 73
                  Height = 26
                  TabStop = False
                  TabOrder = 7
                  Text = '1000'
                end
                object ERBytes: TEdit
                  Left = 83
                  Top = 73
                  Width = 73
                  Height = 26
                  TabStop = False
                  TabOrder = 8
                  Text = '100'
                end
                object ERTOut: TEdit
                  Left = 163
                  Top = 73
                  Width = 73
                  Height = 26
                  TabStop = False
                  TabOrder = 9
                  Text = '5000'
                end
                object BPurge: TButton
                  Left = 243
                  Top = 39
                  Width = 74
                  Height = 24
                  Caption = 'Purge'
                  TabOrder = 10
                  TabStop = False
                  OnClick = BPurgeClick
                end
                object BCheck: TButton
                  Left = 243
                  Top = 71
                  Width = 74
                  Height = 24
                  Caption = 'Check'
                  TabOrder = 11
                  TabStop = False
                  OnClick = BCheckClick
                end
                object ECOM: TEdit
                  Left = 242
                  Top = 7
                  Width = 53
                  Height = 26
                  TabOrder = 12
                end
              end
              object GroupBox5: TGroupBox
                Left = 456
                Top = -8
                Width = 130
                Height = 113
                TabOrder = 1
                object CBCRCErr: TCheckBox
                  Left = 6
                  Top = 16
                  Width = 89
                  Height = 25
                  Caption = 'CRC Error'
                  TabOrder = 0
                  OnClick = CBCRCErrClick
                end
                object CBWErr: TCheckBox
                  Left = 7
                  Top = 40
                  Width = 96
                  Height = 25
                  Caption = 'Write Error'
                  TabOrder = 1
                  OnClick = CBWErrClic
                end
              end
              object GroupBox7: TGroupBox
                Left = 584
                Top = -8
                Width = 105
                Height = 113
                TabOrder = 3
                object EVolC: TEdit
                  Left = 8
                  Top = 15
                  Width = 90
                  Height = 26
                  TabStop = False
                  TabOrder = 0
                end
                object BVolSN: TButton
                  Left = 18
                  Top = 81
                  Width = 74
                  Height = 24
                  Caption = 'SN'
                  TabOrder = 1
                  TabStop = False
                  OnClick = BVolSNClick
                end
                object EVolD: TEdit
                  Left = 8
                  Top = 47
                  Width = 90
                  Height = 26
                  TabStop = False
                  TabOrder = 2
                end
              end
              object ERStp: TLabeledEdit
                Left = 0
                Top = 106
                Width = 688
                Height = 24
                Color = clBtnFace
                EditLabel.Width = 5
                EditLabel.Height = 18
                EditLabel.Caption = 'ERStp'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                LabelPosition = lpLeft
                LabelSpacing = 3
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object StaticText1: TStaticText
                Left = 5
                Top = 168
                Width = 118
                Height = 22
                Caption = '04 - '#1072#1076#1088#1077#1089' '#1073#1083#1086#1082#1072
                TabOrder = 5
              end
              object StaticText2: TStaticText
                Left = 5
                Top = 184
                Width = 134
                Height = 22
                Caption = '05 - '#1072#1076#1088#1077#1089' '#1076#1072#1090#1095#1080#1082#1072
                TabOrder = 6
              end
              object StaticText3: TStaticText
                Left = 5
                Top = 200
                Width = 59
                Height = 22
                Caption = '28 - n50'
                TabOrder = 7
              end
              object CBTCP: TCheckBox
                Left = 8
                Top = 240
                Width = 17
                Height = 17
                Caption = 'CBTCP'
                TabOrder = 8
              end
              object BTCP: TButton
                Left = 27
                Top = 236
                Width = 74
                Height = 24
                Caption = 'TCP'
                TabOrder = 9
                TabStop = False
                OnClick = BTCPClick
              end
              object ETCP: TEdit
                Left = 109
                Top = 237
                Width = 33
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 10
                Text = '0'
              end
            end
          end
        end
        object TSAcc: TTabSheet
          Caption = #1059#1089#1082#1086#1088#1077#1085#1080#1103
          ImageIndex = 4
          TabVisible = False
          DesignSize = (
            1141
            729)
          object ToolBar: TToolBar
            Left = 0
            Top = 0
            Width = 1141
            Height = 30
            AutoSize = True
            ButtonHeight = 26
            ButtonWidth = 27
            Caption = 'ToolBar'
            EdgeBorders = [ebTop, ebBottom]
            Flat = True
            Images = ImageList
            TabOrder = 0
            object TBOpen: TToolButton
              Left = 0
              Top = 0
              Action = AOpen
            end
            object TBCopy: TToolButton
              Left = 27
              Top = 0
              Action = ACopy
            end
            object TBSave: TToolButton
              Left = 54
              Top = 0
              Action = ASave
              Visible = False
            end
            object ToolButton3: TToolButton
              Left = 81
              Top = 0
              Width = 8
              Caption = 'ToolButton3'
              ImageIndex = 8
              Style = tbsSeparator
            end
            object TBCanSave: TToolButton
              Left = 89
              Top = 0
              Action = ACanSave
            end
            object TBPrint: TToolButton
              Left = 116
              Top = 0
              Action = APrint
              Visible = False
            end
            object TBUndo: TToolButton
              Left = 143
              Top = 0
              Action = AUndo
              Visible = False
            end
            object TBDel: TToolButton
              Left = 170
              Top = 0
              Action = ADel
              Visible = False
            end
            object TBTest: TToolButton
              Left = 197
              Top = 0
              Action = ASetup
              Visible = False
            end
            object TBMeasStp: TToolButton
              Left = 224
              Top = 0
              Action = AMeasStp
              Visible = False
            end
            object TBRes: TToolButton
              Left = 251
              Top = 0
              Action = ARes
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object TBShowRes: TToolButton
              Left = 278
              Top = 0
              Action = AShowRes
              Visible = False
            end
            object ToolButton10: TToolButton
              Left = 305
              Top = 0
              Width = 8
              Caption = 'ToolButton10'
              ImageIndex = 6
              Style = tbsSeparator
            end
            object TBChart: TToolButton
              Left = 313
              Top = 0
              Action = AChartDlg
            end
            object ToolButton7: TToolButton
              Left = 340
              Top = 0
              Width = 8
              Caption = 'ToolButton7'
              ImageIndex = 6
              Style = tbsSeparator
            end
            object TBXY: TToolButton
              Left = 348
              Top = 0
              Caption = 'TBXY'
              ImageIndex = 33
              OnClick = TBXYClick
            end
            object CBProc: TComboBox
              Left = 375
              Top = 0
              Width = 130
              Height = 26
              BevelOuter = bvNone
              Ctl3D = True
              ItemHeight = 18
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 0
              Text = 'a(t)'
              Items.Strings = (
                'a(t)'
                'FFT{a(t)}(f)'
                'DFT{a(t)}(f)')
            end
            object TBStart: TToolButton
              Left = 505
              Top = 0
              Action = AStop
              AutoSize = True
              ParentShowHint = False
              ShowHint = True
            end
            object CBSNGroup: TComboBox
              Left = 532
              Top = 0
              Width = 130
              Height = 26
              BevelOuter = bvNone
              Ctl3D = True
              ItemHeight = 18
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 2
              Text = 'Continuous'
              Items.Strings = (
                'Continuous'
                '32'
                '64'
                '128'
                '256'
                '512'
                '1024'
                '2048'
                '4096'
                '8192'
                '16384'
                '32768'
                '65536'
                '131072'
                '262144'
                '524288'
                '1048576')
            end
            object ToolButton8: TToolButton
              Left = 662
              Top = 0
              Width = 8
              Caption = 'ToolButton8'
              Enabled = False
              ImageIndex = 8
              Style = tbsSeparator
            end
            object ToolButton1: TToolButton
              Left = 670
              Top = 0
              Caption = 'ToolButton1'
              ImageIndex = 22
              Visible = False
              OnClick = ToolButton1Click
            end
            object CBTest: TCheckBox
              Left = 697
              Top = 0
              Width = 77
              Height = 26
              Alignment = taLeftJustify
              Caption = '  Test'
              TabOrder = 1
              Visible = False
            end
          end
          object PAcc: TPanel
            Left = 0
            Top = 952
            Width = 1540
            Height = 33
            Anchors = [akLeft, akRight, akBottom]
            TabOrder = 1
          end
          object Chart: TChart
            Left = 0
            Top = 30
            Width = 1141
            Height = 675
            Cursor = crCross
            AllowPanning = pmNone
            AllowZoom = False
            BackWall.Brush.Color = clWhite
            BackWall.Color = clWhite
            LeftWall.Brush.Color = clWhite
            Title.Text.Strings = (
              'TChart')
            Title.Visible = False
            BackColor = clWhite
            BottomAxis.Axis.Width = 1
            BottomAxis.AxisValuesFormat = '0.###'
            BottomAxis.DateTimeFormat = 'dd.MM.yyyy hh:mm:ss'
            BottomAxis.ExactDateTime = False
            BottomAxis.LabelsMultiLine = True
            BottomAxis.LabelStyle = talValue
            LeftAxis.Axis.Width = 1
            LeftAxis.AxisValuesFormat = '0.###'
            LeftAxis.LabelStyle = talValue
            Legend.ColorWidth = 50
            Legend.LegendStyle = lsSeries
            Legend.ShadowSize = 0
            Legend.TopPos = 4
            Legend.VertMargin = 1
            Legend.Visible = False
            View3D = False
            View3DWalls = False
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 2
            Constraints.MinHeight = 30
            object Series1: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clRed
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series2: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series3: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series4: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series5: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series6: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series7: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series8: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series9: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series10: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series11: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series12: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series13: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series14: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series15: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series16: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series17: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series18: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series19: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series20: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series21: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series22: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series23: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series24: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series25: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series26: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series27: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series28: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series29: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series30: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series31: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series32: TLineSeries
              Cursor = crHandPoint
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clBlack
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object LSTime: TFastLineSeries
              Active = False
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clRed
              Title = 'LSTime'
              LinePen.Color = clRed
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object BSelect: TChartShape
              Active = False
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clWhite
              ShowInLegend = False
              Title = 'BSelect'
              Brush.Color = clLime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Pen.Mode = pmMask
              Style = chasRectangle
              X0 = 3.125
              X1 = 21.875
              Y0 = 70
              Y1 = 259
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
          end
          object StatusBar1: TStatusBar
            Left = 0
            Top = 705
            Width = 1141
            Height = 24
            Panels = <
              item
                Alignment = taRightJustify
                Width = 70
              end
              item
                Width = 70
              end
              item
                Alignment = taRightJustify
                Width = 70
              end
              item
                Alignment = taRightJustify
                Width = 70
              end
              item
                Width = 50
              end>
            SimplePanel = False
          end
        end
      end
    end
  end
  object PanelTV: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 1017
    Align = alLeft
    BorderWidth = 2
    Constraints.MinHeight = 100
    Constraints.MinWidth = 100
    TabOrder = 0
    DesignSize = (
      437
      1017)
    object Image3: TImage
      Left = 196
      Top = 212
      Width = 105
      Height = 105
    end
    object TreeView: TTreeView
      Left = 3
      Top = 3
      Width = 431
      Height = 1011
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      HideSelection = False
      Images = Images16x16
      Indent = 20
      ParentFont = False
      PopupMenu = PortsMenu
      ReadOnly = True
      RightClickSelect = True
      TabOrder = 0
      OnClick = TreeViewClick
      OnDblClick = TreeViewDblClick
      OnKeyDown = TreeViewKeyDown
    end
    object MEPass: TMaskEdit
      Left = 212
      Top = 859
      Width = 177
      Height = 24
      Anchors = [akLeft, akBottom]
      PasswordChar = '*'
      TabOrder = 1
      Visible = False
      OnChange = MEPassChange
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 1017
    Width = 1589
    Height = 24
    Panels = <
      item
        Width = 200
      end
      item
        Style = psOwnerDraw
        Width = 60
      end
      item
        Width = 60
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    SimplePanel = False
    OnMouseDown = StatusBarMouseDown
    OnDrawPanel = StatusBarDrawPanel
  end
  object Tray: TTrayIcon
    Visible = True
    Hint = #1057#1077#1088#1074#1077#1088
    Hide = True
    RestoreOn = imLeftClickUp
    PopupMenuOn = imNone
    AnimateInterval = 100
    OnClick = TrayClick
    Left = 6
    Top = 61
  end
  object AppEvents: TApplicationEvents
    OnMessage = AppEventsMessage
    Left = 6
    Top = 109
  end
  object TrayMenu: TPopupMenu
    AutoPopup = False
    Left = 38
    Top = 5
    object MTState: TMenuItem
      Caption = 'BS4I1 '#1057#1077#1088#1074#1077#1088
      OnClick = MTStateClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MTExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      Visible = False
      OnClick = MTExitClick
    end
  end
  object PortsMenu: TPopupMenu
    OnPopup = PortsMenuPopup
    Left = 6
    Top = 5
    object MPortOn: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1088#1090' COMXXX'
      OnClick = MPortOnClick
    end
    object MPortDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1088#1090' COMXXX'
      OnClick = MPortDelClick
    end
    object MPortAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1088#1090
      OnClick = MPortAddClick
    end
    object N2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object MSensOn: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1076#1072#1090#1095#1080#1082' '#1061#1061#1061
      OnClick = MSensOnClick
    end
    object MSensDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1072#1090#1095#1080#1082' '#1061#1061#1061
      OnClick = MSensDelClick
    end
    object MSensAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1072#1090#1095#1080#1082
      OnClick = MSensAddClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object MSetup: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1080#1089#1090#1077#1084#1099' '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075#1072'  ['#1054#1073#1097#1080#1077']'
      OnClick = MSetupClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      Visible = False
      OnClick = MTExitClick
    end
  end
  object Images16x16: TImageList
    Left = 38
    Top = 205
    Bitmap = {
      494C010116001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFFFEF00EFFFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF7F700FFF7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEF7DE007BDE7B0039C6390018BD180018B5180039BD39007BCE7B00DEF7
      DE00000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700DECED600CEB5BD00C69CAD00BD9CAD00C6A5B500D6C6CE00F7EF
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5F7
      A50018D6180000C6000000B5000000B5000000AD000000A50000009C000018AD
      1800A5DEA500000000000000000000000000000000000000000000000000EFE7
      E700CEB5BD00BDA5AD00BD9CA500BD94A500B58C9C00B58C9C00AD849400BD94
      A500E7D6DE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5F7A50000DE
      000000D6000000D6000000DE000000E7000000E7000000D6000000B5000000A5
      000000A50000A5DEA50000000000000000000000000000000000EFE7EF00CEBD
      C600C6B5BD00C6B5BD00CEBDC600CEC6C600CEBDC600C6B5BD00BD9CA500B58C
      9C00B58C9C00E7D6DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEFFDE0010EF100000E7
      000000EF000000F7000000FF000000FF000000FF000000FF000000EF000000BD
      000000A5000010B51000DEF7DE000000000000000000F7F7F700D6CECE00CEBD
      C600CEC6CE00D6D6D600D6D6D600D6DED600D6DED600D6D6D600CECECE00BDA5
      AD00B58C9C00BD9CAD00F7EFF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BFF7B0000FF000000F7
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000EF
      000000BD000000AD00007BD67B000000000000000000EFEFEF00D6CED600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6DED600D6CE
      CE00BDA5AD00B58C9C00DEC6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004AFF4A0010FF100008FF
      080000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000DE000000B5000031CE31000000000000000000E7E7E700D6DED600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600CEBDBD00BD9CA500CEB5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7FFF70042FF420031FF310010FF
      100000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000EF000000C6000010CE1000EFFFF70000000000DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600CEC6CE00C6A5B500C6ADB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7FFF7005AFF5A004AFF4A0018FF
      180000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000F7000000D6000010D61000EFFFF70000000000E7E7E700E7E7E700DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6CECE00C6ADB500CEB5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084FF84005AFF5A0039FF
      390000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000F7000000DE000031E731000000000000000000EFEFEF00E7E7E700DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6CECE00CEBDBD00D6C6CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5FFB50073FF73006BFF
      6B0018FF180000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000F7000000EF00007BF77B000000000000000000F7F7F700E7E7E700E7E7
      E700DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600CEC6CE00E7DEE700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFFFEF008CFF8C0084FF
      84006BFF6B0021FF210000FF000000FF000000FF000000FF000008FF080018FF
      180000FF000018FF1800DEFFDE00000000000000000000000000EFEFEF00EFEF
      EF00E7E7E700DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00D6D6D600D6D6D600F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6FFD6008CFF
      8C008CFF8C007BFF7B004AFF4A0031FF310029FF290031FF310039FF390021FF
      210010FF1000ADFFAD0000000000000000000000000000000000F7F7F700EFEF
      EF00EFEFEF00EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6FF
      D6009CFF9C008CFF8C008CFF8C0084FF840073FF730063FF630042FF42004AFF
      4A00B5FFB500000000000000000000000000000000000000000000000000F7F7
      F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00DEDE
      DE00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFF700C6FFC600A5FFA5008CFF8C0084FF84008CFF8C00ADFFAD00E7FF
      E700000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7FFF700F7FFF70000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FFF1
      FF00F900F300EF00E200EA00D900EA00D900EA00D900EA00D900EB00DC00EC00
      DE00FEF0FD00000000000000000000000000000000000000000000000000FBF7
      F100B76B0000B0610000AC5C0000AC5C0000AC5C0000AC5C0000AE5E0000AE5F
      0000FAF6F000000000000000000000000000000000000000000000000000FDFD
      FD00D2CACD00C9B7BF00C5ADB700C5ADB700C5ADB700C5ADB700C6B0B900C7B2
      BB00FCFBFB00000000000000000000000000000000000000000000000000F1F8
      F10000760000006B000000650000006500000065000000650000006700000068
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF16FF00FB00F900F500EC00F500EC00F500EC00F500EC00F400EC00F100
      E700FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300C27E1600B96E0000B4670000B4670000B4670000B4670000B4670000B264
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00DADADA00D4D0D200CEC3C700CEC3C700CEC3C700CEC3C700CEC2C700CCBC
      C200FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F30016881600007900000071000000710000007100000071000000710000006E
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF2DFF00FF18FF00FF00FF00FF00FF00FF00FF00FF00FF00F900F500F300
      E800FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300C88B2D00C27F1800BC720000BC720000BC720000BC720000B86C0000B365
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F3002D942D0018891800007D0000007D0000007D0000007D000000760000006F
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF2DFF00FF18FF00FF00FF00FF00FF00FF00FF00FF00FF00F900F500F300
      E800FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300C88B2D00C27F1800BC720000BC720000BC720000BC720000B86C0000B365
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F3002D942D0018891800007D0000007D0000007D0000007D000000760000006F
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF2DFF00FF18FF00FF00FF00FF00FF00FF00FF00FF00FF00F900F500F300
      E800FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300C88B2D00C27F1800BC720000BC720000BC720000BC720000B86C0000B365
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F3002D942D0018891800007D0000007D0000007D0000007D000000760000006F
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF2DFF00FF18FF00FF00FF00FF00FF00FF00FF00FF00FF00F900F500F300
      E800FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300C88B2D00C27F1800BC720000BC720000BC720000BC720000B86C0000B365
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F3002D942D0018891800007D0000007D0000007D0000007D000000760000006F
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF2DFF00FF18FF00FF00FF00FF00FF00FF00FF00FF00FF00F900F500F300
      E800FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300C88B2D00C27F1800BC720000BC720000BC720000BC720000B86C0000B365
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F3002D942D0018891800007D0000007D0000007D0000007D000000760000006F
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF2DFF00FF18FF00FF00FF00FF00FF00FF00FF00FF00FF00F900F500F300
      E800FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300C88B2D00C27F1800BC720000BC720000BC720000BC720000B86C0000B365
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F3002D942D0018891800007D0000007D0000007D0000007D000000760000006F
      0000F0F6F000000000000000000000000000000000000000000000000000FFF3
      FF00FF37FF00FF30FF00FF2EFF00FF2EFF00FF2EFF00FF2EFF00FF0EFF00F800
      F300FEF0FE00000000000000000000000000000000000000000000000000FCF8
      F300CA903700C98D3000C88B2E00C88B2E00C88B2E00C88B2E00C07A0E00B76B
      0000FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00E0E0E000DFDFDF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D9D9D900D1CA
      CD00FCFBFC00000000000000000000000000000000000000000000000000F3F9
      F30037993700309530002E942E002E942E002E942E002E942E000E840E000075
      0000F0F7F000000000000000000000000000000000000000000000000000FFF4
      FF00FF50FF00FF52FF00FF55FF00FF55FF00FF55FF00FF55FF00FF41FF00FF15
      FF00FFF0FE00000000000000000000000000000000000000000000000000FCF9
      F400D19E5000D29F5200D2A15500D2A15500D2A15500D2A15500CD964100C27E
      1500FBF6F000000000000000000000000000000000000000000000000000FDFD
      FD00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E1E1E100DADA
      DA00FCFCFC00000000000000000000000000000000000000000000000000F4F9
      F40050A6500052A7520055A8550055A8550055A8550055A85500419E41001588
      1500F0F7F0000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000F1FF
      F10000F0000000D9000000CE000000CE000000CE000000CE000000D1000000D4
      0000F0FDF000000000000000000000000000000000000000000000000000FFF1
      F100F9000000EF000000EA000000EA000000EA000000EA000000EB000000EC00
      0000FEF0F000000000000000000000000000000000000000000000000000F1FF
      FF0000F0F30000D9E20000CED90000CED90000CED90000CED90000D1DC0000D4
      DE00F0FDFD00000000000000000000000000000000000000000000000000FFFF
      F100F9F00000EFD90000EACE0000EACE0000EACE0000EACE0000EBD10000ECD4
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F30016FF160000F7000000E7000000E7000000E7000000E7000000E6000000DF
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF161600FB000000F5000000F5000000F5000000F5000000F4000000F100
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF0016FFFF0000F7F90000E7EC0000E7EC0000E7EC0000E7EC0000E6EC0000DF
      E700F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF1600FBF70000F5E70000F5E70000F5E70000F5E70000F4E60000F1DF
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F3002DFF2D0018FF180000FF000000FF000000FF000000FF000000F2000000E2
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF2D2D00FF181800FF000000FF000000FF000000FF000000F9000000F300
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF002DFFFF0018FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F2F50000E2
      E800F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF2D00FFFF1800FFFF0000FFFF0000FFFF0000FFFF0000F9F20000F3E2
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F3002DFF2D0018FF180000FF000000FF000000FF000000FF000000F2000000E2
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF2D2D00FF181800FF000000FF000000FF000000FF000000F9000000F300
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF002DFFFF0018FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F2F50000E2
      E800F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF2D00FFFF1800FFFF0000FFFF0000FFFF0000FFFF0000F9F20000F3E2
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F3002DFF2D0018FF180000FF000000FF000000FF000000FF000000F2000000E2
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF2D2D00FF181800FF000000FF000000FF000000FF000000F9000000F300
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF002DFFFF0018FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F2F50000E2
      E800F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF2D00FFFF1800FFFF0000FFFF0000FFFF0000FFFF0000F9F20000F3E2
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F3002DFF2D0018FF180000FF000000FF000000FF000000FF000000F2000000E2
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF2D2D00FF181800FF000000FF000000FF000000FF000000F9000000F300
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF002DFFFF0018FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F2F50000E2
      E800F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF2D00FFFF1800FFFF0000FFFF0000FFFF0000FFFF0000F9F20000F3E2
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F3002DFF2D0018FF180000FF000000FF000000FF000000FF000000F2000000E2
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF2D2D00FF181800FF000000FF000000FF000000FF000000F9000000F300
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF002DFFFF0018FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F2F50000E2
      E800F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF2D00FFFF1800FFFF0000FFFF0000FFFF0000FFFF0000F9F20000F3E2
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F3002DFF2D0018FF180000FF000000FF000000FF000000FF000000F2000000E2
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF2D2D00FF181800FF000000FF000000FF000000FF000000F9000000F300
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF002DFFFF0018FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F2F50000E2
      E800F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF2D00FFFF1800FFFF0000FFFF0000FFFF0000FFFF0000F9F20000F3E2
      0000FEFDF000000000000000000000000000000000000000000000000000F3FF
      F30037FF370030FF30002EFF2E002EFF2E002EFF2E002EFF2E000EFF0E0000EF
      0000F0FDF000000000000000000000000000000000000000000000000000FFF3
      F300FF373700FF303000FF2E2E00FF2E2E00FF2E2E00FF2E2E00FF0E0E00F800
      0000FEF0F000000000000000000000000000000000000000000000000000F3FF
      FF0037FFFF0030FFFF002EFFFF002EFFFF002EFFFF002EFFFF000EFFFF0000EF
      F300F0FDFE00000000000000000000000000000000000000000000000000FFFF
      F300FFFF3700FFFF3000FFFF2E00FFFF2E00FFFF2E00FFFF2E00FFFF0E00F8EF
      0000FEFDF000000000000000000000000000000000000000000000000000F4FF
      F40050FF500052FF520055FF550055FF550055FF550055FF550041FF410015FF
      1500F0FEF000000000000000000000000000000000000000000000000000FFF4
      F400FF505000FF525200FF555500FF555500FF555500FF555500FF414100FF15
      1500FFF0F000000000000000000000000000000000000000000000000000F4FF
      FF0050FFFF0052FFFF0055FFFF0055FFFF0055FFFF0055FFFF0041FFFF0015FF
      FF00F0FEFE00000000000000000000000000000000000000000000000000FFFF
      F400FFFF5000FFFF5200FFFF5500FFFF5500FFFF5500FFFF5500FFFF4100FFFF
      1500FFFEF0000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000FFF7F700FFF7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFF7EF00EFF7EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700DECED600CEB5BD00C69CAD00BD9CAD00C6A5B500D6C6CE00F7EF
      F700000000000000000000000000000000000000000000000000000000000000
      0000DEEFDE007BAD7B00397B3900186B180018631800397B39007BA57B00DEE7
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFE7
      E700CEB5BD00BDA5AD00BD9CA500BD94A500B58C9C00B58C9C00AD849400BD94
      A500E7D6DE00000000000000000000000000000000000000000000000000A5CE
      A50018731800005A0000005200000052000000520000004A0000004200001863
      1800A5C6A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFE7EF00CEBD
      C600C6B5BD00C6B5BD00CEBDC600CEC6C600CEBDC600C6B5BD00BD9CA500B58C
      9C00B58C9C00E7D6DE0000000000000000000000000000000000A5CEA500006B
      000000630000006B0000006B00000073000000730000006B0000005A0000004A
      000000520000A5C6A5000000000000000000000000000000000000000000FDFD
      FD00D2CACD00C9B7BF00C5ADB700C5ADB700C5ADB700C5ADB700C6B0B900C7B2
      BB00FCFBFB00000000000000000000000000000000000000000000000000F1F1
      FF000000F3000000E2000000D9000000D9000000D9000000D9000000DC000000
      DE00F0F0FD0000000000000000000000000000000000F7F7F700D6CECE00CEBD
      C600CEC6CE00D6D6D600D6D6D600D6DED600D6DED600D6D6D600CECECE00BDA5
      AD00B58C9C00BD9CAD00F7EFF7000000000000000000DEEFDE0010841000006B
      000000730000007B0000007B0000007B0000007B0000007B0000007300000063
      0000004A000010631000DEEFDE0000000000000000000000000000000000FDFD
      FD00DADADA00D4D0D200CEC3C700CEC3C700CEC3C700CEC3C700CEC2C700CCBC
      C200FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF001616FF000000F9000000EC000000EC000000EC000000EC000000EC000000
      E700F0F0FE0000000000000000000000000000000000EFEFEF00D6CED600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6DED600D6CE
      CE00BDA5AD00B58C9C00DEC6CE0000000000000000007BBD7B0000730000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B00000073
      0000005A0000004A00007BA57B0000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF002D2DFF001818FF000000FF000000FF000000FF000000FF000000F5000000
      E800F0F0FE0000000000000000000000000000000000E7E7E700D6DED600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600CEBDBD00BD9CA500CEB5BD0000000000000000004AA54A00108410000884
      0800007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000006B000000520000317B310000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF002D2DFF001818FF000000FF000000FF000000FF000000FF000000F5000000
      E800F0F0FE0000000000000000000000000000000000DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600CEC6CE00C6A5B500C6ADB50000000000F7FFF700429C4200319431001084
      1000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      00000073000000630000106B1000EFF7EF00000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF002D2DFF001818FF000000FF000000FF000000FF000000FF000000F5000000
      E800F0F0FE0000000000000000000000000000000000E7E7E700E7E7E700DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6CECE00C6ADB500CEB5BD0000000000F7FFF7005AAD5A004AA54A00188C
      1800007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B00000063000010731000EFF7EF00000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF002D2DFF001818FF000000FF000000FF000000FF000000FF000000F5000000
      E800F0F0FE0000000000000000000000000000000000EFEFEF00E7E7E700DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6CECE00CEBDBD00D6C6CE00000000000000000084BD84005AAD5A00399C
      3900007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000006B0000318C310000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF002D2DFF001818FF000000FF000000FF000000FF000000FF000000F5000000
      E800F0F0FE0000000000000000000000000000000000F7F7F700E7E7E700E7E7
      E700DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600CEC6CE00E7DEE7000000000000000000B5DEB50073B573006BB5
      6B00188C1800007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000006B00007BB57B0000000000000000000000000000000000FDFD
      FD00DEDEDE00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D2CCCE00CCBE
      C400FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF002D2DFF001818FF000000FF000000FF000000FF000000FF000000F5000000
      E800F0F0FE000000000000000000000000000000000000000000EFEFEF00EFEF
      EF00E7E7E700DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00D6D6D600D6D6D600F7F7F7000000000000000000EFF7EF008CC68C0084BD
      84006BB56B00218C2100007B0000007B0000007B0000007B000008840800188C
      1800007B000018841800DEEFDE0000000000000000000000000000000000FDFD
      FD00E0E0E000DFDFDF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D9D9D900D1CA
      CD00FCFBFC00000000000000000000000000000000000000000000000000F3F3
      FF003737FF003030FF002E2EFF002E2EFF002E2EFF002E2EFF000E0EFF000000
      F300F0F0FE000000000000000000000000000000000000000000F7F7F700EFEF
      EF00EFEFEF00EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00EFEFEF0000000000000000000000000000000000D6EFD6008CC6
      8C008CC68C007BBD7B004AA54A003194310029942900319C3100399C3900218C
      210010841000ADD6AD000000000000000000000000000000000000000000FDFD
      FD00E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E1E1E100DADA
      DA00FCFCFC00000000000000000000000000000000000000000000000000F4F4
      FF005050FF005252FF005555FF005555FF005555FF005555FF004141FF001515
      FF00F0F0FE00000000000000000000000000000000000000000000000000F7F7
      F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00DEDE
      DE00F7F7F700000000000000000000000000000000000000000000000000D6EF
      D6009CCE9C008CC68C008CC68C0084BD840073B5730063AD6300429C42004AA5
      4A00B5D6B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700C6E7C600A5CEA5008CC68C0084BD84008CC68C00ADD6AD00E7F7
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7FFF700F7FFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFFFFF00EFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFEF00FFFFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFEFFF00FFEFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7EF00F7F7EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEF7F7007BDEE70039C6D60018BDCE0018B5C60039BDCE007BCEDE00DEF7
      F700000000000000000000000000000000000000000000000000000000000000
      0000FFF7DE00EFDE7B00E7C63900DEBD1800DEB51800DEBD3900EFCE7B00F7F7
      DE00000000000000000000000000000000000000000000000000000000000000
      0000FFDEF700EF7BE700E739D600DE18CE00DE18C600DE39CE00EF7BDE00F7DE
      F700000000000000000000000000000000000000000000000000000000000000
      0000F7EFDE00D6AD7B00B57B3900AD631800AD5A1800B5733900CEA57B00F7E7
      DE0000000000000000000000000000000000000000000000000000000000A5F7
      F70018D6DE0000C6CE0000B5C60000B5C60000ADBD0000A5B500009CB50018AD
      BD00A5DEE700000000000000000000000000000000000000000000000000F7F7
      A500EFD61800E7C60000DEB50000DEB50000DEAD0000D6A50000D69C0000DEAD
      1800F7DEA500000000000000000000000000000000000000000000000000F7A5
      F700EF18DE00E700CE00DE00C600DE00C600DE00BD00D600B500D600B500DE18
      BD00F7A5E700000000000000000000000000000000000000000000000000E7C6
      A500B56B1800A54A0000A54A0000A54A00009C4A00009C4200009C390000A55A
      1800DEBDA5000000000000000000000000000000000000000000A5F7F70000DE
      E70000D6DE0000D6DE0000DEE70000E7EF0000E7E70000D6DE0000B5C60000A5
      B50000A5BD00A5DEE70000000000000000000000000000000000FFF7A500F7DE
      0000EFD60000EFD60000EFDE0000F7E70000F7E70000EFD60000DEB50000D6A5
      0000D6A50000EFDEA50000000000000000000000000000000000FFA5F700F700
      E700EF00DE00EF00DE00EF00E700F700EF00F700E700EF00DE00DE00C600D600
      B500D600BD00EFA5E70000000000000000000000000000000000E7CEA500B563
      0000AD5A0000AD630000B5630000B56B0000B5630000AD630000A55200009C42
      00009C4A0000DEBDA500000000000000000000000000DEFFFF0010EFF70000E7
      EF0000EFEF0000F7F70000FFFF0000FFFF0000FFFF0000FFFF0000EFF70000BD
      CE0000A5BD0010B5C600DEF7F7000000000000000000FFFFDE00F7EF1000F7E7
      0000F7EF0000FFF70000FFFF0000FFFF0000FFFF0000FFFF0000F7EF0000E7BD
      0000D6A50000DEB51000FFF7DE000000000000000000FFDEFF00F710F700F700
      EF00F700EF00FF00F700FF00FF00FF00FF00FF00FF00FF00FF00F700F700E700
      CE00D600BD00DE10C600FFDEF7000000000000000000F7EFDE00BD731000B563
      0000B56B0000BD6B0000BD730000BD730000BD730000BD730000B56B0000AD5A
      00009C4A0000AD5A1000F7E7DE0000000000000000007BFFFF0000FFFF0000F7
      F70000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000EF
      F70000BDCE0000ADBD007BD6DE000000000000000000FFFF7B00FFFF0000FFF7
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F7EF
      0000E7BD0000DEAD0000EFD67B000000000000000000FF7BFF00FF00FF00FF00
      F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F700
      F700E700CE00DE00BD00EF7BDE000000000000000000DEB57B00B56B0000BD6B
      0000BD730000BD730000BD730000BD730000BD730000BD730000BD730000B56B
      0000A55200009C420000CEA57B0000000000000000004AFFFF0010FFFF0008FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000DEE70000B5C60031CED6000000000000000000FFFF4A00FFFF1000FFFF
      0800FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000EFDE0000DEB50000E7CE31000000000000000000FF4AFF00FF10FF00FF08
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00EF00E700DE00C600E731D6000000000000000000CE9C4A00BD7B1000BD7B
      0800BD730000BD730000BD730000BD730000BD730000BD730000BD730000BD73
      0000B5630000A54A0000B57B310000000000F7FFFF0042FFFF0031FFFF0010FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000EFEF0000C6D60010CED600EFFFFF00FFFFF700FFFF4200FFFF3100FFFF
      1000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000F7EF0000E7C60000E7CE1000FFFFEF00FFF7FF00FF42FF00FF31FF00FF10
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00F700EF00E700D600E710D600FFF7FF00FFFFF700CE944200C68C3100BD7B
      1000BD730000BD730000BD730000BD730000BD730000BD730000BD730000BD73
      0000B56B0000AD5A0000B5631000FFF7F700F7FFFF005AFFFF004AFFFF0018FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000F7F70000D6DE0010D6DE00EFFFFF00FFFFF700FFFF5A00FFFF4A00FFFF
      1800FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000F7F70000EFD60000EFD61000FFFFEF00FFF7FF00FF5AFF00FF4AFF00FF18
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00F700F700EF00DE00EF10DE00FFF7FF00FFFFF700D6A55A00CE9C4A00C684
      1800BD730000BD730000BD730000BD730000BD730000BD730000BD730000BD73
      0000B56B0000AD5A0000B56B1000FFF7F7000000000084FFFF005AFFFF0039FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000F7F70000DEE70031E7E7000000000000000000FFFF8400FFFF5A00FFFF
      3900FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000F7F70000EFDE0000F7E731000000000000000000FF84FF00FF5AFF00FF39
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00F700F700EF00E700F731E7000000000000000000DEB58400D6A55A00CE94
      3900BD730000BD730000BD730000BD730000BD730000BD730000BD730000BD73
      0000B56B0000AD5A0000BD8431000000000000000000B5FFFF0073FFFF006BFF
      FF0018FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000F7F70000EFF7007BF7F7000000000000000000FFFFB500FFFF7300FFFF
      6B00FFFF1800FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFF70000F7EF0000FFF77B000000000000000000FFB5FF00FF73FF00FF6B
      FF00FF18FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00F700F700F700FF7BF7000000000000000000EFD6B500DEAD7300D6AD
      6B00C6841800BD6B0000BD730000BD730000BD730000BD730000BD730000BD73
      0000BD6B0000B5630000D6B57B000000000000000000EFFFFF008CFFFF0084FF
      FF006BFFFF0021FFFF0000FFFF0000FFFF0000FFFF0000FFFF0008FFFF0018FF
      FF0000FFFF0018FFFF00DEFFFF000000000000000000FFFFEF00FFFF8C00FFFF
      8400FFFF6B00FFFF2100FFFF0000FFFF0000FFFF0000FFFF0000FFFF0800FFFF
      1800FFFF0000FFFF1800FFFFDE000000000000000000FFEFFF00FF8CFF00FF84
      FF00FF6BFF00FF21FF00FF00FF00FF00FF00FF00FF00FF00FF00FF08FF00FF18
      FF00FF00FF00FF18FF00FFDEFF000000000000000000FFF7EF00DEBD8C00DEBD
      8400D6AD6B00C6842100BD730000BD6B0000BD6B0000BD730000BD7B0800BD7B
      1800BD730000BD7B1800F7EFDE00000000000000000000000000D6FFFF008CFF
      FF008CFFFF007BFFFF004AFFFF0031FFFF0029FFFF0031FFFF0039FFFF0021FF
      FF0010FFFF00ADFFFF0000000000000000000000000000000000FFFFD600FFFF
      8C00FFFF8C00FFFF7B00FFFF4A00FFFF3100FFFF2900FFFF3100FFFF3900FFFF
      2100FFFF1000FFFFAD0000000000000000000000000000000000FFD6FF00FF8C
      FF00FF8CFF00FF7BFF00FF4AFF00FF31FF00FF29FF00FF31FF00FF39FF00FF21
      FF00FF10FF00FFADFF0000000000000000000000000000000000F7E7D600DEBD
      8C00DEBD8C00DEB57B00CE9C4A00C68C3100C68C2900CE943100CE943900C684
      2100BD7B1000E7CEAD000000000000000000000000000000000000000000D6FF
      FF009CFFFF008CFFFF008CFFFF0084FFFF0073FFFF0063FFFF0042FFFF004AFF
      FF00B5FFFF00000000000000000000000000000000000000000000000000FFFF
      D600FFFF9C00FFFF8C00FFFF8C00FFFF8400FFFF7300FFFF6300FFFF4200FFFF
      4A00FFFFB500000000000000000000000000000000000000000000000000FFD6
      FF00FF9CFF00FF8CFF00FF8CFF00FF84FF00FF73FF00FF63FF00FF42FF00FF4A
      FF00FFB5FF00000000000000000000000000000000000000000000000000F7E7
      D600E7C69C00DEBD8C00DEBD8C00DEBD8400DEB57300D6A56300CE944200CE94
      4A00EFD6B5000000000000000000000000000000000000000000000000000000
      0000F7FFFF00C6FFFF00A5FFFF008CFFFF0084FFFF008CFFFF00ADFFFF00E7FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFF700FFFFC600FFFFA500FFFF8C00FFFF8400FFFF8C00FFFFAD00FFFF
      E700000000000000000000000000000000000000000000000000000000000000
      0000FFF7FF00FFC6FF00FFA5FF00FF8CFF00FF84FF00FF8CFF00FFADFF00FFE7
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFF7F700EFDEC600E7CEA500DEBD8C00DEBD8400DEBD8C00E7CEAD00F7F7
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7FFFF00F7FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFF700FFFFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF7FF00FFF7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFF700FFFFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF7F700FFF7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFFF00EFEFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFFFEF00EFFFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFEFEF00FFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700DECED600CEB5BD00C69CAD00BD9CAD00C6A5B500D6C6CE00F7EF
      F700000000000000000000000000000000000000000000000000000000000000
      0000DEDEF7007B7BE7003939D6001818CE001818C6003939CE007B7BDE00DEDE
      F700000000000000000000000000000000000000000000000000000000000000
      0000DEF7DE007BDE7B0039C6390018BD180018B5180039BD39007BCE7B00DEF7
      DE00000000000000000000000000000000000000000000000000000000000000
      0000FFDEDE00EF7B7B00E7393900DE181800DE181800DE393900EF7B7B00F7DE
      DE0000000000000000000000000000000000000000000000000000000000EFE7
      E700CEB5BD00BDA5AD00BD9CA500BD94A500B58C9C00B58C9C00AD849400BD94
      A500E7D6DE00000000000000000000000000000000000000000000000000A5A5
      F7001818DE000000CE000000C6000000C6000000BD000000B5000000B5001818
      BD00A5A5E700000000000000000000000000000000000000000000000000A5F7
      A50018D6180000C6000000B5000000B5000000AD000000A50000009C000018AD
      1800A5DEA500000000000000000000000000000000000000000000000000F7A5
      A500EF181800E7000000DE000000DE000000DE000000D6000000D6000000DE18
      1800F7A5A5000000000000000000000000000000000000000000EFE7EF00CEBD
      C600C6B5BD00C6B5BD00CEBDC600CEC6C600CEBDC600C6B5BD00BD9CA500B58C
      9C00B58C9C00E7D6DE0000000000000000000000000000000000A5A5F7000000
      E7000000DE000000DE000000E7000000EF000000E7000000DE000000C6000000
      B5000000BD00A5A5E70000000000000000000000000000000000A5F7A50000DE
      000000D6000000D6000000DE000000E7000000E7000000D6000000B5000000A5
      000000A50000A5DEA50000000000000000000000000000000000FFA5A500F700
      0000EF000000EF000000EF000000F7000000F7000000EF000000DE000000D600
      0000D6000000EFA5A500000000000000000000000000F7F7F700D6CECE00CEBD
      C600CEC6CE00D6D6D600D6D6D600D6DED600D6DED600D6D6D600CECECE00BDA5
      AD00B58C9C00BD9CAD00F7EFF7000000000000000000DEDEFF001010F7000000
      EF000000EF000000F7000000FF000000FF000000FF000000FF000000F7000000
      CE000000BD001010C600DEDEF7000000000000000000DEFFDE0010EF100000E7
      000000EF000000F7000000FF000000FF000000FF000000FF000000EF000000BD
      000000A5000010B51000DEF7DE000000000000000000FFDEDE00F7101000F700
      0000F7000000FF000000FF000000FF000000FF000000FF000000F7000000E700
      0000D6000000DE101000FFDEDE000000000000000000EFEFEF00D6CED600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6DED600D6CE
      CE00BDA5AD00B58C9C00DEC6CE0000000000000000007B7BFF000000FF000000
      F7000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      F7000000CE000000BD007B7BDE0000000000000000007BFF7B0000FF000000F7
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000EF
      000000BD000000AD00007BD67B000000000000000000FF7B7B00FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000F700
      0000E7000000DE000000EF7B7B000000000000000000E7E7E700D6DED600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600CEBDBD00BD9CA500CEB5BD0000000000000000004A4AFF001010FF000808
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000E7000000C6003131D60000000000000000004AFF4A0010FF100008FF
      080000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000DE000000B5000031CE31000000000000000000FF4A4A00FF101000FF08
      0800FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000EF000000DE000000E73131000000000000000000DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600CEC6CE00C6A5B500C6ADB50000000000F7F7FF004242FF003131FF001010
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000EF000000D6001010D600F7EFFF00F7FFF70042FF420031FF310010FF
      100000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000EF000000C6000010CE1000EFFFF700FFF7F700FF424200FF313100FF10
      1000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000F7000000E7000000E7101000FFEFEF0000000000E7E7E700E7E7E700DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6CECE00C6ADB500CEB5BD0000000000F7F7FF005A5AFF004A4AFF001818
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000F7000000DE001010DE00F7EFFF00F7FFF7005AFF5A004AFF4A0018FF
      180000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000F7000000D6000010D61000EFFFF700FFF7F700FF5A5A00FF4A4A00FF18
      1800FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000F7000000EF000000EF101000FFEFEF0000000000EFEFEF00E7E7E700DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6CECE00CEBDBD00D6C6CE0000000000000000008484FF005A5AFF003939
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000F7000000E7003131E700000000000000000084FF84005AFF5A0039FF
      390000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000F7000000DE000031E731000000000000000000FF848400FF5A5A00FF39
      3900FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000F7000000EF000000F73131000000000000000000F7F7F700E7E7E700E7E7
      E700DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600CEC6CE00E7DEE7000000000000000000B5B5FF007373FF006B6B
      FF001818FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000F7000000F7007B7BF7000000000000000000B5FFB50073FF73006BFF
      6B0018FF180000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000F7000000EF00007BF77B000000000000000000FFB5B500FF737300FF6B
      6B00FF181800FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000F7000000FF7B7B00000000000000000000000000EFEFEF00EFEF
      EF00E7E7E700DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00D6D6D600D6D6D600F7F7F7000000000000000000EFEFFF008C8CFF008484
      FF006B6BFF002121FF000000FF000000FF000000FF000000FF000808FF001818
      FF000000FF001818FF00DEDEFF000000000000000000EFFFEF008CFF8C0084FF
      84006BFF6B0021FF210000FF000000FF000000FF000000FF000008FF080018FF
      180000FF000018FF1800DEFFDE000000000000000000FFEFEF00FF8C8C00FF84
      8400FF6B6B00FF212100FF000000FF000000FF000000FF000000FF080800FF18
      1800FF000000FF181800FFDEDE00000000000000000000000000F7F7F700EFEF
      EF00EFEFEF00EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00EFEFEF0000000000000000000000000000000000D6D6FF008C8C
      FF008C8CFF007B7BFF004A4AFF003131FF002929FF003131FF003939FF002121
      FF001010FF00ADADFF0000000000000000000000000000000000D6FFD6008CFF
      8C008CFF8C007BFF7B004AFF4A0031FF310029FF290031FF310039FF390021FF
      210010FF1000ADFFAD0000000000000000000000000000000000FFD6D600FF8C
      8C00FF8C8C00FF7B7B00FF4A4A00FF313100FF292900FF313100FF393900FF21
      2100FF101000FFADAD000000000000000000000000000000000000000000F7F7
      F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00DEDE
      DE00F7F7F700000000000000000000000000000000000000000000000000D6D6
      FF009C9CFF008C8CFF008C8CFF008484FF007373FF006363FF004242FF004A4A
      FF00B5B5FF00000000000000000000000000000000000000000000000000D6FF
      D6009CFF9C008CFF8C008CFF8C0084FF840073FF730063FF630042FF42004AFF
      4A00B5FFB500000000000000000000000000000000000000000000000000FFD6
      D600FF9C9C00FF8C8C00FF8C8C00FF848400FF737300FF636300FF424200FF4A
      4A00FFB5B5000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7FF00C6C6FF00A5A5FF008C8CFF008484FF008C8CFF00ADADFF00E7E7
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F7FFF700C6FFC600A5FFA5008CFF8C0084FF84008CFF8C00ADFFAD00E7FF
      E700000000000000000000000000000000000000000000000000000000000000
      0000FFF7F700FFC6C600FFA5A500FF8C8C00FF848400FF8C8C00FFADAD00FFE7
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7FF00F7F7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7FFF700F7FFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF7F700FFF7F70000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FE7FFE7F00000000F00FF00F00000000
      E007E00700000000C003C0030000000080018001000000008001800100000000
      8001800100000000000080010000000000008001000000008001800100000000
      80018001000000008001C00100000000C003C00300000000E007E00700000000
      F00FF81F00000000FE7FFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE007E007E007E007E007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007E007E007E007E007FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE007E007E007E007E007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007E007E007E007E007FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFE7FFFFFFFFFF00FF00FFFFFFFFF
      E007E007FFFFFFFFC003C003E007E00780018001E007E00780018001E007E007
      80018001E007E00780010000E007E00780010000E007E00780018001E007E007
      80018001E007E007C0018001E007E007C003C003E007E007E007E007FFFFFFFF
      F81FF00FFFFFFFFFFFFFFE7FFFFFFFFFFE7FFE7FFE7FFE7FF00FF00FF00FF00F
      E007E007E007E007C003C003C003C00380018001800180018001800180018001
      8001800180018001000000000000000000000000000000008001800180018001
      80018001800180018001800180018001C003C003C003C003E007E007E007E007
      F00FF00FF00FF00FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FF00FF00FF00FF00F
      E007E007E007E007C003C003C003C00380018001800180018001800180018001
      8001800180018001800100000000000080010000000000008001800180018001
      8001800180018001C001800180018001C003C003C003C003E007E007E007E007
      F81FF00FF00FF00FFFFFFE7FFE7FFE7F00000000000000000000000000000000
      000000000000}
  end
  object Images32x32: TImageList
    Height = 32
    Width = 32
    Left = 6
    Top = 205
    Bitmap = {
      494C01010A000E00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000009E44400080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000800000009E444000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000256D22002A7026002F73
      2B0033762F00387934003B7C37003E803A0042843E0044884100468A4200478B
      4300478B4300478B4300478B4300478B4300478B4300478B4300478B4300478B
      4300478B4300478A4300478A4300478743004786430047844300478443004784
      430047844300478443004784430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000216A1E00266D23002B70
      27002F742C00337B2F00378434003B8C38003E933B0041983E00449B4000479D
      4300479E4300489E4400489E4400489E4400489E4400489E4400489E4400489E
      4400489E4400489D4400479B44004798430047934300478E4300478743004784
      430047844300478443004784430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000001E681B00226B1F00276F
      24002B7B28002F862C0033933000379D34003BA537003DAB3A0040B03D0043B2
      3F0046B3420047B3430048914400489244004892440048A1440048B4440048B4
      440048B4440048B3440048B0440048AB440048A54400489D440047944300478C
      430047854300478443004784430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000001B6618001F6A1C002376
      2100278525002B9529002FA32C0033AF300037B834003ABF37003DC33A0040C5
      3D0043C63F00449E410046844300489044004886450049A0450049AB450049C8
      450049C8450049C7450049C4450049BE450049B7440048AE440048A344004797
      4300478C4300478443004784430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000186415001C6C19001F7E
      1D002491220028A425002BB329002FC02D0033CA300036D1340039D436003CD6
      3A003EAB3C0041963E00448241004699440048854500499A460049AF460049D8
      460049D9460049D8450049D5450049CF450049C8450049BD450048B1440048A3
      440047944300478743004784430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000015631200197217001D86
      1B00209D1F0025B1230028C126002BCF2A002FD82D0032DF300035E3330037E4
      36003AA638003D9C3B0040863E00449F4100468A440048A2450049AC460049CD
      460049E6460049E5460049E2460049DD460049D5450049CB450049BD450048AE
      4400489D4400478E43004784430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000013641000167714001A8F
      18001DA71B0021BC1F0025CD230028DA26002AE429002DEA2C0031ED2F0033B6
      31003690340039A037003C883A0040A33E00448C410046A64400489A450049BE
      460049EF460049EE460049EC460049E7460049DF460049D5450049C8450049B7
      440048A54400479343004786430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF9A8159FF100E09FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF100E09FF9A8159FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000011640E00137C12001796
      15001BAE18001EC41C0021D6200024E3220027EB250029F127002CF42A002F9F
      2D003285300034A23300388836003CA53A00408D3E0044A841004690440047AA
      450048C345004AF5460049F2460049ED460049E7460049DD460049CF450049BE
      450048AB4400479843004787430080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF0D0A07FFD1AE79FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFD1AE79FF0F0D09FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000000F660D00117E1000149A
      120017B415001BCA19001DDC1C001FE81E0022F0210025F5240028BC26002AA0
      28002D842B0030A22E003488320038A636003C8D3A0040A93E004390410045AC
      430046C5440047F8440049F6450049F2460049EC460049E2460049D5450049C4
      450048B04400479B4400478A430080000000000000FFF6CD8EFFF6CD8EFF201B
      13FF605038FFA0855DFFE0BB81FF000000FFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000000D660A000E800D00129D
      100014B7130017CD160019DF18001BEB1A001EF31C0020F81F0023BC2200259F
      2400288226002BA129002E862D0033A53100378B36003CA93A003F8F3D0042AB
      400043C6410044FA420045F8430047F5440047EE450048E5450048D8450049C7
      450048B34400489D4400478A430080000000000000FFF6CD8EFFF6CD8EFF0000
      01FF000000FF000001FF010102FF000001FF6A583EFFAB8E63FFE8C186FFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000000B6508000D800B000F9D
      0D0011B8100013CE120015E0140017EC16001AF419001CF91B001EAB1D00209D
      1F00227F210025A02400298328002EA32C003288310037A835003B8D39003EAB
      3C0040B83D0041E03F0043F9400044F5410045EF420046E6430046D8440047C8
      440047B44300479E4300478B430080000000000000FFF6CD8EFFF6CD8EFF0000
      01FF000000FF000000FF000000FF000000FF000000FF000001FF030203FF352C
      1FFF766244FFB59769FFEEC78AFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000096307000A7F09000D9C
      0A000EB60D0010CC0F0011DE110013E5120015D6140017BB160019A018001B9B
      1A001D7C1C001F9D1E002380220028A126002D862B0032A63000368B340039A9
      38003BAC39003DBE3B003FD73D0041E63E0042EC3F0043E4400044D7410045C6
      420046B34200469D4200468B420080000000000000FFF6CD8EFFF6CD8EFF0000
      01FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000001FF000001FF080605FF3F3425FF7F6A4AFFC0A06FFFF2CA8CFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000007630500087E07000C9B
      0A000DB50C000ECC0E000FCE0F0011B5110014A8130016921500178716001880
      170016781500189A17001C7C1B00209E1F00258224002BA22A0030872E00338D
      310036963400389F36003BB438003CCE3A003EE43C0040E43D0041D63E0042C5
      3F0043B14000449C40004489410080000000000000FFF6CD8EFFF6CD8EFF0000
      01FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000001FF000001FF0E0B09FF4A3E
      2CFF8B7451FFCCAA76FFF5CC8DFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000000F670D00146C1300157B
      1400178F1600189F1700198D19001B811B001E711E0020772000207720002072
      1F001F761E00187B170017581600187917001C5B1B00227E2100277826002B77
      2A002F7D2D00327F3000348E320037A1350039AE37003BB139003DA83A003E9D
      3B00408F3C0041863D0042883F0080000000000000FFF6CD8EFFF6CD8EFF0000
      01FF000001FF000001FF000001FF000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF000001FF000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF15120DFF554732FF000000FFD5B27BFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000024752300276D26002A72
      29002E812D00318E3000337D330036603600396639003A793A003A783A003977
      3900367536002C662D00255F25001D5A1C0018591800195919001F671E00236A
      2200276C25002A7029002D772C0030852F003399310035983300389135003A88
      37003C7D38003D7C3A003F863B0080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000398237003F833E00458F
      45004C9F4B0051AC510056A056005A985A005D905D005F965F00609760006094
      60005D955D00579857004A754A003787370025602500197919001A721A001B6F
      1A001E751D002278210026892500299E28002CAD2B002FB02E0032A63000359A
      3200378B3400398236003B83380080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000004E904D0056A755005FBD
      5E0067D066006FE06E0076E176007CCF7C0080C5800084BE840087BC860087B9
      87008ABC8A0085CB850078B0780061BB61004392430028A02800177B17001780
      1700188817001B931A001FAD1E0023CB210026E2250029E128002DD22B0030C0
      2D0032AB2F00359432003781340080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFD6B27CFF000000FF564832FF16120EFF000001FF0000
      01FF000001FF000001FF000001FF000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF000001FF000001FF000001FF000001FF000001FF0000
      01FF000001FFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000609B5F006BB16A0076C7
      75007ED77D0087E5860090F08F0096F096009CE89C00A1DCA100A4D7A400AADA
      AA00AACEAA00A5D9A50099C4990083CA830064A564003FAA3F00228222001397
      1300149D140016B1150019CE18001DE11C0021EA1F0024E1230028D126002BBE
      29002DA92B0031922E00337F300080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF5CC8DFFCDAA76FF8C75
      51FF4B3F2CFF0E0C09FF000001FF000001FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000001FFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000006DA36C0078B8780084CD
      83008FDE8E009AEA9900A3F3A300ABF8AB00B3FBB300B7F1B700BBE6BB00BEE3
      BE00BED9BE00BAE2BA00AECFAE0099D499007BB27B0055B55500328B32001A99
      1A0010A9100011D9100014E7140019F417001CEC1B0020E21F0024D1230027BE
      25002BA828002D902B00307D2E0080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF3CB8CFFC1A170FF806B4BFF413626FF080605FF000001FF0000
      01FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000001FFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000078AA770084BE830090D1
      90009BE19B00A6EDA600AFF5AF00B8F9B800BFFCBF00C4FDC400C8EFC800CAE8
      CA00CAE0CA00C6E7C600BAD6BA00A6D9A60089BA890066BC660043934300269F
      260016BD160010FA0F0011F8110015F4140019EC18001DE11C0021D1200024BD
      230028A725002B8F28002E7B2B0080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFEEC78AFFB7996AFF7763
      45FF362D20FF040303FF000001FF000000FF000000FF000000FF000000FF0000
      00FF000001FFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000083B1820090C48F009CD6
      9B00A8E4A700B2EFB200BBF5BB00C3FAC300CAFCCA00CFFDCF00D2F2D200D3EC
      D300D3E5D300CFEBCF00C3DBC300B0DDB00094C0940073C27300529C520036A6
      360020C220000BFA0B000EF70D0011F3110015EA15001ADF19001ECF1C0021BB
      1F0024A42200288C25002B79280080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFE8C286FFAC8F63FF6B593EFF000001FF010102FF000001FF0000
      00FF000001FFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000008EB78D009BC99A00A7D9
      A700B3E6B200BDF0BC00C5F6C500CDFACD00D3FCD300D8FDD800DBFEDB00DBEF
      DB00DAE9DA00D5EDD500CADFCA00B7E0B7009EC59E007FC67F0060A3600045AC
      45002EC42E0017F717000BF40B000EEF0D0012E7120016DB15001ACA19001DB6
      1C00209F1E00248822002876250080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FFE1BB82FFA1865DFF6151
      39FF211B14FFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000099BD9800A6CDA600B2DC
      B200BDE8BD00C7F0C700CFF6CF00D6FAD600DAFBDA00DEFDDE00E1FDE100E1E1
      E100DEEDDE00D9EED900CEE1CE00BDE2BD00A5C9A50088C988006CB36C0053C5
      52003DD03C0027F4270011EF11000BE80A000EE00E0012D3120016C215001AAE
      18001D981B0020831E002572220080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF0D0A07FFD1AE79FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFD1AE79FF0D0A07FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000A5C4A400B1D1B000BDDF
      BD00C7E9C700D0F1D000D7F6D700DDF9DD00E1FBE100E4FCE400E6FDE600E5FD
      E500E2F2E200DCEFDC00D2E3D200C1E2C100AACBAA0090CA900076CB76005FDA
      5F004BE44B0037ED370021E921000DE00D000BD50B000FC80E0012B8110016A4
      1400198E18001D7B1B00216D1E0080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF9A8159FF0D0A07FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0D0A07FF9A8159FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000B0CAAF00BCD5BB00C6E1
      C600D0EAD000D8F1D800DEF6DE00E3F8E300E6FAE600E8FBE800E8FCE800E7FC
      E700E4F3E400DEEEDE00D3E3D300C3E1C300AFCCAE0097CA96007FD47F006AEB
      6A0058E9580045E5450032DF32001DD51D000BC70A000BB90A000EA90D001297
      100015821400197217001D681A0080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000BAD1BA00C5DAC500D0E4
      D000D8ECD800DFF1DF00E4F5E400E7F8E700EAF9EA00EAFAEA00E9FAE900E7FA
      E700E4F2E400DEEDDE00D3E2D300C4DFC400B2CBB1009CC99B0087CF860074E2
      740064DF630053DA530041D340002EC92D0019BA18000AA708000B9809000D87
      0C0010750F00156812001A65170080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000C4D8C400CFDFCF00D8E6
      D800DFEDDF00E5F2E500E8F5E800EBF7EA00ECF8EB00EBF8EB00EAF8EA00E7F8
      E700E4F7E400DCEDDC00D2E1D200C5DCC400B3CEB300A0CE9F008CDD8B007DD8
      7C006FD46E005FCE5F004FC74E003EBB3D002BAC290017991600088407000A76
      08000C670B0010600F001562120080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000CDDECD00D8E4D700DFEA
      DE00E5EEE400E8F2E800EBF4EB00EBF6EB00ECF6EB00EAF6EA00E8F5E800E6F4
      E600E1F3E100DCF0DC00D1E2D000C4DCC300B4D4B400A3D9A20091D2910084CD
      830078C877006BC26A005CB95B004CAE4C003CA03B00298E2800167915000865
      0600095C07000C5C0A00105F0E0080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000D6E3D500DFE9DE00E5ED
      E400E8F0E800EBF2EB00ECF3EC00ECF4EC00EAF3EA00E9F3E800E6F1E500E3F0
      E200DEEEDE00D9EBD900CFE6CF00C3E0C300B6D9B500A6D0A50096C896008BC2
      8A0080BC800075B6740068AE68005BA45B004C974B003D883B002A7629001865
      150007590500085906000C5C0A0080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000DDE8DC00E4EDE300E8F0
      E800EBF2EB00ECF3EC00EBF2EB00EBF2EB00E8F0E800E6EFE500E3EDE200DFEA
      DE00DAE7D900D5E5D500CCDFCC00C1D8C100B5D0B500A8C8A7009AC0990090B9
      8F0088B487007FAE7E0074A67300699D67005C935A004E894C003F7F3D002E73
      2C001A651800085A06000859050080000000000000FFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD8EFFF6CD
      8EFFF6CD8EFFF6CD8EFFF6CD8EFF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E44400080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000800000009E444000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00A3C9
      CC0065C3CB002EBCC90026B9C70000B5C60000ADC00026B2C1002EB2C10065B8
      C300A3C4C800CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D1C9
      A300D7C36500DCBC2E00DBB92600DFB50000DCAD0000D9B22600D8B22E00D2B8
      6500CEC4A300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D1A3
      CC00D765CB00DC2EC900DB26C700DF00C600DC00C000D926C100D82EC100D265
      C300CEA3C800CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C5B4
      A300B98F6500AE6D2E00AC682600A5510000A24D0000AA652600AB692E00B68A
      6500C3B2A300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0089CBCF001DC5D00000C0
      CE0000BDCC0000B8C80000B5C60000B5C60000ADC00000ACBF0000ABBE0000A6
      BB0000A6BA001DA8BB0089BEC500CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D5CB8900E2C51D00E4C0
      0000E3BD0000E1B80000E0B50000DFB50000DCAD0000DCAC0000DBAB0000D9A6
      0000D9A60000D5A81D00D0BE8900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D589CF00E21DD000E400
      CE00E300CC00E100C800E000C600DF00C600DC00C000DC00BF00DB00BE00D900
      BB00D900BA00D51DBB00D089C500CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C1A68900AE681D00A856
      0000A7550000A6520000A5510000A5510000A24D0000A24D0000A14C0000A04B
      0000A04A0000A55B1D00BDA18900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00B4CDCE002ECFD80000CDD80000C9D50000C5
      D30000BFCD0000B9C90000B5C60000B5C60000ADC00000ACBF0000ABBE0000A7
      BB0000A7BB0000A5BA0000A4B9002EACBC00B4C8CA00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00D0CDB400E4CF2E00EACD0000E8C90000E6C5
      0000E4BF0000E1B90000E0B50000DFB50000DCAD0000DCAC0000DBAB0000DAA7
      0000DAA70000D8A50000D8A40000D5AC2E00CEC8B400CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00D0B4CE00E42ED800EA00D800E800D500E600
      D300E400CD00E100C900E000C600DF00C600DC00C000DC00BF00DB00BE00DA00
      BB00DA00BB00D800BA00D800B900D52EBC00CEB4CA00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00C9BFB400B4762E00AC5C0000AB5A0000AA58
      0000A8550000A6530000A5510000A5510000A24D0000A24D0000A14C0000A04B
      0000A04B0000A04A00009F490000A9662E00C7BDB400CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC009AD0D2000EDAE10000D9E10000D2DC0000CCD80000C5
      D30000C0CF0000B9C90000B7C80000B5C60000ADC00000ACBF0000AABD0000A7
      BB0000A5BA0000A7BB0000A6BB0000A6BB000EAABC009AC3C800CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D5D09A00EDDA0E00EFD90000ECD20000E9CC0000E6C5
      0000E4C00000E1B90000E0B70000DFB50000DCAD0000DCAC0000DBAA0000DAA7
      0000D8A50000DAA70000D9A60000D9A60000D9AA0E00CFC39A00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D59AD200ED0EE100EF00E100EC00DC00E900D800E600
      D300E400CF00E100C900E000C800DF00C600DC00C000DC00BF00DB00BD00DA00
      BB00D800BA00DA00BB00D900BB00D900BB00D90EBC00CF9AC800CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00C6B29A00B3690E00B0610000AE5E0000AC5B0000AA58
      0000A8560000A6530000A5520000A5510000A24D0000A24D0000A14C0000A04B
      0000A04A0000A04B0000A04B0000A04B0000A3540E00C1AC9A00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009AD2D30005E1E70000DEE60000DBE30000D4DE0000CFDA0000CC
      D80000CED90000CFDA0000D6DF0000D9E10000D3DD0000CED90000C5D30000B9
      C90000ACBF0000A7BB0000A6BA0000A7BB0000A7BB0005A9BC009AC4C800CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D6D29A00F2E10500F1DE0000F0DB0000EDD40000EBCF0000E9CC
      0000EACE0000EBCF0000EED60000EFD90000ECD30000EACE0000E6C50000E1B9
      0000DCAC0000DAA70000D9A60000DAA70000DAA70000DAA90500D0C49A00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D69AD300F205E700F100E600F000E300ED00DE00EB00DA00E900
      D800EA00D900EB00DA00EE00DF00EF00E100EC00DD00EA00D900E600D300E100
      C900DC00BF00DA00BB00D900BA00DA00BB00DA00BB00DA05BC00D09AC800CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00C6B39A00B4670500B2630000B1620000AF5F0000AD5D0000AC5B
      0000AC5C0000AD5D0000AF600000B0610000AE5E0000AC5C0000AA580000A653
      0000A24D0000A04B0000A04A0000A04B0000A04B0000A24E0500C1AC9A00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00AFD1D10011E5E90000E4EA0000E2E80000DEE60000DCE40000DBE30000E2
      E80000EDF10000F3F60000FBFC0000FEFE0000FBFC0000F6F80000EEF20000E0
      E70000CCD80000B8C80000AABD0000A7BB0000A8BC0000AABD0011ADBE00AFC7
      CA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D2D1AF00F2E51100F4E40000F3E20000F1DE0000F0DC0000F0DB0000F3E2
      0000F7ED0000FAF30000FDFB0000FFFE0000FDFB0000FBF60000F8EE0000F2E0
      0000E9CC0000E1B80000DBAA0000DAA70000DAA80000DBAA0000DAAD1100CEC7
      AF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D2AFD100F211E900F400EA00F300E800F100E600F000E400F000E300F300
      E800F700F100FA00F600FD00FC00FF00FE00FD00FC00FB00F800F800F200F200
      E700E900D800E100C800DB00BD00DA00BB00DA00BC00DB00BD00DA11BE00CEAF
      CA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00C9BEAF00B66F1100B4660000B3650000B2630000B1620000B1620000B365
      0000B66A0000B86D0000BB700000BC720000BB700000B96E0000B76B0000B264
      0000AC5B0000A6520000A14C0000A04B0000A14B0000A14C0000A5571100C6BA
      AF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0030E8EA0000EAEF0000E7EC0000E4EA0000E3E90000E7EC0000EFF30000F8
      FA0000FEFE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FB
      FC0000F0F30000D9E10000BECD0000ADC00000AABD0000AABD0000ABBE002EB2
      C200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00EEE83000F6EA0000F5E70000F4E40000F3E30000F5E70000F8EF0000FCF8
      0000FFFE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FDFB
      0000F9F00000EFD90000E3BE0000DCAD0000DBAA0000DBAA0000DBAB0000D8B2
      2E00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00EE30EA00F600EF00F500EC00F400EA00F300E900F500EC00F800F300FC00
      FA00FF00FE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FD00
      FC00F900F300EF00E100E300CD00DC00C000DB00BD00DB00BD00DB00BE00D82E
      C200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00BC823000B5690000B4670000B4660000B3650000B4670000B76B0000BA6F
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BB70
      0000B76B0000B0610000A8550000A24D0000A14C0000A14C0000A14C0000AB69
      2E00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0089DA
      DB0000F6F80000F2F50000EDF10000E9EE0000EDF10000F5F70000FCFC0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000F5F70000DCE40000C0CE0000ADC00000ACBF0000B0C20000AF
      C10089C2C800CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DCDA
      8900FBF60000FAF20000F8ED0000F6E90000F7ED0000FBF50000FEFC0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FBF50000F0DC0000E4C00000DCAD0000DCAC0000DDB00000DDAF
      0000D1C28900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DC89
      DB00FB00F800FA00F500F800F100F600EE00F700F100FB00F700FE00FC00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FB00F700F000E400E400CE00DC00C000DC00BF00DD00C200DD00
      C100D189C800CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C6AD
      8900B96E0000B86C0000B66A0000B5680000B66A0000B96E0000BB710000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000B96E0000B1620000A8560000A24D0000A24D0000A34F0000A34E
      0000BEA28900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC001FF6
      F60000FBFC0000F8FA0000F6F80000F6F80000F8FA0000FCFC0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000F5F70000DBE30000C0CE0000B2C40000B3C40000B2
      C4001FB4C400CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F6F6
      1F00FDFB0000FCF80000FBF60000FBF60000FCF80000FEFC0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FBF50000F0DB0000E4C00000DEB20000DFB30000DEB2
      0000DAB41F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F61F
      F600FD00FC00FC00FA00FB00F800FB00F800FC00FA00FE00FC00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FB00F700F000E300E400CE00DE00C400DF00C400DE00
      C400DA1FC400CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00BE7F
      1F00BB700000BA6F0000B96E0000B96E0000BA6F0000BB710000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000B96E0000B1620000A8560000A4500000A4500000A450
      0000A9621F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009DD9D9000AFF
      FF0001FFFF0000FDFE0000FCFD0000FEFE0000FDFE0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000F2F50000D4DE0000B9C90000B3C40000B5
      C60000B6C70097C6CA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D9D99D00FFFF
      0A00FFFF0100FEFD0000FEFC0000FFFE0000FEFD0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000F9F20000EDD40000E1B90000DFB30000E0B5
      0000E0B60000D1C69700CCCCCC00CCCCCC00CCCCCC00CCCCCC00D99DD900FF0A
      FF00FF01FF00FE00FE00FE00FD00FF00FE00FE00FE00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00F900F500ED00DE00E100C900DF00C400E000
      C600E000C700D197CA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C9B79D00BF78
      0A00BC730100BB710000BB710000BC720000BB710000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000B86C0000AF5F0000A6530000A4500000A551
      0000A5520000C2AC9700CCCCCC00CCCCCC00CCCCCC00CCCCCC006EE7E7001AFF
      FF0014FFFF000EFFFF000CFFFF0001FFFF0000FEFE0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FBFC0000E5EB0000C8D50000BACA0000BC
      CC0000BDCC0060C4CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00E7E76E00FFFF
      1A00FFFF1400FFFF0E00FFFF0C00FFFF0100FFFE0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FDFB0000F4E50000E7C80000E1BA0000E2BC
      0000E3BD0000D8C46000CCCCCC00CCCCCC00CCCCCC00CCCCCC00E76EE700FF1A
      FF00FF14FF00FF0EFF00FF0CFF00FF01FF00FF00FE00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FD00FC00F400EB00E700D500E100CA00E200
      CC00E300CC00D860CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C7A46E00C380
      1A00C17D1400C07A0E00BF790C00BC730100BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BB700000B4660000AB590000A6530000A754
      0000A7550000B88D6000CCCCCC00CCCCCC00CCCCCC00CCCCCC004DF2F20022FF
      FF0021FFFF001FFFFF0019FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000F2F50000D6DF0000C0CE0000C0
      CE0000C0CF0032C3CE00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F2F24D00FFFF
      2200FFFF2100FFFF1F00FFFF1900FFFF0100FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FAF20000EED60000E4C00000E4C0
      0000E4C00000DEC33200CCCCCC00CCCCCC00CCCCCC00CCCCCC00F24DF200FF22
      FF00FF21FF00FF1FFF00FF19FF00FF01FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FA00F500EE00DF00E400CE00E400
      CE00E400CF00DE32CE00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C7974D00C585
      2200C5842100C4831F00C3801900BC730100BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000B86C0000AF600000A8560000A856
      0000A8560000B1733200CCCCCC00CCCCCC00CCCCCC00CCCCCC003CFBFB002FFF
      FF002FFFFF002EFFFF001EFFFF0000FEFE0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000F9FA0000DEE60000C6D30000C6
      D30000C6D30011C6D200CCCCCC00CCCCCC00CCCCCC00CCCCCC00FBFB3C00FFFF
      2F00FFFF2F00FFFF2E00FFFF1E00FFFE0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FDF90000F1DE0000E7C60000E7C6
      0000E7C60000E5C61100CCCCCC00CCCCCC00CCCCCC00CCCCCC00FB3CFB00FF2F
      FF00FF2FFF00FF2EFF00FF1EFF00FF00FE00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FD00FA00F100E600E700D300E700
      D300E700D300E511D200CCCCCC00CCCCCC00CCCCCC00CCCCCC00C8913C00C88C
      2F00C88C2F00C88B2E00C4831E00BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BA6F0000B2630000AA590000AA59
      0000AA590000AD621100CCCCCC00CCCCCC00CCCCCC00CCCCCC003EFEFE003BFF
      FF003BFFFF003BFFFF0025FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FDFE0000E5EB0000CCD80000CC
      D80000CCD80005CCD800CCCCCC00CCCCCC00CCCCCC00CCCCCC00FEFE3E00FFFF
      3B00FFFF3B00FFFF3B00FFFF2500FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FEFD0000F4E50000E9CC0000E9CC
      0000E9CC0000E8CC0500CCCCCC00CCCCCC00CCCCCC00CCCCCC00FE3EFE00FF3B
      FF00FF3BFF00FF3BFF00FF25FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FE00FE00F400EB00E900D800E900
      D800E900D800E805D800CCCCCC00CCCCCC00CCCCCC00CCCCCC00CC943E00CC93
      3B00CC933B00CC933B00C6862500BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BB710000B4660000AC5B0000AC5B
      0000AC5B0000AD5E0500CCCCCC00CCCCCC00CCCCCC00CCCCCC0047FEFE0044FF
      FF0044FFFF0044FFFF002BFFFF0003FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000E8ED0000D0DB0000D0
      DB0000D0DB0005D0DB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FEFE4700FFFF
      4400FFFF4400FFFF4400FFFF2B00FFFF0300FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F5E80000EBD00000EBD0
      0000EBD00000EAD00500CCCCCC00CCCCCC00CCCCCC00CCCCCC00FE47FE00FF44
      FF00FF44FF00FF44FF00FF2BFF00FF03FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F500ED00EB00DB00EB00
      DB00EB00DB00EA05DB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CE994700CE98
      4400CE984400CE984400C78A2B00BD740300BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000B5680000AD5D0000AD5D
      0000AD5D0000AE600500CCCCCC00CCCCCC00CCCCCC00CCCCCC0059FBFB004FFF
      FF004FFFFF0050FFFF0036FFFF000CFFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0001FFFF0000EAEF0000D6DF0000D6
      DF0000D6DF0011D5DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FBFB5900FFFF
      4F00FFFF4F00FFFF5000FFFF3600FFFF0C00FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0100F6EA0000EED60000EED6
      0000EED60000EBD51100CCCCCC00CCCCCC00CCCCCC00CCCCCC00FB59FB00FF4F
      FF00FF4FFF00FF50FF00FF36FF00FF0CFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF01FF00F600EF00EE00DF00EE00
      DF00EE00DF00EB11DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D1A25900D19E
      4F00D19E4F00D19E5000CA903600BF790C00BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC730100B5690000AF600000AF60
      0000AF600000B1691100CCCCCC00CCCCCC00CCCCCC00CCCCCC0076F2F2005BFF
      FF005CFFFF005DFFFF0044FFFF0018FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FEFE0000EBF00000DDE50000DD
      E50000DCE40032D7DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F2F27600FFFF
      5B00FFFF5C00FFFF5D00FFFF4400FFFF1800FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFE0000F6EB0000F0DD0000F0DD
      0000F0DC0000E7D73200CCCCCC00CCCCCC00CCCCCC00CCCCCC00F276F200FF5B
      FF00FF5CFF00FF5DFF00FF44FF00FF18FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FE00F600F000F000E500F000
      E500F000E400E732DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D2AE7600D4A4
      5B00D4A55C00D4A55D00CE984400C27F1800BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000B6690000B1630000B163
      0000B1620000B87C3200CCCCCC00CCCCCC00CCCCCC00CCCCCC0094E7E70062FF
      FF0065FFFF0069FFFF005AFFFF0030FFFF0008FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0002FFFF0000FCFD0000EDF10000E7EC0000E3
      E90000E0E70060D6DA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00E7E79400FFFF
      6200FFFF6500FFFF6900FFFF5A00FFFF3000FFFF0800FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0200FEFC0000F8ED0000F5E70000F3E3
      0000F2E00000E0D66000CCCCCC00CCCCCC00CCCCCC00CCCCCC00E794E700FF62
      FF00FF65FF00FF69FF00FF5AFF00FF30FF00FF08FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF02FF00FE00FD00F800F100F500EC00F300
      E900F200E700E060DA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D1B99400D6A8
      6200D7AA6500D8AC6900D4A45A00C98D3000BE760800BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BD730200BB710000B66A0000B4670000B365
      0000B2640000BE956000CCCCCC00CCCCCC00CCCCCC00CCCCCC00B5D9D9006EFF
      FF0071FFFF0075FFFF0070FFFF004BFFFF001CFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0003FFFF0000FAFB0000F2F50000EEF20000ED
      F10000E7EC009AD2D400CCCCCC00CCCCCC00CCCCCC00CCCCCC00D9D9B500FFFF
      6E00FFFF7100FFFF7500FFFF7000FFFF4B00FFFF1C00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0300FDFA0000F9F20000F8EE0000F7ED
      0000F5E70000D6D29A00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D9B5D900FF6E
      FF00FF71FF00FF75FF00FF70FF00FF4BFF00FF1CFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF03FF00FD00FB00F900F500F800F200F700
      F100F500EC00D69AD400CCCCCC00CCCCCC00CCCCCC00CCCCCC00CFC5B500D9AF
      6E00DAB07100DBB37500D9B07000D09B4B00C3811C00BC720000BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BC720000BD740300BA700000B86C0000B76B0000B66A
      0000B4670000C6B39A00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0085F7
      F70078FFFF0079FFFF007BFFFF006BFFFF0042FFFF0014FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0005FFFF0005FFFF0000FCFD0000F7F90000F4F70000F2
      F5001FE8EB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F7F7
      8500FFFF7800FFFF7900FFFF7B00FFFF6B00FFFF4200FFFF1400FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0500FFFF0500FEFC0000FBF70000FAF40000F9F2
      0000F1E81F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F785
      F700FF78FF00FF79FF00FF7BFF00FF6BFF00FF42FF00FF14FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF05FF00FF05FF00FE00FD00FB00F900FA00F700F900
      F500F11FEB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DAB8
      8500DCB47800DCB57900DCB67B00D8AD6B00CD964200C17D1400BC720000BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BC720000BD750500BD750500BB710000B96E0000B96D0000B86C
      0000B9791F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B2DD
      DD007EFFFF007FFFFF0084FFFF0084FFFF006DFFFF0041FFFF0014FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0005FFFF000FFFFF0010FFFF000BFFFF0000FEFE0000FAFB0000F6
      F80089D9DA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DDDD
      B200FFFF7E00FFFF7F00FFFF8400FFFF8400FFFF6D00FFFF4100FFFF1400FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0500FFFF0F00FFFF1000FFFF0B00FFFE0000FDFA0000FBF6
      0000DBD98900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DDB2
      DD00FF7EFF00FF7FFF00FF84FF00FF84FF00FF6DFF00FF41FF00FF14FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF05FF00FF0FFF00FF10FF00FF0BFF00FF00FE00FD00FB00FB00
      F800DB89DA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D2C5
      B200DDB87E00DDB87F00DFBB8400DFBB8400D9AE6D00CD964100C17D1400BC72
      0000BC720000BC720000BC720000BC720000BC720000BC720000BC720000BC72
      0000BC720000BD750500C07A0F00C07B1000BF780B00BC720000BA700000B96E
      0000C5AC8900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0095F3F30087FFFF0089FFFF008AFFFF0087FFFF0070FFFF0047FFFF001EFF
      FF0008FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0002FF
      FF000BFFFF001AFFFF001CFFFF0018FFFF0012FFFF000CFFFF0006FFFF0030F0
      F100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00F3F39500FFFF8700FFFF8900FFFF8A00FFFF8700FFFF7000FFFF4700FFFF
      1E00FFFF0800FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0200FFFF0B00FFFF1A00FFFF1C00FFFF1800FFFF1200FFFF0C00FFFF0600F1F0
      3000CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00F395F300FF87FF00FF89FF00FF8AFF00FF87FF00FF70FF00FF47FF00FF1E
      FF00FF08FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF02
      FF00FF0BFF00FF1AFF00FF1CFF00FF18FF00FF12FF00FF0CFF00FF06FF00F130
      F100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00DBBF9500DFBD8700E0BE8900E0BE8A00DFBD8700D9B07000CF994700C483
      1E00BE760800BC720000BC720000BC720000BC720000BC720000BC720000BD73
      0200BF780B00C3801A00C3811C00C27F1800C17C1200BF790C00BE750600BF86
      3000CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00C3D3D3008FFBFB008AFFFF008CFFFF008EFFFF008CFFFF007AFFFF005CFF
      FF003CFFFF0022FFFF0013FFFF0008FFFF0003FFFF0009FFFF0017FFFF0022FF
      FF0030FFFF0031FFFF0026FFFF001FFFFF0018FFFF0012FFFF001CFBFB00B2D3
      D300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D3D3C300FBFB8F00FFFF8A00FFFF8C00FFFF8E00FFFF8C00FFFF7A00FFFF
      5C00FFFF3C00FFFF2200FFFF1300FFFF0800FFFF0300FFFF0900FFFF1700FFFF
      2200FFFF3000FFFF3100FFFF2600FFFF1F00FFFF1800FFFF1200FBFB1C00D3D3
      B200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D3C3D300FB8FFB00FF8AFF00FF8CFF00FF8EFF00FF8CFF00FF7AFF00FF5C
      FF00FF3CFF00FF22FF00FF13FF00FF08FF00FF03FF00FF09FF00FF17FF00FF22
      FF00FF30FF00FF31FF00FF26FF00FF1FFF00FF18FF00FF12FF00FB1CFB00D3B2
      D300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CECAC300DEBF8F00E0BE8A00E1BF8C00E1C18E00E1BF8C00DCB57A00D4A5
      5C00CC933C00C5852200C17D1300BE760800BD740300BE770900C27F1700C585
      2200C98D3000C98D3100C6872600C4831F00C27F1800C17C1200C0801C00CAC0
      B200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00BCD9D9008EFEFE008EFFFF008FFFFF0092FFFF0090FFFF008AFF
      FF0078FFFF0066FFFF0058FFFF0050FFFF0045FFFF0047FFFF0050FFFF004EFF
      FF004AFFFF003EFFFF0031FFFF0025FFFF001FFFFF001CFEFE009ED9D900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D9D9BC00FEFE8E00FFFF8E00FFFF8F00FFFF9200FFFF9000FFFF
      8A00FFFF7800FFFF6600FFFF5800FFFF5000FFFF4500FFFF4700FFFF5000FFFF
      4E00FFFF4A00FFFF3E00FFFF3100FFFF2500FFFF1F00FEFE1C00D9D99E00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D9BCD900FE8EFE00FF8EFF00FF8FFF00FF92FF00FF90FF00FF8A
      FF00FF78FF00FF66FF00FF58FF00FF50FF00FF45FF00FF47FF00FF50FF00FF4E
      FF00FF4AFF00FF3EFF00FF31FF00FF25FF00FF1FFF00FE1CFE00D99ED900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D1C9BC00E1BF8E00E1C18E00E2C18F00E2C39200E2C29000E0BE
      8A00DCB47800D7AA6600D3A35800D19E5000CE984500CF994700D19E5000D09D
      4E00CF9B4A00CC943E00C98D3100C6862500C4831F00C2811C00C9B89E00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00BDD9D90093FBFB0091FFFF0091FFFF0091FFFF0093FF
      FF008FFFFF008AFFFF0086FFFF0083FFFF0074FFFF006FFFFF006AFFFF005CFF
      FF0052FFFF0045FFFF0039FFFF002AFFFF0031FBFB00A1D9D900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D9D9BD00FBFB9300FFFF9100FFFF9100FFFF9100FFFF
      9300FFFF8F00FFFF8A00FFFF8600FFFF8300FFFF7400FFFF6F00FFFF6A00FFFF
      5C00FFFF5200FFFF4500FFFF3900FFFF2A00FBFB3100D9D9A100CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D9BDD900FB93FB00FF91FF00FF91FF00FF91FF00FF93
      FF00FF8FFF00FF8AFF00FF86FF00FF83FF00FF74FF00FF6FFF00FF6AFF00FF5C
      FF00FF52FF00FF45FF00FF39FF00FF2AFF00FB31FB00D9A1D900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D1C9BD00E0C29300E2C29100E2C29100E2C29100E3C3
      9300E2C18F00E0BE8A00DFBC8600DEBA8300DAB27400D9AF6F00D8AD6A00D4A5
      5C00D29F5200CE984500CB923900C7892A00C68B3100CABAA100CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00C5D2D200A2F4F40095FFFF0093FFFF008FFF
      FF008FFFFF0088FFFF0085FFFF0083FFFF0074FFFF0071FFFF006BFFFF005EFF
      FF0054FFFF004CFFFF0041FFFF0059F4F400BAD2D200CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00D2D2C500F4F4A200FFFF9500FFFF9300FFFF
      8F00FFFF8F00FFFF8800FFFF8500FFFF8300FFFF7400FFFF7100FFFF6B00FFFF
      5E00FFFF5400FFFF4C00FFFF4100F4F45900D2D2BA00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00D2C5D200F4A2F400FF95FF00FF93FF00FF8F
      FF00FF8FFF00FF88FF00FF85FF00FF83FF00FF74FF00FF71FF00FF6BFF00FF5E
      FF00FF54FF00FF4CFF00FF41FF00F459F400D2BAD200CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CFCBC500DEC7A200E3C49500E3C39300E2C1
      8F00E2C18F00E0BD8800DFBC8500DEBA8300DAB27400DAB07100D8AD6B00D5A6
      5E00D2A05400D09C4C00CD964100CB9E5900CCC4BA00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00BBDCDC009EF7F70091FF
      FF0090FFFF0087FFFF0085FFFF0083FFFF0074FFFF0071FFFF006CFFFF0061FF
      FF005CFFFF0066F7F700A1DDDD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DCDCBB00F7F79E00FFFF
      9100FFFF9000FFFF8700FFFF8500FFFF8300FFFF7400FFFF7100FFFF6C00FFFF
      6100FFFF5C00F7F76600DDDDA100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DCBBDC00F79EF700FF91
      FF00FF90FF00FF87FF00FF85FF00FF83FF00FF74FF00FF71FF00FF6CFF00FF61
      FF00FF5CFF00F766F700DDA1DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D4CABB00DFC69E00E2C2
      9100E2C29000DFBD8700DFBC8500DEBA8300DAB27400DAB07100D8AE6C00D5A8
      6100D4A55C00D1A76600CDBCA100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C2D5
      D500AFE5E50098F3F30093F5F50084FEFE0075FEFE0085F5F50085F3F30098E5
      E500B9D5D500CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D5D5
      C200E5E5AF00F3F39800F5F59300FEFE8400FEFE7500F5F58500F3F38500E5E5
      9800D5D5B900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D5C2
      D500E5AFE500F398F300F593F500FE84FE00FE75FE00F585F500F385F300E598
      E500D5B9D500CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D0CB
      C200D7C8AF00DBC19800DBBF9300DEBA8400DAB27500D7B78500D6B68500D1BA
      9800CEC5B900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C9C3
      C600C5B5BB00C0A5B000BFA2AE00BC98A700B992A200BD9CA900BD9DAA00C1AB
      B400C8BFC200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00A3A3
      CC006565CB002E2EC9002626C7000000C6000000C0002626C1002E2EC1006565
      C300A3A3C800CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00A3C9
      A30065C365002EBC2E0026B9260000B5000000AD000026B226002EB22E0065B8
      6500A3C4A300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D1A3
      A300D7656500DC2E2E00DB262600DF000000DC000000D9262600D82E2E00D265
      6500CEA3A300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C9C0C400C3ABB500C0A1
      AE00BF9FAC00BD9BA900BC99A700BC98A700B992A200B991A100B990A000B78C
      9E00B78B9D00B892A200C4B5BC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC008989CF001D1DD0000000
      CE000000CC000000C8000000C6000000C6000000C0000000BF000000BE000000
      BB000000BA001D1DBB008989C500CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0089CB89001DC51D0000C0
      000000BD000000B8000000B5000000B5000000AD000000AC000000AB000000A6
      000000A600001DA81D0089BE8900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D5898900E21D1D00E400
      0000E3000000E1000000E0000000DF000000DC000000DC000000DB000000D900
      0000D9000000D51D1D00D0898900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCC9CA00C7B5BD00C5ADB700C3A9B400C2A6
      B200C0A1AD00BE9CAA00BC99A700BC98A700B992A200B991A100B990A000B78D
      9E00B78D9E00B68B9D00B68A9C00BB98A600CAC4C600CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00B4B4CE002E2ED8000000D8000000D5000000
      D3000000CD000000C9000000C6000000C6000000C0000000BF000000BE000000
      BB000000BB000000BA000000B9002E2EBC00B4B4CA00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00B4CDB4002ECF2E0000CD000000C9000000C5
      000000BF000000B9000000B5000000B5000000AD000000AC000000AB000000A7
      000000A7000000A5000000A400002EAC2E00B4C8B400CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00D0B4B400E42E2E00EA000000E8000000E600
      0000E4000000E1000000E0000000DF000000DC000000DC000000DB000000DA00
      0000DA000000D8000000D8000000D52E2E00CEB4B400CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCC8CA00CABAC100C9B7BE00C7B1BA00C5ACB600C2A6
      B200C0A2AE00BE9CAA00BD9AA800BC98A700B992A200B991A100B88FA000B78D
      9E00B68B9D00B78D9E00B78C9E00B78C9E00B891A100C7BCC100CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC009A9AD2000E0EE1000000E1000000DC000000D8000000
      D3000000CF000000C9000000C8000000C6000000C0000000BF000000BD000000
      BB000000BA000000BB000000BB000000BB000E0EBC009A9AC800CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC009AD09A000EDA0E0000D9000000D2000000CC000000C5
      000000C0000000B9000000B7000000B5000000AD000000AC000000AA000000A7
      000000A5000000A7000000A6000000A600000EAA0E009AC39A00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D59A9A00ED0E0E00EF000000EC000000E9000000E600
      0000E4000000E1000000E0000000DF000000DC000000DC000000DB000000DA00
      0000D8000000DA000000D9000000D9000000D90E0E00CF9A9A00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCC9CB00CCBEC400CBBBC200CAB9C000C8B3BB00C6AFB800C5AC
      B600C5ADB700C6AFB800C8B4BC00C9B7BE00C7B2BA00C5ADB700C2A6B200BE9C
      AA00B991A100B78D9E00B78B9D00B78D9E00B78D9E00B88FA000C7BDC100CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009A9AD3000505E7000000E6000000E3000000DE000000DA000000
      D8000000D9000000DA000000DF000000E1000000DD000000D9000000D3000000
      C9000000BF000000BB000000BA000000BB000000BB000505BC009A9AC800CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009AD29A0005E1050000DE000000DB000000D4000000CF000000CC
      000000CE000000CF000000D6000000D9000000D3000000CE000000C5000000B9
      000000AC000000A7000000A6000000A7000000A7000005A905009AC49A00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D69A9A00F2050500F1000000F0000000ED000000EB000000E900
      0000EA000000EB000000EE000000EF000000EC000000EA000000E6000000E100
      0000DC000000DA000000D9000000DA000000DA000000DA050500D09A9A00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CDCBCC00CEC4C700CDC0C600CCBEC400CBBBC200CAB9C000CAB9C000CCBE
      C400D0C7CB00D3CDCF00D5D3D400D7D6D600D5D3D400D4CFD100D1C9CC00CCBD
      C300C5ACB600BD9BA900B88FA000B78D9E00B88E9F00B88FA000BA94A400C9C4
      C600CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00AFAFD1001111E9000000EA000000E8000000E6000000E4000000E3000000
      E8000000F1000000F6000000FC000000FE000000FC000000F8000000F2000000
      E7000000D8000000C8000000BD000000BB000000BC000000BD001111BE00AFAF
      CA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00AFD1AF0011E5110000E4000000E2000000DE000000DC000000DB000000E2
      000000ED000000F3000000FB000000FE000000FB000000F6000000EE000000E0
      000000CC000000B8000000AA000000A7000000A8000000AA000011AD1100AFC7
      AF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D2AFAF00F2111100F4000000F3000000F1000000F0000000F0000000F300
      0000F7000000FA000000FD000000FF000000FD000000FB000000F8000000F200
      0000E9000000E1000000DB000000DA000000DA000000DB000000DA111100CEAF
      AF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D1CACD00CFC5C900CEC3C700CDC0C600CDBFC500CEC3C700D1CACD00D5D1
      D300D7D6D600D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D5D3
      D400D2CACD00C9B7BE00BFA0AD00B992A200B88FA000B88FA000B990A000BD9D
      AB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC003030EA000000EF000000EC000000EA000000E9000000EC000000F3000000
      FA000000FE000000FF000000FF000000FF000000FF000000FF000000FF000000
      FC000000F3000000E1000000CD000000C0000000BD000000BD000000BE002E2E
      C200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0030E8300000EA000000E7000000E4000000E3000000E7000000EF000000F8
      000000FE000000FF000000FF000000FF000000FF000000FF000000FF000000FB
      000000F0000000D9000000BE000000AD000000AA000000AA000000AB00002EB2
      2E00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00EE303000F6000000F5000000F4000000F3000000F5000000F8000000FC00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FD00
      0000F9000000EF000000E3000000DC000000DB000000DB000000DB000000D82E
      2E00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CFCE
      CE00D4CFD100D2CCCF00D1C8CC00CFC5C900D0C7CB00D3CFD100D6D4D500D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D3CFD100CAB9C000C0A1AE00B992A200B991A100BA94A400BA93
      A300C6B9BE00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC008989
      DB000000F8000000F5000000F1000000EE000000F1000000F7000000FC000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000F7000000E4000000CE000000C0000000BF000000C2000000
      C1008989C800CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0089DA
      890000F6000000F2000000ED000000E9000000ED000000F5000000FC000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000F5000000DC000000C0000000AD000000AC000000B0000000AF
      000089C28900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DC89
      8900FB000000FA000000F8000000F6000000F7000000FB000000FE000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FB000000F0000000E4000000DC000000DC000000DD000000DD00
      0000D1898900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D4D4
      D400D5D3D400D5D1D300D4CFD100D4CFD100D5D1D300D6D4D500D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D3CFD100CAB9C000C0A1AE00BB96A500BC97A600BB96
      A500BE9DAA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC001F1F
      F6000000FC000000FA000000F8000000F8000000FA000000FC000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000F7000000E3000000CE000000C4000000C4000000
      C4001F1FC400CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC001FF6
      1F0000FB000000F8000000F6000000F6000000F8000000FC000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000F5000000DB000000C0000000B2000000B3000000B2
      00001FB41F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F61F
      1F00FD000000FC000000FB000000FB000000FC000000FE000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FB000000F0000000E4000000DE000000DF000000DE00
      0000DA1F1F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CFCFCF00D9D9
      D900D7D7D700D6D6D600D6D5D500D7D6D600D6D6D600D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D2CCCE00C8B3BB00BE9CAA00BC97A600BC99
      A700BD9AA800C8BFC200CCCCCC00CCCCCC00CCCCCC00CCCCCC009D9DD9000A0A
      FF000101FF000000FE000000FD000000FE000000FE000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000F5000000DE000000C9000000C4000000
      C6000000C7009797CA00CCCCCC00CCCCCC00CCCCCC00CCCCCC009DD99D000AFF
      0A0001FF010000FD000000FC000000FE000000FD000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000F2000000D4000000B9000000B3000000B5
      000000B6000097C69700CCCCCC00CCCCCC00CCCCCC00CCCCCC00D99D9D00FF0A
      0A00FF010100FE000000FE000000FF000000FE000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000F9000000ED000000E1000000DF000000E000
      0000E0000000D1979700CCCCCC00CCCCCC00CCCCCC00CCCCCC00D4D4D400DBDB
      DB00DADADA00D9D9D900D9D9D900D7D7D700D7D6D600D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D5D3D400CEC1C600C3A8B300BE9CAA00BF9F
      AC00BF9FAC00C5B4BB00CCCCCC00CCCCCC00CCCCCC00CCCCCC006E6EE7001A1A
      FF001414FF000E0EFF000C0CFF000101FF000000FE000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FC000000EB000000D5000000CA000000
      CC000000CC006060CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC006EE76E001AFF
      1A0014FF14000EFF0E000CFF0C0001FF010000FE000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FB000000E5000000C8000000BA000000BC
      000000BD000060C46000CCCCCC00CCCCCC00CCCCCC00CCCCCC00E76E6E00FF1A
      1A00FF141400FF0E0E00FF0C0C00FF010100FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FD000000F4000000E7000000E1000000E200
      0000E3000000D8606000CCCCCC00CCCCCC00CCCCCC00CCCCCC00D8D8D800DCDC
      DC00DCDCDC00DCDCDC00DBDBDB00D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D2CCCF00C8B4BC00C0A1AE00C0A1
      AE00C0A2AE00C3ACB500CCCCCC00CCCCCC00CCCCCC00CCCCCC004D4DF2002222
      FF002121FF001F1FFF001919FF000101FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000F5000000DF000000CE000000
      CE000000CF003232CE00CCCCCC00CCCCCC00CCCCCC00CCCCCC004DF24D0022FF
      220021FF21001FFF1F0019FF190001FF010000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000F2000000D6000000C0000000C0
      000000C0000032C33200CCCCCC00CCCCCC00CCCCCC00CCCCCC00F24D4D00FF22
      2200FF212100FF1F1F00FF191900FF010100FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FA000000EE000000E4000000E400
      0000E4000000DE323200CCCCCC00CCCCCC00CCCCCC00CCCCCC00DDDDDD00DEDE
      DE00DEDEDE00DEDEDE00DCDCDC00D7D6D600D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D5D2D300CBBBC200C2A7B200C2A7
      B200C2A7B200C3AAB400CCCCCC00CCCCCC00CCCCCC00CCCCCC003C3CFB002F2F
      FF002F2FFF002E2EFF001E1EFF000000FE000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FA000000E6000000D3000000
      D3000000D3001111D200CCCCCC00CCCCCC00CCCCCC00CCCCCC003CFB3C002FFF
      2F002FFF2F002EFF2E001EFF1E0000FE000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000F9000000DE000000C6000000C6
      000000C6000011C61100CCCCCC00CCCCCC00CCCCCC00CCCCCC00FB3C3C00FF2F
      2F00FF2F2F00FF2E2E00FF1E1E00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FD000000F1000000E7000000E700
      0000E7000000E5111100CCCCCC00CCCCCC00CCCCCC00CCCCCC00E0E0E000E0E0
      E000E0E0E000E0E0E000DDDDDD00D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D6D6D600CEC1C600C5ACB600C5AC
      B600C5ACB600C5ADB700CCCCCC00CCCCCC00CCCCCC00CCCCCC003E3EFE003B3B
      FF003B3BFF003B3BFF002525FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FE000000EB000000D8000000
      D8000000D8000505D800CCCCCC00CCCCCC00CCCCCC00CCCCCC003EFE3E003BFF
      3B003BFF3B003BFF3B0025FF250000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FD000000E5000000CC000000CC
      000000CC000005CC0500CCCCCC00CCCCCC00CCCCCC00CCCCCC00FE3E3E00FF3B
      3B00FF3B3B00FF3B3B00FF252500FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FE000000F4000000E9000000E900
      0000E9000000E8050500CCCCCC00CCCCCC00CCCCCC00CCCCCC00E1E1E100E2E2
      E200E2E2E200E2E2E200DEDEDE00D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700CFC3C800C6AFB900C6AF
      B900C6AFB900C6B0B900CCCCCC00CCCCCC00CCCCCC00CCCCCC004747FE004444
      FF004444FF004444FF002B2BFF000303FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000ED000000DB000000
      DB000000DB000505DB00CCCCCC00CCCCCC00CCCCCC00CCCCCC0047FE470044FF
      440044FF440044FF44002BFF2B0003FF030000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000E8000000D0000000D0
      000000D0000005D00500CCCCCC00CCCCCC00CCCCCC00CCCCCC00FE474700FF44
      4400FF444400FF444400FF2B2B00FF030300FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000F5000000EB000000EB00
      0000EB000000EA050500CCCCCC00CCCCCC00CCCCCC00CCCCCC00E1E1E100E3E3
      E300E3E3E300E4E4E400DFDFDF00D9D9D900D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700CFC5C900C8B4BC00C8B4
      BC00C8B4BC00C8B6BD00CCCCCC00CCCCCC00CCCCCC00CCCCCC005959FB004F4F
      FF004F4FFF005050FF003636FF000C0CFF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000101FF000000EF000000DF000000
      DF000000DF001111DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC0059FB59004FFF
      4F004FFF4F0050FF500036FF36000CFF0C0000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000001FF010000EA000000D6000000D6
      000000D6000011D51100CCCCCC00CCCCCC00CCCCCC00CCCCCC00FB595900FF4F
      4F00FF4F4F00FF505000FF363600FF0C0C00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF010100F6000000EE000000EE00
      0000EE000000EB111100CCCCCC00CCCCCC00CCCCCC00CCCCCC00DFDFDF00E5E5
      E500E5E5E500E6E6E600E2E2E200DBDBDB00D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D6D600D0C6CA00CBBAC100CBBA
      C100CAB9C000CABEC300CCCCCC00CCCCCC00CCCCCC00CCCCCC007676F2005B5B
      FF005C5CFF005D5DFF004444FF001818FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FE000000F0000000E5000000
      E5000000E4003232DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC0076F276005BFF
      5B005CFF5C005DFF5D0044FF440018FF180000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FE000000EB000000DD000000DD
      000000DC000032D73200CCCCCC00CCCCCC00CCCCCC00CCCCCC00F2767600FF5B
      5B00FF5C5C00FF5D5D00FF444400FF181800FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000F6000000F0000000F000
      0000F0000000E7323200CCCCCC00CCCCCC00CCCCCC00CCCCCC00DADADA00E6E6
      E600E7E7E700E7E7E700E5E5E500DFDFDF00D8D8D800D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D6D5D500D1C8CC00CEC3C700CDBF
      C500CCBDC300CCC4C700CCCCCC00CCCCCC00CCCCCC00CCCCCC009494E7006262
      FF006565FF006969FF005A5AFF003030FF000808FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000202FF000000FD000000F1000000EC000000
      E9000000E7006060DA00CCCCCC00CCCCCC00CCCCCC00CCCCCC0094E7940062FF
      620065FF650069FF69005AFF5A0030FF300008FF080000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000002FF020000FC000000ED000000E7000000E3
      000000E0000060D66000CCCCCC00CCCCCC00CCCCCC00CCCCCC00E7949400FF62
      6200FF656500FF696900FF5A5A00FF303000FF080800FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF020200FE000000F8000000F5000000F300
      0000F2000000E0606000CCCCCC00CCCCCC00CCCCCC00CCCCCC00D3D3D300E8E8
      E800E9E9E900E9E9E900E9E9E900E3E3E300DBDBDB00D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D5D3D400D2CCCE00D1C9CC00D0C7
      CB00CEC3C700CCC9CB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B5B5D9006E6E
      FF007171FF007575FF007070FF004B4BFF001C1CFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000303FF000000FB000000F5000000F2000000
      F1000000EC009A9AD400CCCCCC00CCCCCC00CCCCCC00CCCCCC00B5D9B5006EFF
      6E0071FF710075FF750070FF70004BFF4B001CFF1C0000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000003FF030000FA000000F2000000EE000000ED
      000000E700009AD29A00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D9B5B500FF6E
      6E00FF717100FF757500FF707000FF4B4B00FF1C1C00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF030300FD000000F9000000F8000000F700
      0000F5000000D69A9A00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00E5E5
      E500EAEAEA00EAEAEA00EAEAEA00E8E8E800E1E1E100DADADA00D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D8D8D800D8D8D800D6D5D500D4D0D200D3CED000D2CC
      CE00D0C9CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC008585
      F7007878FF007979FF007B7BFF006B6BFF004242FF001414FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000505FF000505FF000000FD000000F9000000F7000000
      F5001F1FEB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0085F7
      850078FF780079FF79007BFF7B006BFF6B0042FF420014FF140000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000005FF050005FF050000FC000000F7000000F4000000F2
      00001FE81F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00F785
      8500FF787800FF797900FF7B7B00FF6B6B00FF424200FF141400FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF050500FF050500FE000000FB000000FA000000F900
      0000F11F1F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D6D6
      D600EBEBEB00EBEBEB00ECECEC00ECECEC00E8E8E800E1E1E100DADADA00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D8D8D800D9D9D900DADADA00D9D9D900D7D6D600D5D3D400D4CF
      D100CECCCD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B2B2
      DD007E7EFF007F7FFF008484FF008484FF006D6DFF004141FF001414FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000505FF000F0FFF001010FF000B0BFF000000FE000000FB000000
      F8008989DA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B2DD
      B2007EFF7E007FFF7F0084FF840084FF84006DFF6D0041FF410014FF140000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000005FF05000FFF0F0010FF10000BFF0B0000FE000000FA000000F6
      000089D98900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DDB2
      B200FF7E7E00FF7F7F00FF848400FF848400FF6D6D00FF414100FF141400FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF050500FF0F0F00FF101000FF0B0B00FF000000FD000000FB00
      0000DB898900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00E4E4E400ECECEC00ECECEC00EDEDED00ECECEC00E9E9E900E2E2E200DCDC
      DC00D8D8D800D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D9D9D900DBDBDB00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8D800D3D1
      D200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC009595F3008787FF008989FF008A8AFF008787FF007070FF004747FF001E1E
      FF000808FF000000FF000000FF000000FF000000FF000000FF000000FF000202
      FF000B0BFF001A1AFF001C1CFF001818FF001212FF000C0CFF000606FF003030
      F100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0095F3950087FF870089FF89008AFF8A0087FF870070FF700047FF47001EFF
      1E0008FF080000FF000000FF000000FF000000FF000000FF000000FF000002FF
      02000BFF0B001AFF1A001CFF1C0018FF180012FF12000CFF0C0006FF060030F0
      3000CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00F3959500FF878700FF898900FF8A8A00FF878700FF707000FF474700FF1E
      1E00FF080800FF000000FF000000FF000000FF000000FF000000FF000000FF02
      0200FF0B0B00FF1A1A00FF1C1C00FF181800FF121200FF0C0C00FF060600F130
      3000CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D0D0D000E9E9E900EDEDED00EDEDED00EDEDED00EDEDED00EAEAEA00E5E5
      E500E0E0E000DCDCDC00DADADA00D8D8D800D7D7D700D8D8D800DBDBDB00DCDC
      DC00DFDFDF00DFDFDF00DDDDDD00DCDCDC00DBDBDB00DADADA00D8D8D800CDCD
      CD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00C3C3D3008F8FFB008A8AFF008C8CFF008E8EFF008C8CFF007A7AFF005C5C
      FF003C3CFF002222FF001313FF000808FF000303FF000909FF001717FF002222
      FF003030FF003131FF002626FF001F1FFF001818FF001212FF001C1CFB00B2B2
      D300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00C3D3C3008FFB8F008AFF8A008CFF8C008EFF8E008CFF8C007AFF7A005CFF
      5C003CFF3C0022FF220013FF130008FF080003FF030009FF090017FF170022FF
      220030FF300031FF310026FF26001FFF1F0018FF180012FF12001CFB1C00B2D3
      B200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00D3C3C300FB8F8F00FF8A8A00FF8C8C00FF8E8E00FF8C8C00FF7A7A00FF5C
      5C00FF3C3C00FF222200FF131300FF080800FF030300FF090900FF171700FF22
      2200FF303000FF313100FF262600FF1F1F00FF181800FF121200FB1C1C00D3B2
      B200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D4D4D400ECECEC00EDEDED00EDEDED00EEEEEE00EEEEEE00EDED
      ED00EAEAEA00E7E7E700E5E5E500E4E4E400E2E2E200E2E2E200E4E4E400E3E3
      E300E3E3E300E1E1E100DFDFDF00DDDDDD00DCDCDC00DBDBDB00CFCFCF00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00BCBCD9008E8EFE008E8EFF008F8FFF009292FF009090FF008A8A
      FF007878FF006666FF005858FF005050FF004545FF004747FF005050FF004E4E
      FF004A4AFF003E3EFF003131FF002525FF001F1FFF001C1CFE009E9ED900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00BCD9BC008EFE8E008EFF8E008FFF8F0092FF920090FF90008AFF
      8A0078FF780066FF660058FF580050FF500045FF450047FF470050FF50004EFF
      4E004AFF4A003EFF3E0031FF310025FF25001FFF1F001CFE1C009ED99E00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00D9BCBC00FE8E8E00FF8E8E00FF8F8F00FF929200FF909000FF8A
      8A00FF787800FF666600FF585800FF505000FF454500FF474700FF505000FF4E
      4E00FF4A4A00FF3E3E00FF313100FF252500FF1F1F00FE1C1C00D99E9E00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D4D4D400EBEBEB00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EDEDED00EDEDED00ECECEC00ECECEC00E9E9E900E8E8E800E8E8E800E5E5
      E500E4E4E400E2E2E200E0E0E000DEDEDE00DCDCDC00D0D0D000CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00BDBDD9009393FB009191FF009191FF009191FF009393
      FF008F8FFF008A8AFF008686FF008383FF007474FF006F6FFF006A6AFF005C5C
      FF005252FF004545FF003939FF002A2AFF003131FB00A1A1D900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00BDD9BD0093FB930091FF910091FF910091FF910093FF
      93008FFF8F008AFF8A0086FF860083FF830074FF74006FFF6F006AFF6A005CFF
      5C0052FF520045FF450039FF39002AFF2A0031FB3100A1D9A100CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00D9BDBD00FB939300FF919100FF919100FF919100FF93
      9300FF8F8F00FF8A8A00FF868600FF838300FF747400FF6F6F00FF6A6A00FF5C
      5C00FF525200FF454500FF393900FF2A2A00FB313100D9A1A100CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00D0D0D000E7E7E700EEEEEE00EEEEEE00EDED
      ED00EDEDED00ECECEC00ECECEC00ECECEC00E9E9E900E9E9E900E8E8E800E6E6
      E600E4E4E400E3E3E300E1E1E100DCDCDC00CECECE00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00C5C5D200A2A2F4009595FF009393FF008F8F
      FF008F8FFF008888FF008585FF008383FF007474FF007171FF006B6BFF005E5E
      FF005454FF004C4CFF004141FF005959F400BABAD200CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00C5D2C500A2F4A20095FF950093FF93008FFF
      8F008FFF8F0088FF880085FF850083FF830074FF740071FF71006BFF6B005EFF
      5E0054FF54004CFF4C0041FF410059F45900BAD2BA00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00D2C5C500F4A2A200FF959500FF939300FF8F
      8F00FF8F8F00FF888800FF858500FF838300FF747400FF717100FF6B6B00FF5E
      5E00FF545400FF4C4C00FF414100F4595900D2BABA00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D7D7D700EAEAEA00EEEE
      EE00EEEEEE00ECECEC00ECECEC00ECECEC00E9E9E900E9E9E900E8E8E800E6E6
      E600E5E5E500E0E0E000D3D3D300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00BBBBDC009E9EF7009191
      FF009090FF008787FF008585FF008383FF007474FF007171FF006C6CFF006161
      FF005C5CFF006666F700A1A1DD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00BBDCBB009EF79E0091FF
      910090FF900087FF870085FF850083FF830074FF740071FF71006CFF6C0061FF
      61005CFF5C0066F76600A1DDA100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00DCBBBB00F79E9E00FF91
      9100FF909000FF878700FF858500FF838300FF747400FF717100FF6C6C00FF61
      6100FF5C5C00F7666600DDA1A100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D2D2
      D200DDDDDD00E4E4E400E6E6E600ECECEC00E9E9E900E3E3E300E1E1E100D9D9
      D900D1D1D100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C2C2
      D500AFAFE5009898F3009393F5008484FE007575FE008585F5008585F3009898
      E500B9B9D500CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00C2D5
      C200AFE5AF0098F3980093F5930084FE840075FE750085F5850085F3850098E5
      9800B9D5B900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D5C2
      C200E5AFAF00F3989800F5939300FE848400FE757500F5858500F3858500E598
      9800D5B9B900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      000000000000}
  end
  object TmHideExit: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TmHideExitTimer
    Left = 46
    Top = 269
  end
  object TmUpdate: TTimer
    Interval = 50
    OnTimer = TmUpdateTimer
    Left = 70
    Top = 109
  end
  object TmRun: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TmRunTimer
    Left = 72
    Top = 144
  end
  object Server1: TServerSocket
    Active = False
    Port = 502
    ServerType = stNonBlocking
    OnAccept = Server1Accept
    OnClientDisconnect = Server1ClientDisconnect
    OnClientRead = Server1ClientRead
    OnClientError = Server1ClientError
    Left = 120
    Top = 11
  end
  object TmStart: TTimer
    OnTimer = TmStartTimer
    Left = 8
    Top = 272
  end
  object TmSave: TTimer
    Interval = 5000
    OnTimer = TmSaveTimer
    Left = 128
    Top = 112
  end
  object Server2: TServerSocket
    Active = False
    Port = 503
    ServerType = stNonBlocking
    OnAccept = Server2Accept
    OnClientDisconnect = Server2ClientDisconnect
    OnClientRead = Server2ClientRead
    OnClientError = Server2ClientError
    Left = 120
    Top = 43
  end
  object GPRSServer: TServerSocket
    Active = False
    Port = 500
    ServerType = stNonBlocking
    OnAccept = GPRSServerAccept
    OnClientDisconnect = GPRSServerClientDisconnect
    OnClientError = GPRSServerClientError
    Left = 120
    Top = 75
  end
  object ImageList: TImageList
    Height = 20
    Width = 20
    Left = 71
    Top = 368
    Bitmap = {
      494C010124002700040014001400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000050000000C8000000010020000000000000FA
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
      00000000000000000000A2C39FFFECF3EBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009EC19DFF5392
      4FFF327D2EFF327D2EFF327D2EFFE5EFE5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF327D2EFF327D2EFF327D
      2EFF327D2EFF327D2EFF327D2EFF4CA948FF50AF4CFF50AF4CFF50AF4CFF50AF
      4CFF50AF4CFF7FC47BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000402000000000
      0000000000000000000000000000F0FBFF000040800040000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040A0E00040000000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF327D2EFF327D2EFF327D
      2EFF327D2EFF327D2EFF327D2EFF4CA948FF50AF4CFF50AF4CFF50AF4CFF50AF
      4CFF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0FBFF0000204000C080
      400000000000000000000000000080C0E00000000000F0CAA600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040A0E00040000000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF327D2EFF327D2EFF327D
      2EFF327D2EFF327D2EFF327D2EFFE5EFE5FF7CC379FFC5E5C4FFFFFFFFFFFFFF
      FFFF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004080E0004000
      0000F0CAA600000000000000000000206000C060200000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040A0E00040000000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFFFDFEFDFFFFFFFFFF327D2EFF327D
      2EFFFFFFFFFF7AAA77FF327D2EFFBFDEBFFF71BE6EFFA8D7A6FFD4EBD3FFD4EB
      D3FF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000FFFF0000FFFFFF0000000000000000000000000000000000FFFF0000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0FBFF000040
      6000C06000000000000040A0E00000000000F0CAA60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040A0E00040000000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFFFFFFFFFF5D995AFFF7FA
      F7FF9BBF99FF327D2EFF327D2EFFE5EFE5FF7CC379FFC5E5C4FFFFFFFFFFFFFF
      FFFF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000080C0
      E00000000000C0DCC00000204000C08020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040A0E00040000000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF41873EFFFDFEFDFFFFFF
      FFFF327D2EFF327D2EFF327D2EFFDFECDFFF7AC277FFC0E2BEFFF8FCF8FFF8FC
      F8FF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004080C0000000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000060C00000000000C0A0
      4000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF3B8337FFFFFFFFFFFFFF
      FFFF327D2EFF327D2EFF327D2EFFDFECDFFF7AC277FFC0E2BEFFF8FCF8FFF8FC
      F8FF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080C0E00000000000C0A04000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080C0E00000000000000000004000
      0000F0CAA6000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFFF6F9F6FF9BC099FFF3F7
      F3FF83B081FF327D2EFF327D2EFFE5EFE5FF7CC379FFC5E5C4FFFFFFFFFFFFFF
      FFFF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0FB
      FF000020600080A0600000000000F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0FBFF000000800080400000F0FBFF000040
      A000804000000000000000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFFD5E4D4FFFFFFFFFF327D2EFF327D
      2EFFFFFFFFFF5B9758FF327D2EFFBFDEBFFF71BE6EFFA8D7A6FFD4EBD3FFD4EB
      D3FF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004080
      C00040000000000000000060E000802000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000060C00000000000C0C060000000000080E0
      E00000204000C0A0400000000000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF327D2EFF327D2EFF327D
      2EFF327D2EFF327D2EFF327D2EFFE5EFE5FF7CC379FFC5E5C4FFFFFFFFFFFFFF
      FFFF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080E0E0000020
      4000C0A0400000000000F0FBFF0000204000C0A0400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080C0E00000000000C060000000000000000000000000
      00000060C00040000000F0CAA600000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF327D2EFF327D2EFF327D
      2EFF327D2EFF327D2EFF327D2EFF4CA948FF50AF4CFF50AF4CFF50AF4CFF50AF
      4CFF50AF4CFF7BC378FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000060C0004020
      00000000000000000000000000004080C0004020000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0FBFF000000800080000000F0CAA60000000000000000000000
      0000F0FBFF000000800080400000000000000000000000000000000000000000
      00000000000000000000649D61FF327D2EFF327D2EFF327D2EFF327D2EFF327D
      2EFF327D2EFF327D2EFF327D2EFF4CA948FF50AF4CFF50AF4CFF50AF4CFF50AF
      4CFF50AF4CFF7FC47BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080C0E00000000000C0A0
      6000000000000000000000000000F0FBFF000020600080400000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0FBFF000040A00000000000C0C060000000000000000000000000000000
      00000000000040A0E00000000000C06000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9FBF8FF84B182FF3C83
      38FF327D2EFF327D2EFF327D2EFFE5EFE5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A2C39FFFECF3EBFF0000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF00008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF00008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AAAAAA00AA00000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF0000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800080808000808080000000000000000000000000000000000000000000AA00
      0000AA000000AA000000AA000000AA0000000000000000000000000000000000
      000000000000AA000000AAAAAA00000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000808080000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000808080000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000808080008080800000000000000000000000000000000000AA00
      0000AA000000AA000000AA000000000000000000000000000000000000000000
      00000000000000000000AA000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF00008080
      80000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF0000008080800080808000000000000000000000000000AA00
      0000AA000000AA00000000000000000000000000000000000000000000000000
      00000000000000000000AA000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      000080808000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000080808000000000000000000000000000AA00
      0000AA00000000000000AA000000000000000000000000000000000000000000
      00000000000000000000AA000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000080808000000000000000000000000000AA00
      0000000000000000000000000000AA000000AA00000000000000000000000000
      000000000000AA000000AAAAAA00000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AA000000AA000000AA00
      0000AA000000AAAAAA0000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF00000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000008000000000000000000000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000008000000000000000800000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000080800080808000008080008080
      800080000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0080000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000008000000000000000800000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080008080800000808000808080000080
      800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000800000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000080800080808000008080008080
      800080000000FFFFFF00000000000000000000000000FFFFFF00800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080008080800000808000808080000080
      800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFF
      FF00800000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000080800080808000008080008080
      800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000
      000000000000FFFFFF0080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080008080800000808000808080000080
      8000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF008000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000080800080808000008080008080
      8000008080008080800000808000808080000080800080808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080008080800000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000080808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000080800080808000008080000000000000FF
      FF00000000000000000000FFFF00000000008080800000808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      8000000000000000000080808000FFFFFF008080800000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000080000000
      8000000080000000000080808000000000000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000080000000
      8000000000000000000080808000FFFFFF008080800000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000FF000000FF000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000080000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000FF000000FF000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF0080808000FFFFFF0080808000FFFF
      FF0080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      00000000000000FF00000000000000FF00000000000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      00000000000000FF00000000000000FF00000000000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000FFFFFF0080000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF00000000000000FF
      00000000000000FF00000000000000FF00000000000000FF00000000000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000000000000000000000000000000000000000
      0000808080000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000080808000000000008000000000800000008000000080
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF00000080000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      00008080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF008000000000FF0000008000000080
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      0000000000000000000000000000008080000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF00000000000000FF
      00000000000000FF00000000000000FF00000000000000FF00000000000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000080808000000000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000000000000000000000000008080000080800000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      00000000000000FF00000000000000FF00000000000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      00000000000000FF00000000000000FF00000000000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000000000
      0000000000008080800000000000000000008080000080800000808000008080
      0000808000008080000000000000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000808000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000FF000000FF000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000000000000000FFFFFF0080800000808000008080
      0000808000008080000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000808000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000FF000000FF000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000000000000000FFFFFF0080800000808000008080
      0000808000008080000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
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
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000000000000000080808000FFFFFF008080800000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF0000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000080000000
      8000000000000000000080808000000000000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000FF0000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000080000000
      0000000000000000000080808000FFFFFF008080800000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000FF000000800000000000000000000000FF00000080
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000000000000000000000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008000000080000000800000000000000080000000FF00000080
      0000000000000000000000000000000080000000800000008000000080000000
      000080808000000000008080800000000000000000000000000000000000FFFF
      FF0000FFFF000000000000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF0080808000FFFFFF0080808000FFFF
      FF0080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080000000800000000000000080000000FF00000080
      00000000000080808000000000000000FF000000FF0000008000000080000000
      80000000000000000000808080000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000008080000080800000808000008080000080
      8000008080000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      00000000000080808000000000000000FF000000FF000000FF00000080000000
      800000000000000000008080800000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000FFFFFF0080000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008000000080
      00008080800080808000000000000000FF000000FF000000FF000000FF000000
      80000000000000000000808080000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000080808000000000008000000000800000008000000080
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000FFFFFF000000FF000000FF000000FF000000FF000000
      800000000000000000008080800000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF008000000000FF0000008000000080
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFFFF00FFFFFF000000FF000000FF000000FF000000
      00000000000000000000808080000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000080808000000000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000808080008080800000000000808080000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000008080000080800000808000008080
      0000808000008080000000000000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000000000000000FFFFFF0080800000808000008080
      0000808000008080000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000000000000000FFFFFF0080800000808000008080
      0000808000008080000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000000000000000000000000000FFFFFF00FFFFFF00000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFFFF00FFFFFF000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000000000000000
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
      0000000000000000000000000000000000008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080000000FF000000FF000000FF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000008080
      8000000000000000000000000000000000008080800000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000FF000000FF000000000000000000000000FFFF0000FFFF000000
      0000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000808080000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      800000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00808080000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000008080
      8000808080008080800000000000000000000000000000000000000000008080
      800000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008080
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000008080
      800000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000008080800000000000000000000000000000000000000000008080
      800000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000008080800000000000000000000000000000000000000000000000
      000000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000008080800000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C0008080
      8000C0C0C0008080800080808000C0C0C00080808000C0C0C000808080000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080000000000000000000808080000000000080808000000000000000
      0000000000008080800000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000FFFF0000FFFF000080
      800000000000000000000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000FFFF0000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000FF0000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000000000008080
      8000000000000000000000000000000000008080800000000000000000000000
      0000000000000080000000FF0000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000008080
      800000000000FF000000FF000000000000000000000000FFFF0000FFFF000000
      0000000000000000FF000000FF00000080000000000000000000000000000000
      0000000000000080000000FF000000800000000000000000000000FF00000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000008080
      800000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000008000000080000000800000000000000080000000FF00000080
      0000000000000000000000000000000080000000800000008000000080000000
      0000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      000000000000000000000080000000800000000000000080000000FF00000080
      00000000000080808000FF00FF000000FF000000FF0000008000000080000000
      8000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      00000000000080808000FF00FF000000FF000000FF000000FF00000080000000
      8000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008000000080
      00008080800080808000FF00FF000000FF000000FF000000FF000000FF000000
      8000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000800000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000FFFFFF000000FF000000FF000000FF000000FF000000
      8000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFFFF00FFFFFF000000FF000000FF000000FF000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000FFFF0000FFFF000080
      8000000000000000FF000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000000000008080800080808000FF00FF00808080000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000080
      800000000000000000000000FF00000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000FFFF0000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000000000000000000000000000FFFFFF00FFFFFF00000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFFFF00FFFFFF000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF00008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF0000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF0000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF0000000000000000000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF000000FF000000FF0000000000000000000000FF00
      0000FF000000FF0000000000000000000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
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
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000000000000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000008080000080800000808000008080000080
      8000008080000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000000000000000000000000000000000080
      80000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
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
      2800000050000000C80000000100010000000000600900000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FCFF0000FFFFFFFFFFFFFFFFC0FF0000FFFFFFFFFFFFFFFC00030000FFFFFF9E
      3FFF8FFC00030000F3CFFF8E3FFF8FFC00030000EDB7FFC67FFF8FFC00030000
      E187FFC47FFF8FFC00030000E007FFE0FFFF8FFC00030000F3C7FFF1FFFF8FFC
      00030000F9FB7FF1FFFF07FC00030000FEDD7FE0FFFE07FC00030000FF5E7FE4
      FFFE23FC00030000FF9FFFC47FFC71FC00030000FFFFFFCE7FF871FC00030000
      FFFFFF8E3FF0F8FF80FF0000FFFFFFFFFFFFFFFFFCFF0000FFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFEFFFFFF7FFEFFFF0000FFFFFE7FFFFF3FFE7FFF0000FFF3FE3FFFFF1FFE
      3FE30000E0F9FE1F83FF0FFE1FC10000E1FDFE0F03FF07FE0F800000E3FDFE07
      03FF03FE07000000E5FDFE0703FF03FE07000000EE79FE0F03FF07FE0F010000
      FF83FE1F07FF0FFE1F830000FFFFFE3FFFFF1FFE3FC70000FFFFFE7FFFFF3FFE
      7FFF0000FFFFFEFFFFFF7FFEFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFF0000FFFFFFE7FFFFFFFFF0030000FF803FDB3FFBFF7E00030000FF803FDA
      DFF1FFFC00030000FF803FDADFF0FEFC00030000E0003FE2DFF8FDFC00030000
      E0003FFA3FFC79FC00070000E0003FF8FFFE33FC000F0000E0003FFDFFFF07FC
      000F0000E0007FF8FFFF8FFC000F0000E000FFFAFFFF07FC000F0000E001FFF2
      7FFE33FC3F0F0000E01FFFF77FF879FC000F0000E03FFFF77FF0FCFE001F0000
      E07FFFF77FF1FF7FE1FF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFDE
      03FFFFFFFFFF0000FFFFFFCC55FFFFFC00030000E000FF05ADE7F3FC00030000
      C018FECC55E3EBFC00030000C018FEDDFDF1D7FC00030000C018FFFC01F8AFFC
      00030000C000F801FDFC5FFC00030000C000F00005FEBFFC00030000C000F671
      05FD1EFC00030000C7F8F40005C28C7C00030000C7F8F80105C1C03C00030000
      C7F8FBFCA9D9E07C00030000C7F8FA0203F9E0FC00030000C7F8FA027FF1C0FC
      00030000C7FAFA027FFF01FC00030000C000FA027FFF87FC00030000FFFFFBFE
      7FFFFFFC00030000FFFFFC00FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFF1FFFFFFFFFF0000FFFFFFFFCCFFFFFFC6030000C0003CFF3CFFFFFF
      BC550000DB6DB87CFCC007FE0DAD0000DB6DB84BFCC003FF1C550000DFFFB807
      FCC001FFBDFD0000C000380404C000FFFC010000DB6DBC8204C0007801FD0000
      DFFFBF8204C0003000050000DB6DBFC204C007F671050000DB6DBFF004C007F4
      00050000DFFFBFF40CC007F801050000C0003FF65CE3FC7BFCA90000DB6DBFF7
      FCFFFE7A02030000DFFFBFF7F2FFDD7A027F0000DB6DBFF7C9FFE3FA027F0000
      DB6DBFF727FFFFFA027F0000C0003FF49FFFFFFBFE7F0000FFFFFFF27FFFFFFC
      00FF0000FFFFFFF9FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFC000FFFFFF0000FF1FFFFFFFC0007E00070000
      FC07FFF03FD0003E00070000F803FFE03FC0003E00070000F001FFC00FC0007E
      00070000F000FF0003C0007E00070000E000FE0003C0007E00070000E000FE00
      03C0007E00070000E000FE0003D0007E00070000F001FE0003C8007E00070000
      F001FE0003D3007E00070000F803FE0003CB007E00070000FC07FE0003D3047E
      00070000FF1FFE0007E317FE00070000FFFFFFFFFFF387FE00070000FFFFFFFF
      FFFBFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFF10000FFFFFFFFFFFFFFFFFFCC0000FFFFFFFFFFC000FC
      FF3C0000FFFFFF800F8000787CFC0000FFFFFF800F8000384BFC0000F18FFF80
      0F80003807FC0000F8C7FF800F80007804040000FC63FF800FC0007C80040000
      FE31FF800FF0007F80040000C0183F800FF0007FC0040000C0183F800FF0007F
      F0040000FE31FF800FF8007FF40C0000FC63FF800FF3007FF61C0000F8C7FF80
      1FFB007FF7FC0000F18FFF803FF3047FF7F20000FFFFFF807FF317FFF7C90000
      FFFFFFFFFFF387FFF7270000FFFFFFFFFFFBFFFFF49F0000FFFFFFFFFFFFFFFF
      F27F0000FFFFFFFFFFFFFFFFF9FF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFF0000FFFFFFEFFFFFFFFFFFFF0000FFFFFFE7FFFFFFFFFFFF0000
      FF0FFFE3FFFFFFFFBFFF0000FE07FFE1FFF801FF3FFF0000FC63FFE0FFF801FE
      001F0000ECF37FE07FF801FE000F0000E4F27FE03FF801FF3FCF0000F0F0FFE0
      1FF801FFBFE70000F8F1FFE01FF801FFFFE70000F0F0FFE03FF801FFFFE70000
      E4F27FE07FF801FFFFCF0000EC637FE0FFF801FE000F0000FE07FFE1FFF801FE
      001F0000FF0FFFE3FFFFFFFFFFFF0000FFFFFFE7FFFFFFFFFFFF0000FFFFFFEF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFE000FF
      FFFF0000C007FE000FDFFF7E7F3F0000C003FC018F8000BE3EBF0000C001FC01
      8F8000BF1D7F0000C000FC018FBFFF3F8AFF0000C0007C000FA1FF3FC5FF0000
      C0003C000FBFFF5FEBFF0000C007FC000F80005FD1EF0000C007FC7F8FE0009C
      28C70000C007FC7F8FE0035C1C030000E3FC7C7F8FF0003D9E070000FFFE7C7F
      8FF000FF9E0F0000FFDD7C7F8FFC00FF1C0F0000FFE3FC7FAFFC00FFF01F0000
      FFFFFC000FFC007FF87F0000FFFFFFFFFFFE003FFFFF0000FFFFFFFFFFFF003F
      FFFF0000FFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 8
    Top = 368
    object AOpen: TAction
      Category = 'File'
      Caption = '&'#1054#1090#1082#1088#1099#1090#1100'...'
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081' '#1080#1079' '#1092#1072#1081#1083#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = AOpenExecute
    end
    object ASave: TAction
      Category = 'File'
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081' '#1074' '#1092#1072#1081#1083#1077
      ImageIndex = 1
      ShortCut = 113
    end
    object APrint: TAction
      Category = 'File'
      Caption = '&'#1055#1077#1095#1072#1090#1100'...'
      Hint = #1042#1099#1074#1077#1089#1090#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1080'/'#1080#1083#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
      ImageIndex = 2
    end
    object AQuit: TAction
      Category = 'File'
      Caption = '&'#1042#1099#1093#1086#1076
      Hint = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ShortCut = 32883
    end
    object ASetup: TAction
      Category = 'File'
      Caption = #1053'&'#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1072#1085#1072#1083#1072'...'
      Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1082#1072#1085#1072#1083' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      ImageIndex = 8
    end
    object AGo: TAction
      Category = 'File'
      Caption = '&'#1053#1072#1095#1072#1090#1100' '#1080#1079#1084#1077#1088#1077#1085#1080#1077
      Hint = #1053#1072#1095#1072#1090#1100' '#1080#1079#1084#1077#1088#1077#1085#1080#1077
      ImageIndex = 30
      OnExecute = AGoExecute
    end
    object AStop: TAction
      Category = 'File'
      Caption = '&'#1054#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1079#1084#1077#1088#1077#1085#1080#1077
      Enabled = False
      Hint = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1079#1084#1077#1088#1077#1085#1080#1077
      ImageIndex = 6
      OnExecute = AStopExecute
    end
    object ARes: TAction
      Category = 'File'
      AutoCheck = True
      Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1076#1080#1072#1075#1088#1072#1084#1084#1091
      Checked = True
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1076#1080#1072#1075#1088#1072#1084#1084#1091' '#1089' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072#1084#1080' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
      ImageIndex = 15
    end
    object AClear: TAction
      Category = 'File'
      Caption = '&'#1054#1095#1080#1089#1090#1080#1090#1100'...'
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1089#1077#1093' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
      ImageIndex = 9
    end
    object ACopy: TAction
      Category = 'File'
      Caption = '&'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100'  '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
      ImageIndex = 35
      ShortCut = 115
      OnExecute = ACopyExecute
    end
    object AAbout: TAction
      Category = 'File'
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
    end
    object AMeasStp: TAction
      Category = 'File'
      Caption = '&'#1056#1077#1078#1080#1084' '#1080#1079#1084#1077#1088#1077#1085#1080#1103'...'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1088#1077#1078#1080#1084' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      ImageIndex = 3
    end
    object AChartDlg: TAction
      Category = 'File'
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' &'#1076#1080#1072#1075#1088#1072#1084#1084#1099'...'
      Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
      ImageIndex = 14
      OnExecute = AChartDlgExecute
    end
    object ADel: TAction
      Category = 'File'
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100'  '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
      ImageIndex = 26
    end
    object ASelAll: TAction
      Category = 'File'
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
    end
    object AUndo: TAction
      Category = 'File'
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
      ImageIndex = 28
    end
    object AShowRes: TAction
      Category = 'File'
      Caption = '&'#1044#1080#1089#1087#1083#1077#1081
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1080#1089#1087#1083#1077#1081
      ImageIndex = 32
    end
    object ACanSave: TAction
      Category = 'File'
      AutoCheck = True
      Caption = 'ACanSave'
      ImageIndex = 1
      OnExecute = ACanSaveExecute
    end
  end
  object PMMeas: TPopupMenu
    Left = 40
    Top = 368
    object MMeasT1: TMenuItem
      Caption = #1062#1080#1082#1083#1080#1095#1077#1089#1082#1086#1077' '#1080#1079#1084#1077#1088#1077#1085#1080#1077
      ImageIndex = 1
      RadioItem = True
      OnClick = MMeasT0Click
    end
    object MMeasT0: TMenuItem
      Caption = #1054#1076#1085#1086#1082#1088#1072#1090#1085#1086#1077' '#1080#1079#1084#1077#1088#1077#1085#1080#1077
      Checked = True
      RadioItem = True
      OnClick = MMeasT0Click
    end
    object MMeasT2: TMenuItem
      Caption = #1041#1072#1083#1072#1085#1089#1080#1088#1086#1074#1082#1072' '#1082#1072#1085#1072#1083#1086#1074
      RadioItem = True
      OnClick = MMeasT0Click
    end
  end
  object OpenDialog: TOpenDialog
    Filter = #1059#1089#1082#1086#1088#1077#1085#1080#1103' (*.wrd)|*.wrd|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = #1054#1090#1082#1088#1099#1090#1100
    OnCanClose = OpenDialogCanClose
    Left = 103
    Top = 368
  end
  object TmChart: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TmChartTimer
    Left = 136
    Top = 368
  end
  object Timer_SetVals: TTimer
    Left = 136
    Top = 440
  end
  object Timer_OPCDataFill: TTimer
    Left = 88
    Top = 440
  end
  object TimerOPCInstall: TTimer
    Enabled = False
    OnTimer = TimerOPCInstallTimer
    Left = 26
    Top = 440
  end
  object MainMenu_server: TMainMenu
    Left = 24
    Top = 518
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102' '#1089#1080#1089#1090#1077#1084#1099' '#1082#1072#1082'  ...'
        OnClick = N4Click
      end
      object N14: TMenuItem
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1088#1091#1075#1091#1102' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102' '#1089#1080#1089#1090#1077#1084#1099' ...'
        OnClick = N14Click
      end
      object MFile_new: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1072#1081#1083' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
        OnClick = MFile_newClick
      end
      object N_backup: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
        OnClick = N_backupClick
      end
      object N5: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N5Click
      end
    end
    object N11: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      object N12: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1072#1090#1095#1080#1082#1086#1074
        object MSM_port1: TMenuItem
          Caption = #1055#1086#1088#1090'1'
          OnClick = MSM_port1Click
        end
        object MSM_port2: TMenuItem
          Caption = #1055#1086#1088#1090'2'
          OnClick = MSM_port2Click
        end
        object MSM_port3: TMenuItem
          Caption = #1055#1086#1088#1090'3'
          OnClick = MSM_port3Click
        end
        object MSM_port4: TMenuItem
          Caption = #1055#1086#1088#1090'4'
          OnClick = MSM_port4Click
        end
        object MSM_port5: TMenuItem
          Caption = #1055#1086#1088#1090'5'
          OnClick = MSM_port5Click
        end
        object MSM_port6: TMenuItem
          Caption = #1055#1086#1088#1090'6'
          OnClick = MSM_port6Click
        end
        object MSM_port7: TMenuItem
          Caption = #1055#1086#1088#1090'7'
          OnClick = MSM_port7Click
        end
        object MSM_port8: TMenuItem
          Caption = #1055#1086#1088#1090'8'
          OnClick = MSM_port8Click
        end
      end
      object N7: TMenuItem
        Caption = #1042#1085#1077#1096#1085#1080#1077' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1099
        OnClick = N7Click
      end
      object MM_dataproc: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
        OnClick = MM_dataprocClick
      end
    end
    object N9: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object MSM_manual: TMenuItem
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        OnClick = MSM_manualClick
      end
      object MSM_about: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = MSM_aboutClick
      end
    end
  end
  object OpenDialog_conf: TOpenDialog
    Left = 64
    Top = 520
  end
  object SaveDialog_conf: TSaveDialog
    DefaultExt = 'ini'
    Left = 100
    Top = 520
  end
end
