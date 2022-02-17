object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Linear Prediction Program'
  ClientHeight = 502
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 170
    Top = 323
    Width = 24
    Height = 13
    Caption = 'Error'
  end
  object Label9: TLabel
    Left = 43
    Top = 323
    Width = 27
    Height = 13
    Caption = 'Alpha'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 233
    Caption = 'Parameters Input'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Amplitude'
    end
    object Label2: TLabel
      Left = 16
      Top = 67
      Width = 51
      Height = 13
      Caption = 'Frequency'
    end
    object Label3: TLabel
      Left = 88
      Top = 24
      Width = 15
      Height = 13
      Caption = 'S 1'
    end
    object Label4: TLabel
      Left = 149
      Top = 24
      Width = 15
      Height = 13
      Caption = 'S 2'
    end
    object Label5: TLabel
      Left = 199
      Top = 24
      Width = 15
      Height = 13
      Caption = 'S 3'
    end
    object Label6: TLabel
      Left = 16
      Top = 99
      Width = 76
      Height = 13
      Caption = 'Amount of Data'
    end
    object Edit1: TEdit
      Left = 80
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '5'
    end
    object Edit2: TEdit
      Left = 80
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '40'
    end
    object Edit3: TEdit
      Left = 135
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '7'
    end
    object Edit4: TEdit
      Left = 135
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 3
      Text = '20'
    end
    object Edit5: TEdit
      Left = 189
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 4
      Text = '3'
    end
    object Edit6: TEdit
      Left = 189
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 5
      Text = '30'
    end
    object Edit7: TEdit
      Left = 135
      Top = 96
      Width = 41
      Height = 21
      TabOrder = 6
      Text = '200'
    end
    object btnGenerate: TButton
      Left = 16
      Top = 184
      Width = 75
      Height = 25
      Caption = 'GENERATE'
      TabOrder = 7
      OnClick = btnGenerateClick
    end
    object btnAuto: TButton
      Left = 131
      Top = 184
      Width = 90
      Height = 25
      Caption = 'Autocorrelation'
      TabOrder = 8
      OnClick = btnAutoClick
    end
  end
  object Chart1: TChart
    Left = 255
    Top = 8
    Width = 409
    Height = 161
    Legend.Visible = False
    Title.Text.Strings = (
      'Real Signal')
    View3D = False
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Chart2: TChart
    Left = 255
    Top = 175
    Width = 409
    Height = 161
    Legend.Visible = False
    Title.Text.Strings = (
      'Autocorrelation')
    View3D = False
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series2: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object ListBox1: TListBox
    Left = 24
    Top = 342
    Width = 63
    Height = 155
    ItemHeight = 13
    TabOrder = 3
  end
  object ListBox2: TListBox
    Left = 112
    Top = 342
    Width = 137
    Height = 155
    ItemHeight = 13
    TabOrder = 4
  end
  object SpinEdit1: TSpinEdit
    Left = 8
    Top = 280
    Width = 63
    Height = 22
    MaxValue = 10
    MinValue = 0
    TabOrder = 5
    Value = 0
    OnChange = SpinEdit1Change
  end
  object btnClose: TButton
    Left = 174
    Top = 278
    Width = 75
    Height = 25
    Caption = 'CLOSE'
    TabOrder = 6
    OnClick = btnCloseClick
  end
  object btnClear: TButton
    Left = 93
    Top = 278
    Width = 75
    Height = 25
    Caption = 'CLEAR'
    TabOrder = 7
    OnClick = btnClearClick
  end
  object Chart3: TChart
    Left = 255
    Top = 336
    Width = 409
    Height = 161
    Legend.Visible = False
    Title.Text.Strings = (
      'Predicted Signal')
    View3D = False
    TabOrder = 8
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series3: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
