unit unitcadastrocidade;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls;

type

  { TFormCadastroCidades }

  TFormCadastroCidades = class(TForm)
    DBEditUf: TDBEdit;
    DBEditCidade: TDBEdit;
    DBEditId: TDBEdit;
    DBNavCidade: TDBNavigator;
    LabelId: TLabel;
    LabelCidade: TLabel;
    LabelUf: TLabel;
  private

  public

  end;

var
  FormCadastroCidades: TFormCadastroCidades;

implementation
uses
  unitprincipal;

{$R *.lfm}

end.

