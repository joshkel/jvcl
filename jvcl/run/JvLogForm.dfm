object FoLog: TFoLog
  Left = 454
  Top = 250
  Width = 421
  Height = 375
  Caption = 'FoLog'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100001001000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000BBBB0000000000BB000BB000000000BB0000B000000000B
    BB000BB00000000BBB000BB00000000000000BB00000000000000BB000000000
    00000BB00000000000000BB00000000000000BB00000000000000BB000000000
    00000BB0000000000000BBBB00000000000BBBBBB0000000000000000000FFFF
    0000F87F0000E73F0000E7BF0000E39F0000E39F0000FF9F0000FF9F0000FF9F
    0000FF9F0000FF9F0000FF9F0000FF9F0000FF0F0000FE070000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 413
    Height = 24
    AutoSize = True
    ButtonWidth = 24
    Caption = 'ToolBar1'
    EdgeBorders = [ebBottom]
    Flat = True
    Images = ImageList1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Action = Save
    end
    object ToolButton1: TToolButton
      Left = 24
      Top = 0
      Action = Print
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 24
    Width = 413
    Height = 321
    Align = alClient
    Columns = <
      item
        Caption = 'Time'
        Width = 115
      end
      item
        Caption = 'Title'
        Width = 120
      end
      item
        Caption = 'Description'
        Width = 150
      end>
    FlatScrollBars = True
    GridLines = True
    HotTrack = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object ImageList1: TImageList
    Left = 16
    Top = 58
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000031636300639C9C00639C
      9C00313131003131310031313100313131003131310031313100B5B5B500B5B5
      B500313131000063630000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00B5B5B500B5B5B5000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639C9C009CCE
      CE004A4A4A004A4A4A0031313100313131003131310031313100CECECE00B5B5
      B50031313100639C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000316363009CCECE009CCE
      CE004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0031313100FFFFFF00CECE
      CE0031313100639C9C00000000000000000084848400FFFFFF00FFFFFF00DEDE
      DE00CECECE00CECECE00CECECE0000FF000000FF000000FF0000CECECE00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000316363009CCECE009CCE
      CE004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0031313100639C9C00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00CECECE00CECECE00008400000084000000840000CECECE00CECE
      CE00000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF009CCE
      CE009CCECE009CCECE009CCECE009CCECE009CCECE009CCECE009CCECE009CCE
      CE009CCECE00639C9C0000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF009CCE
      CE00316363003163630031636300316363003163630031636300316363003163
      63009CCECE00639C9C00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00CECECE000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF00639C
      9C00CEFFFF00CEFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF00316363009CCECE0000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF00639C
      9C00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF009CFFFF009CFF
      FF00316363009CCECE000000000000000000000000000000000084848400CECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF00639C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFFFF009CFF
      FF00316363009CCECE0000000000000000000000000000000000000000008484
      8400FFFFFF00FF313100FF313100FF313100FF313100FF313100FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF00639C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEFFFF00CEFFFF009CFF
      FF00316363009CCECE0000000000000000000000000000000000000000008484
      8400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300CEFFFF00639C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEFFFF00CEFFFF009CFF
      FF00316363003163630000000000000000000000000000000000000000000000
      000084848400FFFFFF00FF633100FF633100FF633100FF633100FF633100FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300FFFFFF00639C
      9C00639C6300639C6300639C6300639C6300639C6300639C6300639C6300639C
      630031636300C6C6C60000000000000000000000000000000000000000000000
      000084848400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003163630031636300639C
      9C00639C6300639C6300639C6300639C6300639C6300639C6300639C6300639C
      6300316363003163630000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFFFF00000000C001C00700000000
      8001800300000000800100010000000080010001000000008001000100000000
      8001000000000000800100000000000080018000000000008001C00000000000
      8001E001000000008001E007000000008001F007000000008001F00300000000
      8001F80300000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 60
    Top = 58
    object Save: TAction
      Caption = 'Save'
      Hint = 'Save'
      ImageIndex = 0
      ShortCut = 16467
      OnExecute = SaveExecute
    end
    object Print: TAction
      Caption = '&Print'
      Hint = 'Print'
      ImageIndex = 1
      ShortCut = 16464
      OnExecute = PrintExecute
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV File (*.csv)|*.csv|Binary File (*.dat)|*.dat'
    Left = 136
    Top = 58
  end
end
