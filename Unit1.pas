unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses JsonDataObjects;

procedure TForm1.Button1Click(Sender: TObject);
var
  json: string;
  Obj: TJsonObject;
  obj1: TJsonObject;
  i: integer;
begin
  json := '{"001":{"nome":"fulano1", "sexo":"M"},"002":{"nome":"fulano2", "sexo":"F"},"003":{"nome":"fulano3", "sexo":"M"}}';

  Obj := TJsonObject.Parse(json) as TJsonObject;
  try
    for i := 0 to obj.count -1 do
    begin
      obj1 := Obj.Items[i].ObjectValue;

      showmessage(obj.Names[i] + ' ' +obj1.s['nome']);
    end;
  finally
    Obj.Free;
  end;
end;

end.
