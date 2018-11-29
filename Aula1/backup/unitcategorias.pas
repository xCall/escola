unit UnitCategorias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  DBGrids;

type

  { TFormCategorias }

  TFormCategorias = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigatorCategorias: TDBNavigator;
  private

  public

  end;

var
  FormCategorias: TFormCategorias;

implementation
uses unitData;
{$R *.lfm}

end.

