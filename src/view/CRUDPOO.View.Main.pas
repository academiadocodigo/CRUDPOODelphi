unit CRUDPOO.View.Main;

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

uses
  CRUDPOO.Model.Pessoa, CRUDPOO.Model.Endereco, CRUDPOO.DAO.Pessoa;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lPessoa : TPessoa;
  lEndereco : TEndereco;
  lDAOPessoa : TDAOPessoa;
  I: Integer;
begin
  lPessoa := TPessoa.Create;
  lDAOPessoa := TDAOPessoa.Create;
  try
    lPessoa.Id := 2;
    lPessoa.Nome := 'Alessandro';

    lEndereco := TEndereco.Create;
    lEndereco.id := 1;
    lEndereco.IdPessoa := lPessoa.Id;
    lEndereco.Logradouro := 'Rua teste1';
    lPessoa.Endereco.Add(lEndereco);

    lEndereco := TEndereco.Create;
    lEndereco.id := 2;
    lEndereco.IdPessoa := lPessoa.Id;
    lEndereco.Logradouro := 'Rua teste2';
    lPessoa.Endereco.Add(lEndereco);

    lDAOPessoa.CreatePessoa(lPessoa);
    for I := 0 to Pred(lPessoa.Endereco.Count) do
    begin

    end;
  finally
    lPessoa.DisposeOf;
    lEndereco.DisposeOf;
    lDAOPessoa.DisposeOf;
  end;
end;


//begin
//  lPessoa := TPessoa.Create;
//  try
//    lPessoa.Id := 1;
//    lPessoa.Nome := 'João';
//
//    lEndereco := TEndereco.Create;
//    lEndereco.id := 1;
//    lEndereco.IdPessoa := lPessoa.Id;
//    lEndereco.Logradouro := 'Rua teste1';
//    lPessoa.Endereco.Add(lEndereco);
//
//    lEndereco := TEndereco.Create;
//    lEndereco.id := 2;
//    lEndereco.IdPessoa := lPessoa.Id;
//    lEndereco.Logradouro := 'Rua teste2';
//    lPessoa.Endereco.Add(lEndereco);
//
//    Memo1.Lines.Add('id: '+ lPessoa.Id.ToString);
//    Memo1.Lines.Add('Nome: '+ lPessoa.Nome);
//
//    Memo1.Lines.Add('-----');
//    for I := 0 to Pred(lPessoa.Endereco.Count) do
//    begin
//      Memo1.Lines.Add('id: '+ lPessoa.Endereco[I].Id.ToString);
//      Memo1.Lines.Add('idPessoa: '+ lPessoa.Endereco[I].IdPessoa.ToString);
//      Memo1.Lines.Add('Logradouro: '+ lPessoa.Endereco[I].Logradouro);
//      Memo1.Lines.Add('-----');
//    end;
//  finally
//    lPessoa.DisposeOf;
//    lEndereco.DisposeOf;
//  end;
//end;

end.
