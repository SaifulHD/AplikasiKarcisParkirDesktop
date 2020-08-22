unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxpngimage, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tloginadmin = class(TForm)
    img1: TImage;
    img2: TImage;
    edtuser: TEdit;
    edtpass: TEdit;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    zqry1: TZQuery;
    procedure img4Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginadmin: Tloginadmin;

implementation

uses Unit2, Unit4;

{$R *.dfm}

procedure Tloginadmin.img4Click(Sender: TObject);
begin
 loginadmin.Hide;
form2.Show;
end;

procedure Tloginadmin.img3Click(Sender: TObject);
begin
zqry1.SQL.Text:='select*from admin where username ="'+edtuser.Text+'" and password= "'+edtpass.Text+'"';
  zqry1.Active:=True;
  if       zqry1.RecordCount >0 then
  begin
       edtuser.Text:=zqry1['username'];
       edtpass.Text:=zqry1['password'];
       loginadmin.Hide;
       Formadmin.Show;
        Application.MessageBox('Selamat Datang!', 'Informazione', MB_OK +
          MB_ICONINFORMATION);

  end
  else if (edtuser.text='') and (edtpass.Text='') then
  Application.MessageBox('Username dan Password masih kosong', 'Informazione',
    MB_OK + MB_ICONWARNING)

  else
  Application.MessageBox('Username atau Password yang dimasukan salah',
    'Error', MB_OK + MB_ICONSTOP);
end;

end.
