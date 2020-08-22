unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxpngimage, ExtCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  Tloginop = class(TForm)
    img1: TImage;
    img2: TImage;
    edtuser: TEdit;
    edtpass: TEdit;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    zqry1: TZQuery;
    con1: TZConnection;
    procedure img4Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginop: Tloginop;

implementation

uses Unit2, Unit4, Unit5;

{$R *.dfm}

procedure Tloginop.img4Click(Sender: TObject);
begin
 loginop.Hide;
form2.Show;
end;

procedure Tloginop.img3Click(Sender: TObject);
begin
zqry1.SQL.Text:='select*from karyawan where nik ="'+edtuser.Text+'" and password= "'+edtpass.Text+'"';
  zqry1.Active:=True;
  if       zqry1.RecordCount >0 then
  begin
       edtuser.Text:=zqry1['nik'];
       edtpass.Text:=zqry1['password'];
       loginop.Hide;
       Formop.Show;
        Application.MessageBox('Selamat Datang!', 'Informazione', MB_OK +
          MB_ICONINFORMATION);

  end
  else if (edtuser.text='') and (edtpass.Text='') then
  Application.MessageBox('NIK dan Password anda masih kosong', 'Informazione',
    MB_OK + MB_ICONWARNING)

  else
  Application.MessageBox('NIK atau Password yang dimasukan salah',
    'Error', MB_OK + MB_ICONSTOP);

    FormOP.edtnik.Text:= edtuser.Text  ;
end;

end.
