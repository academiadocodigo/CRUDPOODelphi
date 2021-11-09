program CRUDPOODelphi;

uses
  Vcl.Forms,
  CRUDPOO.View.Main in 'src\view\CRUDPOO.View.Main.pas' {Form1},
  CRUDPOO.Model.Pessoa in 'src\model\CRUDPOO.Model.Pessoa.pas',
  CRUDPOO.Model.Endereco in 'src\model\CRUDPOO.Model.Endereco.pas',
  CRUDPOO.Model.Connection in 'src\model\connection\CRUDPOO.Model.Connection.pas' {Connection: TDataModule},
  CRUDPOO.DAO.Pessoa in 'src\DAO\CRUDPOO.DAO.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
