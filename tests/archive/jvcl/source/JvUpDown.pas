{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvUpDown.PAS, released on 2001-02-28.

The Initial Developer of the Original Code is Peter Below <100113.1101@compuserve.com>
Portions created by Peter Below are Copyright (C) 2000 Peter Below.
All Rights Reserved.

Contributor(s):
Sebastien Buysse [sbuysse@buypin.com].
Peter Th�rnqvist [peter3@peter3.com] - TJvDomainUpDown


Last Modified: 2003-04-09

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:

Description:

- TJvDomainUpDown works just like a TJvUpDown but instead of scrolling
a range of integer value, it scrolls a list of strings (as defined by Items)

-----------------------------------------------------------------------------}

{$I JVCL.INC}

unit JvUpDown;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls,
  ComCtrls, CommCtrl,
  JVCLVer;
  
type
  TJvAlignButton = (abLeft, abRight, abNone);
  TJvUpDownFormat = (ufInt,ufHex);
  TJvCustomUpDown = class(TCustomUpDown)
  private
    FAboutJVCL: TJVCLAboutInfo;
    FHintColor: TColor;
    FSaved: TColor;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnParentColorChanged: TNotifyEvent;
    FIncrement: Integer;
    FMin: Integer;
    FMax: Integer;
    FPosition: Integer;
    FAssociate: TWinControl;
    FHotTrack: Boolean;
    FAlignButton: TJvAlignButton;
    FFormat: TJvUpDownFormat;
    FAcceptsInteger,FFirstTime:boolean;
    procedure MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
    procedure CMParentColorChanged(var Msg: TMessage); message CM_ParentColorChangeD;
    function GetPosition: Integer;
    procedure SetIncrement(const Value: Integer);
    procedure SetMax(const Value: Integer);
    procedure SetMin(const Value: Integer);
    procedure SetPosition(const Value: Integer);
    procedure CNNotify(var Msg: TWMNotify); message CN_NOTIFY;
    procedure SetAssociate(const Value: TWinControl);
    procedure SetHotTrack(const Value: Boolean);
    procedure SetAlignButton(const Value: TJvAlignButton);
    procedure SetFormat(const Value: TJvUpDownFormat);
    procedure UndoAutoResizing(Value: TWinControl);
  protected
    procedure UpdateAssociate;virtual;
    procedure CreateWnd; override;
    procedure CreateParams(var Params: TCreateParams); override;
    function AcceptPosition(Value: Integer): Boolean;
    function CanChange: Boolean; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
  public

    constructor Create(AOwner: TComponent); override;
    function AcceptInteger: Boolean;
  protected
    property AlignButton: TJvAlignButton read FAlignButton write SetAlignButton default abRight;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property Format:TJvUpDownFormat read FFormat write SetFormat default ufInt;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
    property Color;
    property Min: Integer read FMin write SetMin;
    property Max: Integer read FMax write SetMax default 100;
    property Increment: Integer read FIncrement write SetIncrement default 1;
    property Position: Integer read GetPosition write SetPosition;
    property Associate: TWinControl read FAssociate write SetAssociate;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default false;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  end;

  TJvCustomDomainUpDown = class(TJvCustomUpDown)
  private
    FItems: TStrings;
    FCurrentText:string;
    function GetText:string;
    procedure SetItems(const Value: TStrings);
    procedure SetText(const Value: string);
  protected
    procedure DoItemsChange(Sender:TObject);
    procedure CreateParams(var Params: TCreateParams); override;

    procedure UpdateAssociate;override;
    procedure Click(Button: TUDBtnType); override;
    property Thousands default false;
    property Items:TStrings read FItems write SetItems;
    property Text:string read GetText write SetText;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TJvUpDown = class(TJvCustomUpDown)
  protected
    procedure UpdateAssociate; override;
  published
    property AlignButton;
    property Anchors;
    property Associate;
    property ArrowKeys;
    property Color;
    property Enabled;
    property Format;
    property Hint;
    property HintColor;
    property HotTrack;
    property Min;
    property Max;
    property Increment;
    property Constraints;
    property Orientation;
    property ParentShowHint;
    property PopupMenu;
    property Position;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Thousands;
    property Visible;
    property Wrap;

    property OnMouseEnter;
    property OnMouseLeave;
    property OnParentColorChange;
    property OnChanging;
    property OnChangingEx;
    property OnContextPopup;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TJvDomainUpDown = class(TJvCustomDomainUpDown)
  published
    property Associate;
    property Items;
    property Position;
    property Text;

    property AlignButton;
    property Anchors;
    property ArrowKeys;
    property Enabled;
    property Hint;
    property HintColor;
    property HotTrack;
    property Constraints;
    property Orientation;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property Wrap;

    property OnChanging;
    property OnChangingEx;
    property OnContextPopup;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;
  
implementation

const
  UDM_SETPOS32 = (WM_USER + 113);
  UDM_GETPOS32 = (WM_USER + 114);
  UDS_HOTTRACK = $0100;

constructor TJvCustomUpDown.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMin := 0;
  FMax := 100;
  FHintColor := clInfoBk;
  FHotTrack := false;
  FIncrement := 1;
  Controlstyle := Controlstyle + [csAcceptsControls];
  FAlignButton := abRight;
  FFormat := ufInt;
  FFirstTime := true;
end;

procedure TJvCustomUpDown.CMParentColorChanged(var Msg: TMessage);
begin
  inherited;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

procedure TJvCustomUpDown.MouseEnter(var Msg: TMessage);
begin
  FSaved := Application.HintColor;
  // for D7...
  if csDesigning in ComponentState then
    Exit;
  Application.HintColor := FHintColor;
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvCustomUpDown.MouseLeave(var Msg: TMessage);
begin
  Application.HintColor := FSaved;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

function TJvCustomUpDown.GetPosition: Integer;
begin
  if HandleAllocated then
  begin
    if AcceptInteger then
      Result := SendMessage(Handle, UDM_GETPOS32, 0, 0)
    else
      Result := SendMessage(Handle, UDM_GETPOS, 0, 0);
    FPosition := Result;
  end
  else
    Result := FPosition;
end;

procedure TJvCustomUpDown.SetIncrement(const Value: Integer);
var
  AccelArray: array [0..0] of TUDAccel;
begin
  if Value <> FIncrement then
  begin
    FIncrement := Value;
    if HandleAllocated then
    begin
      SendMessage(Handle, UDM_GETACCEL, 1, LPARAM(@AccelArray[0]));
      AccelArray[0].nInc := Value;
      SendMessage(Handle, UDM_SETACCEL, 1, LPARAM(@AccelArray[0]));
    end;
  end;
end;

procedure TJvCustomUpDown.SetMax(const Value: Integer);
begin
  if Value <> FMax then
  begin
    FMax := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETRANGE32, FMin, FMax);
  end;
end;

procedure TJvCustomUpDown.SetMin(const Value: Integer);
begin
  if Value <> FMin then
  begin
    FMin := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETRANGE32, FMin, FMax);
  end;
end;

procedure TJvCustomUpDown.SetPosition(const Value: Integer);
begin
  if Value <> FPosition then
  begin
    if AcceptPosition(Value) then
    begin
      FPosition := Value;
      if HandleAllocated then
      begin
        if AcceptInteger then
          SendMessage(Handle, UDM_SETPOS32, 0, FPosition)
        else
          SendMessage(Handle, UDM_SETPOS, 0, FPosition);
      END;
    end;
  end;
  UpdateAssociate;
end;

procedure TJvCustomUpDown.CNNotify(var Msg: TWMNotify);
begin
  with Msg do
    if NMHdr^.code = UDN_DELTAPOS then
      if AcceptPosition(PNMUpDown(NMHdr).iPos + PNMUpDown(NMHdr).iDelta) then
      begin
        FPosition := PNMUpDown(NMHdr).iPos + PNMUpDown(NMHdr).iDelta;
        UpdateAssociate;
      end;
end;

procedure TJvCustomUpDown.SetAssociate(const Value: TWinControl);
begin
  FAssociate := Value;
  if HandleAllocated then
  begin
    if Value = nil then
      SendMessage(Handle, UDM_SETBUDDY, 0, 0)
    else
    begin
      UndoAutoResizing(Value);
      SendMessage(Handle, UDM_SETBUDDY, Value.Handle, 0);
    end;
    UpdateAssociate;
  end;
end;

procedure TJvCustomUpDown.UndoAutoResizing(Value: TWinControl);
var
  OrigWidth, NewWidth, DeltaWidth: Integer;
  OrigLeft, NewLeft, DeltaLeft: Integer;
begin
  { undo Window's auto-resizing }
  OrigWidth := Value.Width;
  OrigLeft := Value.Left;
  SendMessage(Handle, UDM_SETBUDDY, Value.Handle, 0);
  NewWidth := Value.Width;
  NewLeft := Value.Left;
  DeltaWidth := OrigWidth - NewWidth;
  DeltaLeft := NewLeft - OrigLeft;
  Value.Width := OrigWidth + DeltaWidth;
  Value.Left := OrigLeft - DeltaLeft;
end;

procedure TJvCustomUpDown.CreateWnd;
const
  cBase:array[TJvUpDownFormat] of integer = (10,16);
var
  OrigWidth:integer; 
begin
  OrigWidth := Width;
  inherited CreateWnd;
  Width := OrigWidth;
  if FAssociate <> nil then
  begin
    UndoAutoResizing(Associate);
    SendMessage(Handle, UDM_SETBUDDY, FAssociate.Handle, 0);
  end;
  SendMessage(Handle, UDM_SETRANGE32, FMin, FMax);
  SendMessage(Handle,UDM_SETBASE,cBase[Format],0);
  SetPosition(Position);
  SetAssociate(FAssociate);
  Increment := 1;
end;

function TJvCustomUpDown.AcceptPosition(Value: Integer): Boolean;
begin
  Result := (Value >= Min) and ((Value <= Max) or (Max = 0));
end;

procedure TJvCustomUpDown.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    if FHotTrack then
      Style := Style or UDS_HOTTRACK;
    if (Style and UDS_ALIGNRIGHT) = UDS_ALIGNRIGHT then
      Style := Style and not UDS_ALIGNRIGHT;
    if (Style and UDS_ALIGNLEFT) = UDS_ALIGNLEFT then
      Style := Style and not UDS_ALIGNLEFT;
    case FAlignButton of
      abLeft:
        Style := Style or UDS_ALIGNLEFT;
      abRight:
        Style := Style or UDS_ALIGNRIGHT;
    end;
  end;
end;

procedure TJvCustomUpDown.SetHotTrack(const Value: Boolean);
begin
  FHotTrack := Value;
  RecreateWnd;
end;

procedure TJvCustomUpDown.SetAlignButton(const Value: TJvAlignButton);
begin
  FAlignButton := Value;
  RecreateWnd;
end;

function TJvCustomUpDown.CanChange: Boolean;
begin
  Result := inherited CanChange;
  if Result then
    if Assigned(Associate) and (Associate is TCustomEdit) and
      Assigned(Associate.Parent) then
      PostMessage(Associate.Parent.Handle,
        WM_COMMAND, MakeWParam(0, EN_CHANGE), Associate.Handle);
end;

function TJvCustomUpDown.AcceptInteger: Boolean;
var
  Info: Pointer;
  InfoSize: DWORD;
  FileInfo: PVSFixedFileInfo;
  FileInfoSize: DWORD;
  Tmp: DWORD;
  Major, Minor: Integer;
begin
  //SETPOS32 are only supported with comctl32.dll version 5.80 or later
  if FFirstTime then
  begin
  Result := False;
  try
    InfoSize := GetFileVersionInfoSize('comctl32.dll', Tmp);
    if InfoSize = 0 then
      Exit;
    GetMem(Info, InfoSize);
    try
      GetFileVersionInfo('comctl32.dll', 0, InfoSize, Info);
      VerQueryValue(Info, '\', Pointer(FileInfo), FileInfoSize);
      Major := FileInfo^.dwFileVersionMS shr 16;
      Minor := FileInfo^.dwFileVersionMS and $FFFF;
      Result := (Major > 5) or ((Major = 5) and (Minor > 80));
    finally
      FreeMem(Info, FileInfoSize);
    end;
  except
  end;
    FAcceptsInteger := Result;
    FFirstTime := false;
  end
  else
    Result := FAcceptsInteger;
end;

procedure TJvCustomUpDown.SetFormat(const Value: TJvUpDownFormat);
const
  cBase:array[TJvUpDownFormat] of integer = (10,16);
begin
  if FFormat <> Value then
  begin
    if HandleAllocated then
      SendMessage(Handle,UDM_SETBASE,cBase[Value],0);
    FFormat := Value;
    UpdateAssociate;
  end;
end;

procedure TJvCustomUpDown.UpdateAssociate;
begin
  // do nothing
end;

{ TJvUpDown }

procedure TJvUpDown.UpdateAssociate;
begin
  inherited;
  if (FAssociate is TCustomEdit) then
  begin
    if Format = ufHex then
     TCustomEdit(FAssociate).Text := '0x'+ IntToHex(Position,4)
    else
      TCustomEdit(FAssociate).Text := IntToStr(Position);
  end;
end;

{ TJvCustomDomainUpDown }

constructor TJvCustomDomainUpDown.Create(AOwner: TComponent);
begin
  inherited;
  FItems := TStringlist.Create;
  TStringlist(FItems).OnChange := DoItemsChange;
end;

procedure TJvCustomDomainUpDown.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and (not UDS_SETBUDDYINT) or UDS_NOTHOUSANDS;
end;

destructor TJvCustomDomainUpDown.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TJvCustomDomainUpDown.DoItemsChange(Sender: TObject);
begin
  // switch min and max around to scroll in the right direction
  Min := Items.Count - 1;
  Max := 0;
end;

function TJvCustomDomainUpDown.GetText: string;
begin
  if (Position >= 0) and (Position < Items.Count) then
  begin
    Result := Items[Position];
    FCurrentText := Result;
  end
  else
    Result := FCurrentText;
end;

procedure TJvCustomDomainUpDown.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TJvCustomDomainUpDown.UpdateAssociate;
begin
  if (FAssociate is TCustomEdit) then
     TCustomEdit(FAssociate).Text := Text;
//  if (Associate <> nil) and Associate.HandleAllocated then
//    SendMessage(Associate.Handle, WM_SETTEXT, 0, longint(PChar(Text)));
end;

procedure TJvCustomDomainUpDown.SetText(const Value: string);
begin
  Position := FItems.IndexOf(Value);
  FCurrentText := Value;
end;

procedure TJvCustomDomainUpDown.Click(Button: TUDBtnType);
begin
  inherited;
  UpdateAssociate;
end;

procedure TJvCustomUpDown.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FAssociate) then
    Associate := nil;
end;

end.

