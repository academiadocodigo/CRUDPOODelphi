unit CRUDPOO.DAO.Pessoa;

interface

uses
  CRUDPOO.Model.Pessoa, CRUDPOO.Model.Connection;

type
  TDAOPessoa = class
  private
    FConnection : TConnection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CreatePessoa(aValue : TPessoa);
  end;

implementation

{ TDAOPessoa }

constructor TDAOPessoa.Create;
begin
  FConnection := TConnection.Create(nil);
end;

procedure TDAOPessoa.CreatePessoa(aValue: TPessoa);
var
  lSQL : String;
  I: Integer;
begin
  FConnection.StartTransation;
  try
    lSQL := 'insert into pessoa values (?, ?)';
    FConnection.PrepareStatement(lSQL);
    FConnection.SetValue(0, aValue.Id);
    FConnection.SetValue(1, aValue.Nome);
    FConnection.ExecSQL;

    lSQL := '';
    for I := 0 to Pred(aValue.Endereco.Count) do
    begin
      lSQL := 'insert into endereco values (?, ?, ?)';
      FConnection.PrepareStatement(lSQL);
      FConnection.SetValue(0,aValue.Endereco[I].Id);
      FConnection.SetValue(1,aValue.Id);
      FConnection.SetValue(2,aValue.Endereco[I].Logradouro);
      FConnection.ExecSQL;
    end;

    FConnection.Commit;
  except
    FConnection.Rollback;
  end;
end;

destructor TDAOPessoa.Destroy;
begin
  FConnection.DisposeOf;
  inherited;
end;

end.
