unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, XPMan, ShellAPI;

type
  TMainForm = class(TForm)
    StartButton: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    KeyGroupBox: TGroupBox;
    KeyMemo: TMemo;
    LoadKeyButton: TButton;
    MessageGroupBox: TGroupBox;
    SourceLabel: TLabel;
    EncodeLabel: TLabel;
    SourceMemo: TMemo;
    EncodeMemo: TMemo;
    SwapButton: TButton;
    LoadSourceButton: TButton;
    EncodeButton: TButton;
    KeyLabel: TLabel;
    AuthorLabel: TLabel;
    UrlLabel: TLabel;
    XPManifest: TXPManifest;
    GitLabel: TLabel;
    SourcesLabel: TLabel;
    procedure StartButtonClick(Sender: TObject);
    procedure SwapButtonClick(Sender: TObject);
    procedure EncodeMemoChange(Sender: TObject);
    procedure SourceMemoChange(Sender: TObject);
    procedure KluczEditChange(Sender: TObject);
    procedure LoadSourceButtonClick(Sender: TObject);
    procedure EncodeButtonClick(Sender: TObject);
    procedure LoadKeyButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UrlLabelClick(Sender: TObject);
  private
  public
  end;

var
  MainForm: TMainForm;
  EncodedText, TempBuffer: string;

implementation

{$R *.dfm}

function _file2string(nazwaPliku: string): string;
var
  f: file;
  s: string;
begin
  AssignFile(f, nazwaPliku);
  FileMode:= fmOpenRead;
  reset(f, 1);
  SetLength(s, FileSize(f));
  BlockRead(f, s[1], length(s));
  CloseFile(f);
  Result:= s;
end;

function _xor(t: string; k: string): string;
var
  iX, iY, iZ: integer;
  z: string;
begin
  iY:= 0;
  iX:= 0;
  repeat
      inc(iX, 1);
      inc(iY, 1);
      iZ:= Ord(k[iX]) xor Ord(t[iY]);
      z:= z + Char(iZ);
      if (iX = Length(k)) then
        iX:= 0;
  until (iY = Length(t));
  Result:= z;
end;

procedure TMainForm.StartButtonClick(Sender: TObject);
begin
  EncodedText:= _xor(TempBuffer, KeyMemo.Text);
  EncodeMemo.Text:= EncodedText;
end;

procedure TMainForm.SwapButtonClick(Sender: TObject);
begin
  SourceMemo.Text:= EncodedText;
  TempBuffer:= EncodedText;
end;

procedure TMainForm.EncodeMemoChange(Sender: TObject);
begin
  if EncodeMemo.Text <> '' then
    SwapButton.Enabled:= true
  else
    SwapButton.Enabled:= false;
end;

procedure TMainForm.SourceMemoChange(Sender: TObject);
begin
  TempBuffer:= SourceMemo.Text;
  if (KeyMemo.Text = '') or (SourceMemo.Text = '') then
    StartButton.Enabled:= false
  else
    StartButton.Enabled:= true;
end;

procedure TMainForm.KluczEditChange(Sender: TObject);
begin
  if (KeyMemo.Text = '') or (SourceMemo.Text = '') then
    StartButton.Enabled:= false
  else
    StartButton.Enabled:= true;
end;

procedure TMainForm.LoadSourceButtonClick(Sender: TObject);
begin
  if (OpenDialog.Execute) and (OpenDialog.FileName <> '') then
    begin
      SourceMemo.Lines.LoadFromFile(OpenDialog.FileName);
      TempBuffer:= _file2string(OpenDialog.FileName);
      EncodeMemo.Clear;
    end;
end;

procedure TMainForm.EncodeButtonClick(Sender: TObject);
var
  f: TextFile;
begin
  if EncodeMemo.Text <> '' then
    begin
      if (SaveDialog.Execute) and (SaveDialog.FileName <> '') then
        begin
          AssignFile(f, SaveDialog.FileName);
          Rewrite(f);
          Write(f, EncodedText);
          CloseFile(f);
        end;
    end
  else
    showMessage('Enter some text to encode first!');
end;

procedure TMainForm.LoadKeyButtonClick(Sender: TObject);
begin
  if (OpenDialog.Execute) and (OpenDialog.FileName <> '') then
    begin
      KeyMemo.Lines.LoadFromFile(OpenDialog.FileName);
      EncodeMemo.Clear;
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  KeyMemo.Text:= 'SecretKeyword';
  SourceMemo.Text:= '"And he said unto me, My grace is sufficient for thee: for my strength is made perfect in weakness. Most gladly therefore will I rather glory in my infirmities, that the power of Christ may rest upon me." [King James Version, 2kor 12]';
end;

procedure TMainForm.UrlLabelClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('http://'+TLabel(Sender).Caption), nil, nil, SW_SHOWNORMAL);
end;

end.
