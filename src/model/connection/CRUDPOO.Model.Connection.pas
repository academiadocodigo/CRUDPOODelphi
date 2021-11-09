unit CRUDPOO.Model.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PrepareStatement(aSQL: String);
    procedure SetValue(aIndex: Integer; aValue: Variant);
    procedure ExecSQL;
    procedure StartTransation;
    procedure Commit;
    procedure Rollback;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TConnection.Commit;
begin
  FDConnection.Commit;
end;

procedure TConnection.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Connected := true;
end;

procedure TConnection.ExecSQL;
begin
  FDQuery.ExecSQL;
end;

procedure TConnection.PrepareStatement(aSQL: String);
begin
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(aSQL);
end;

procedure TConnection.Rollback;
begin
  FDConnection.Rollback;
end;

procedure TConnection.SetValue(aIndex: Integer; aValue: Variant);
begin
  FDQuery.Params.Add;
  FDQuery.Params[aIndex].Value := aValue;
end;

procedure TConnection.StartTransation;
begin
  FDConnection.StartTransaction;
end;

end.
