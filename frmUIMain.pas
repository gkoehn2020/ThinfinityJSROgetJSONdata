unit frmUIMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VirtualUI_SDK;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FXtagDir: string;
    ro: TJSObject;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
  ro.Events['getJSON'].Fire;
  sleep(100);
  memo1.Lines.add(ro.Properties['myJSON'].AsJSON);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  BaseDir : string;
begin
  BaseDir := ExtractFilePath(ParamStr(0));
  while BaseDir<>'' do begin
    FXtagDir := BaseDir + 'x-tag\';
    if DirectoryExists(FXtagDir) then break;
    BaseDir := ExtractFilePath(ExcludeTrailingBackSlash(BaseDir));
  end;

  VirtualUI.HTMLDoc.CreateSessionURL('/x-tag/',FXtagDir);
  VirtualUI.HTMLDoc.LoadScript('/x-tag/x-tag-core.min.js','');
  VirtualUI.HTMLDoc.ImportHTML('/x-tag/vui-jsro/vui-jsro.html','');
  VirtualUI.HTMLDoc.CreateComponent('vui-gk', 'vui-gk', 0);

  ro := TJSObject.Create('ro');
  ro.Events.Add('getJSON');
  ro.Properties.Add('myJSON').AsJSON := '{}';
  ro.ApplyModel;
end;

end.

