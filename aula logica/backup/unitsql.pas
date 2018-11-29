unit unitsql;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    DataSourceCategoria: TDataSource;
    DataSourceCidade: TDataSource;
    ZConPrincipal: TZConnection;
    ZQueryCidade: TZQuery;
    ZTableCategoria: TZTable;
    ZUpdateCidade: TZUpdateSQL;
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

