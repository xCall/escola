unit fcadcidade;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls;

type

  { TFormCadCidade }

  TFormCadCidade = class(TForm)
    DBEditID: TDBEdit;
    DBEditDenCidade: TDBEdit;
    DBEditUF: TDBEdit;
    DBNavCidade: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormCadCidade: TFormCadCidade;

implementation

uses dprincipal;

{$R *.lfm}

end.

