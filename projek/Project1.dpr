program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {loginop},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {loginadmin},
  Unit4 in 'Unit4.pas' {formadmin},
  Unit5 in 'Unit5.pas' {FormOP};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(Tloginop, loginop);
  Application.CreateForm(Tloginadmin, loginadmin);
  Application.CreateForm(Tformadmin, formadmin);
  Application.CreateForm(TFormOP, FormOP);
  Application.Run;
end.
