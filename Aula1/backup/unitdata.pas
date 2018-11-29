unit unitData;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    DataSourceTelefone: TDataSource;
    DataSourceContato: TDataSource;
    DataSourceCidades: TDataSource;
    DataSourceCategoria: TDataSource;
    ZConnectionPrincipal: TZConnection;
    ZQueryTelefone: TZQuery;
    ZQueryContato: TZQuery;
    ZQueryCidade: TZQuery;
    ZTableCategoria: TZTable;
    ZUpdateTelefone: TZUpdateSQL;
    ZUpdateSQLContato: TZUpdateSQL;
    ZUpdateSQLCidades: TZUpdateSQL;
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

