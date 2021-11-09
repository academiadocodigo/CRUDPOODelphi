unit CRUDPOO.Model.Endereco;

interface

type
  TEndereco = class
  private
    FLogradouro: String;
    Fid: Integer;
    FIdPessoa: Integer;
  public
    property Id : Integer read Fid write FId;
    property IdPessoa : Integer read FIdPessoa write FIdPessoa;
    property Logradouro : String read FLogradouro write FLogradouro;
  end;

implementation

end.
