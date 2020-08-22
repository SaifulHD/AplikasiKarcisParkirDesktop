unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, SMDBGrid, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection,
  frxpngimage, ExtCtrls, StdCtrls, SMDBFltr, SMDBFind, frxClass, frxDBSet,
  mxExport, SMDBCtrl;

type
  Tformadmin = class(TForm)
    img1: TImage;
    zqry1: TZQuery;
    ds1: TDataSource;
    zqry2: TZQuery;
    ds2: TDataSource;
    smdbgrd1: TSMDBGrid;
    lbl1: TLabel;
    smdbgrd2: TSMDBGrid;
    lbl2: TLabel;
    smdbnvgtr1: TSMDBNavigator;
    var_export: TmxDBGridExport;
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    smdbfndlg1: TSMDBFindDialog;
    smdbfltrdlg1: TSMDBFilterDialog;
    zqry3: TZQuery;
    img2: TImage;
    smdbgrd3: TSMDBGrid;
    ds3: TDataSource;
    intgrfldzqry3id_trans: TIntegerField;
    intgrfldzqry3idkarcis: TIntegerField;
    zqry3rf_nopol: TStringField;
    smdbnvgtr3: TSMDBNavigator;
    lbl3: TLabel;
    frxdbdtst2: TfrxDBDataset;
    frxrprt2: TfrxReport;
    frxdbdtst3: TfrxDBDataset;
    frxrprt3: TfrxReport;
    var_export2: TmxDBGridExport;
    smdbfndlg2: TSMDBFindDialog;
    smdbfltrdlg2: TSMDBFilterDialog;
    procedure img2Click(Sender: TObject);
    procedure smdbnvgtr3Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure smdbnvgtr1Click(Sender: TObject; Button: TSMNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formadmin: Tformadmin;

implementation

uses Unit3;

{$R *.dfm}

procedure Tformadmin.img2Click(Sender: TObject);
begin
formadmin.Hide;
loginadmin.show;
loginadmin.edtuser.text:='';
loginadmin.edtpass.text:='';
Loginadmin.edtuser.setfocus;
end;

procedure Tformadmin.smdbnvgtr3Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
case Button of
sbExport: var_export.select;
sbFind: smdbfndlg1.execute;
sbFilter: smdbfltrdlg1.Execute;
sbPrint: frxrprt1.ShowReport();
end;
end;

procedure Tformadmin.smdbnvgtr1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
case Button of
sbExport: var_export2.select;
sbFind: smdbfndlg2.execute;
sbFilter: smdbfltrdlg2.Execute;
sbPrint: frxrprt3.ShowReport();
end;
  end;

end.
