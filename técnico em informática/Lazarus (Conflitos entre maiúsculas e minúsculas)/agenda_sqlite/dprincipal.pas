unit dprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate, ZSequence;

type

  { TDataPrincipal }

  TDataPrincipal = class(TDataModule)
    SourceConsulta: TDataSource;
    SourceContato: TDataSource;
    SourceTelefone: TDataSource;
    SourceCategoria: TDataSource;
    SourceCidade: TDataSource;
    ZConPrincipal: TZConnection;
    ZQueryContato: TZQuery;
    ZQueryTelefone: TZQuery;
    ZQueryCidade: TZQuery;
    ZRQueryConsulta: TZReadOnlyQuery;
    ZTableCategoria: TZTable;
    ZUpdateCidade: TZUpdateSQL;
    ZUpdateContato: TZUpdateSQL;
    ZUpdateTelefone: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataPrincipal: TDataPrincipal;

implementation

{$R *.lfm}

{ TDataPrincipal }

procedure TDataPrincipal.DataModuleCreate(Sender: TObject);
var
  DBDir, DBName: String;
begin
  DBDir := ExtractFilePath(Application.ExeName);
  DBName := DBDir + DirectorySeparator + 'agenda.db';
  ZConPrincipal.Database := DBName;
  ZConPrincipal.Connect();
  ZTableCategoria.Open();
  ZQueryCidade.Open();
  ZQueryContato.Open();
  ZQueryTelefone.Open();
end;

end.

