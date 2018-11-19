unit fcadcontato;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, DBGrids;

type

  { TFormCadContato }

  TFormCadContato = class(TForm)
    DBDateNascimento: TDBDateTimePicker;
    DBEditBairro: TDBEdit;
    DBEditEndereco: TDBEdit;
    DBEditID: TDBEdit;
    DBEditIDCategoria: TDBEdit;
    DBEditIDCidade: TDBEdit;
    DBEditNome: TDBEdit;
    DBGridTelefone: TDBGrid;
    DBLookupCategoria: TDBLookupComboBox;
    DBLookupCidade: TDBLookupComboBox;
    DBNavContato: TDBNavigator;
    DBNavTelefones: TDBNavigator;
    GroupBoxTelefone: TGroupBox;
    GroupBoxContato: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormCadContato: TFormCadContato;

implementation

uses dprincipal;

{$R *.lfm}

end.

