object MainForm: TMainForm
  Left = 568
  Top = 126
  BorderStyle = bsDialog
  Caption = 'XOR algorithm implementation'
  ClientHeight = 347
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AuthorLabel: TLabel
    Left = 8
    Top = 320
    Width = 68
    Height = 13
    Caption = 'Rafa'#322' Toborek'
  end
  object UrlLabel: TLabel
    Left = 80
    Top = 320
    Width = 69
    Height = 13
    Cursor = crHandPoint
    Caption = 'toborek.info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = UrlLabelClick
  end
  object GitLabel: TLabel
    Left = 264
    Top = 320
    Width = 182
    Height = 13
    Cursor = crHandPoint
    Caption = 'github.com/clash82/XorEncoder'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = UrlLabelClick
  end
  object SourcesLabel: TLabel
    Left = 220
    Top = 320
    Width = 41
    Height = 13
    Caption = 'sources:'
  end
  object StartButton: TButton
    Left = 616
    Top = 312
    Width = 73
    Height = 25
    Caption = '&Start'
    TabOrder = 2
    OnClick = StartButtonClick
  end
  object KeyGroupBox: TGroupBox
    Left = 8
    Top = 16
    Width = 217
    Height = 289
    Caption = ' Key '
    TabOrder = 0
    object KeyLabel: TLabel
      Left = 8
      Top = 24
      Width = 22
      Height = 13
      Caption = '&Key:'
      FocusControl = KeyMemo
    end
    object KeyMemo: TMemo
      Left = 8
      Top = 40
      Width = 201
      Height = 201
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnChange = SourceMemoChange
    end
    object LoadKeyButton: TButton
      Left = 8
      Top = 248
      Width = 105
      Height = 25
      Caption = 'L&oad from file'
      TabOrder = 1
      OnClick = LoadKeyButtonClick
    end
  end
  object MessageGroupBox: TGroupBox
    Left = 232
    Top = 16
    Width = 457
    Height = 289
    Caption = ' Text message '
    TabOrder = 1
    object SourceLabel: TLabel
      Left = 8
      Top = 24
      Width = 37
      Height = 13
      Caption = 'So&urce:'
      FocusControl = SourceMemo
    end
    object EncodeLabel: TLabel
      Left = 248
      Top = 24
      Width = 45
      Height = 13
      Caption = '&Encoded:'
      FocusControl = EncodeMemo
    end
    object SourceMemo: TMemo
      Left = 8
      Top = 40
      Width = 201
      Height = 201
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnChange = SourceMemoChange
    end
    object EncodeMemo: TMemo
      Left = 248
      Top = 40
      Width = 201
      Height = 201
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
      OnChange = EncodeMemoChange
    end
    object SwapButton: TButton
      Left = 216
      Top = 128
      Width = 25
      Height = 25
      Hint = 'Swap panels'
      Caption = '<'#8211
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = SwapButtonClick
    end
    object LoadSourceButton: TButton
      Left = 8
      Top = 248
      Width = 105
      Height = 25
      Caption = '&Load from file'
      TabOrder = 1
      OnClick = LoadSourceButtonClick
    end
    object EncodeButton: TButton
      Left = 248
      Top = 248
      Width = 105
      Height = 25
      Caption = 'Sa&ve to file'
      TabOrder = 4
      OnClick = EncodeButtonClick
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'All files|*.*'
    Left = 504
    Top = 312
  end
  object SaveDialog: TSaveDialog
    Filter = 'All files|*.*'
    Left = 472
    Top = 312
  end
  object XPManifest: TXPManifest
    Left = 536
    Top = 312
  end
end
