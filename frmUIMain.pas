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
  ro.Events['getStringFromBrowser'].Fire;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  BaseDir : string;
begin
  BaseDir := ExtractFilePath(ParamStr(0));
  while BaseDir <> '' do begin
    FXtagDir := BaseDir + 'js\';
    if DirectoryExists(FXtagDir) then break;
    BaseDir := ExtractFilePath(ExcludeTrailingBackSlash(BaseDir));
  end;

  ro := TJSObject.Create('ro');
  ro.Events.Add('getStringFromBrowser');
  ro.Properties.Add('stringdata')
    .OnSet(TJSBinding.Create(
      procedure(const Parent: IJSObject; const Prop: IJSproperty)
      var value: string;
      begin
         value := Prop.AsString;
         showmessage(value);
      end
    )).AsString := '';
  ro.ApplyModel;
  VirtualUI.HTMLDoc.CreateSessionURL('/js/',FXtagDir);
  VirtualUI.HTMLDoc.LoadScript('/js/vui-jsro.js','');
end;

end.

