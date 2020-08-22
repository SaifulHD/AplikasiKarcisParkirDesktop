unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxpngimage, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, SMDBGrid,
  StdCtrls, DateUtils,Math;

type
  TFormOP = class(TForm)
    img1: TImage;
    smdbgrd1: TSMDBGrid;
    zqry1: TZQuery;
    ds1: TDataSource;
    lbl1: TLabel;
    lbljam: TLabel;
    tmr1: TTimer;
    img2: TImage;
    lbl2: TLabel;
    img3: TImage;
    lbl3: TLabel;
    lblnopol: TLabel;
    edtnopol: TEdit;
    lblkarcis: TLabel;
    btn1: TButton;
    btn2: TButton;
    edtkeluar: TEdit;
    intgrfldzqry1idkarcis: TIntegerField;
    strngfldzqry1nik: TStringField;
    strngfldzqry1nopol: TStringField;
    tmfldzqry1masuk: TTimeField;
    tmfldzqry1keluar: TTimeField;
    intgrfldzqry1rf_bayar: TIntegerField;
    zqry2: TZQuery;
    lbl4: TLabel;
    edtnik: TEdit;
    lbl5: TLabel;
    zqry3: TZQuery;
    img4: TImage;
    smdbgrd2: TSMDBGrid;
    ds2: TDataSource;
    intgrfldzqry3id_trans: TIntegerField;
    intgrfldzqry3idkarcis: TIntegerField;
    zqry3rf_nopol: TStringField;
    zqry1rf_namapegawai: TStringField;
    tmfldzqry3rfmasuk: TTimeField;
    zqry3rfkeluar: TTimeField;
    intgrfldzqry3KJHJ: TIntegerField;
    strngfldzqry3nik: TStringField;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure tmr1Timer(Sender: TObject);
    procedure edtnopolChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure zqry1CalcFields(DataSet: TDataSet);
    procedure lbl7DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOP: TFormOP;

implementation

uses Unit1, Unit4;


{$R *.dfm}
 var
harga, jumlah : Integer;
jammasuk, jamkeluar, jamtotal : TDateTime;
procedure TFormOP.tmr1Timer(Sender: TObject);
begin
lbljam.caption:=TimeToStr(Now);
end;

procedure TFormOP.edtnopolChange(Sender: TObject);
begin
lblnopol.Caption:=edtnopol.text;
end;

procedure TFormOP.FormCreate(Sender: TObject);
begin
ShortDateFormat:='yyMMdd0';
TimeSeparator:='.';
lblkarcis.Caption:=DateToStr(now);
lbl7.Caption:='';

end;

procedure TFormOP.btn1Click(Sender: TObject);
var

a,b,c:Integer;
d:string;
begin
  if   edtnik.Text= '' then begin
Application.MessageBox('isi dulu nik nya', 'Informazione', MB_OK +
  MB_ICONWARNING);
edtnik.SetFocus;
end else
if   edtnopol.Text= '' then begin
Application.MessageBox('No. Polisinya masih kosong', 'Informazione', MB_OK +
  MB_ICONWARNING);
edtnopol.SetFocus;
end else
begin
 zqry1.Append;
 zqry2.Append;


  zqry1.fieldbyname('idkarcis').AsInteger:=StrToInt(lblkarcis.Caption);
  zqry1.fieldbyname('nopol').Asstring:=lblnopol.Caption;
  zqry1.fieldbyname('nik').Asstring:=edtnik.Text;
  zqry1.fieldbyname('masuk').AsDateTime:=StrToTime(lbljam.caption);
  zqry3.Append;
  zqry3.fieldbyname('idkarcis').AsInteger:=StrToInt(lblkarcis.Caption);
  zqry3.fieldbyname('id_trans').AsInteger:=StrToInt(lblkarcis.Caption);
  a:=StrToInt(lblkarcis.caption);
  b:=a+1;
  lblkarcis.Caption:=inttostr(b);
  edtnopol.text:='';
  lbl7.hide ;


end;
 end;

procedure TFormOP.img4Click(Sender: TObject);
begin
FormOP.Hide;
loginop.show;
loginop.edtuser.text:='';
loginop.edtpass.text:='';
Loginop.edtuser.setfocus;
end;

procedure TFormOP.zqry1CalcFields(DataSet: TDataSet);

begin
  jammasuk:=zqry1.fieldbyname('masuk').Asdatetime;;
  jamkeluar:=zqry1.fieldbyname('keluar').Asdatetime;
  jamtotal:=HourSpan(jammasuk,jamkeluar);
  jumlah:=Ceil(jamtotal);
  intgrfldzqry1rf_bayar.value := jumlah *1000;
   lbl7.Caption:=IntToStr(intgrfldzqry1rf_bayar.value);
end;
procedure TFormOP.btn2Click(Sender: TObject);
var
  a:Integer;
begin

ShortTimeFormat:='hh:nn';
TimeSeparator:='.';

zqry1.Edit;
zqry1.fieldbyname('keluar').AsDateTime:=StrToTime(lbljam.caption);
 jammasuk:=zqry1.fieldbyname('masuk').Asdatetime;;
  jamkeluar:=zqry1.fieldbyname('keluar').Asdatetime;
  jamtotal:=HourSpan(jammasuk,jamkeluar);
  jumlah:=Ceil(jamtotal);
  intgrfldzqry1rf_bayar.value := jumlah *1000;
   a:=intgrfldzqry1rf_bayar.value;
   lbl7.Caption:=IntToStr(a);
zqry1.Append;

    lbl7.show ;
end;

procedure TFormOP.lbl7DblClick(Sender: TObject);
begin
lbl7.Caption:='';
end;

end.
