unit unitMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormMenu }

  TFormMenu = class(TForm)
    ButtonContatos: TButton;
    ButtonCidade: TButton;
    ButtonCategoria: TButton;
    ButtonConsultas: TButton;
    procedure ButtonCategoriaClick(Sender: TObject);
    procedure ButtonCidadeClick(Sender: TObject);
    procedure ButtonContatosClick(Sender: TObject);
  private

  public

  end;

var
  FormMenu: TFormMenu;

implementation
uses unitCidades,UnitCategorias,unitContatos;
{$R *.lfm}

{ TFormMenu }

procedure TFormMenu.ButtonCidadeClick(Sender: TObject);
begin
   FormCidades.showmodal;
end;

procedure TFormMenu.ButtonContatosClick(Sender: TObject);
begin
  FormContatos.showmodal;
end;

procedure TFormMenu.ButtonCategoriaClick(Sender: TObject);
begin
  FormCategorias.showmodal;
end;

end.

