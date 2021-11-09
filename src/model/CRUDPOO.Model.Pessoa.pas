unit CRUDPOO.Model.Pessoa;

interface

uses
  CRUDPOO.Model.Endereco,
  System.Generics.Collections;

type
  TPessoa = class
  private
    Fid: Integer;
    Fnome: String;
    FEndereco: TList<TEndereco>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id : Integer read Fid write FId;
    property Nome : String read Fnome write Fnome;
    property Endereco : TList<TEndereco> read FEndereco write FEndereco;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  FEndereco:= TList<TEndereco>.Create;
end;

destructor TPessoa.Destroy;
begin
  FEndereco.DisposeOf;
  inherited;
end;

end.
