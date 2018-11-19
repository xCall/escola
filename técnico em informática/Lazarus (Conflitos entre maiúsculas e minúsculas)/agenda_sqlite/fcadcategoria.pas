unit fcadcategoria;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls;

type

  { TFormCadCategoria }

  TFormCadCategoria = class(TForm)
    DBGrid1: TDBGrid;
    DBNavCategoria: TDBNavigator;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormCadCategoria: TFormCadCategoria;

implementation

uses dprincipal;

{$R *.lfm}

end.

