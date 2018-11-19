unit fprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    ButtonConsultas: TButton;
    ButtonCadCidade: TButton;
    ButtonCadCategoria: TButton;
    ButtonCadContato: TButton;
    procedure ButtonCadCategoriaClick(Sender: TObject);
    procedure ButtonCadCidadeClick(Sender: TObject);
    procedure ButtonCadContatoClick(Sender: TObject);
    procedure ButtonConsultasClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses fcadcidade, fcadcategoria, fcadcontato, fconsulta;

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.ButtonCadCidadeClick(Sender: TObject);
begin
  FormCadCidade.ShowModal();
end;

procedure TFormPrincipal.ButtonCadContatoClick(Sender: TObject);
begin
  FormCadContato.ShowModal();
end;

procedure TFormPrincipal.ButtonConsultasClick(Sender: TObject);
begin
  FormConsulta.ShowModal();
end;

procedure TFormPrincipal.ButtonCadCategoriaClick(Sender: TObject);
begin
  FormCadCategoria.ShowModal();
end;

end.

