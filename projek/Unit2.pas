unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxpngimage, ExtCtrls, ZAbstractConnection, ZConnection;

type
  TForm2 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    con1: TZConnection;
    procedure img2Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm2.img2Click(Sender: TObject);
begin
Form2.Hide;
loginop.Show;
end;

procedure TForm2.img3Click(Sender: TObject);
begin
 Form2.Hide;
loginadmin.Show;
end;

end.
