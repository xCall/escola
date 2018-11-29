unit unitCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls;

type

  { TFormCidades }

  TFormCidades = class(TForm)
    DBEditId: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditUf: TDBEdit;
    DBNavigatorCidades: TDBNavigator;
  private

  public

  end;

var
  FormCidades: TFormCidades;

implementation
uses unitData;
{$R *.lfm}

end.

