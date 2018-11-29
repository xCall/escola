unit unitContatos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtDlgs, DbCtrls, ExtCtrls, DBGrids;

type

  { TFormContatos }

  TFormContatos = class(TForm)
    DBDateTimePickerNascimento: TDBDateTimePicker;
    DBEditCidade: TDBEdit;
    DBEditBairro: TDBEdit;
    DBEditEndereco: TDBEdit;
    DBEditCategoria: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditId: TDBEdit;
    DBGridTelefone: TDBGrid;
    DBLookupComboBoxCategoria: TDBLookupComboBox;
    DBLookupComboBoxCidade: TDBLookupComboBox;
    DBNavigatorTelefone: TDBNavigator;
    DBNavigatorContato: TDBNavigator;
    LabelId: TLabel;
    LabelNome: TLabel;
    LabelNascimento: TLabel;
    LabelCategoria: TLabel;
    LabelEndereco: TLabel;
    LabelBairro: TLabel;
    LabelCidade: TLabel;
    PanelPrincipal: TPanel;
  private

  public

  end;

var
  FormContatos: TFormContatos;

implementation
uses unitData;
{$R *.lfm}

end.

