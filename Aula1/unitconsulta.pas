unit UnitConsulta;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, DBGrids;

type

  { TFormConsulta }

  TFormConsulta = class(TForm)
    ButtonConsNome: TButton;
    ButtonConsData: TButton;
    ButtonConsCidade: TButton;
    DateInicio: TDateTimePicker;
    DateFim: TDateTimePicker;
    DBGridConsulta: TDBGrid;
    EditNome: TEdit;
    EditCidade: TEdit;
    LabelNome: TLabel;
    LabelNascimento: TLabel;
    LabelNascimento2: TLabel;
    LabelCidade: TLabel;
    PanelConsulta: TPanel;
    procedure ButtonConsCidadeClick(Sender: TObject);
    procedure ButtonConsDataClick(Sender: TObject);
    procedure ButtonConsNomeClick(Sender: TObject);
  private

  public

  end;

var
  FormConsulta: TFormConsulta;

implementation
uses unitData;
{$R *.lfm}

{ TFormConsulta }

procedure TFormConsulta.ButtonConsDataClick(Sender: TObject);
begin
  with DataModule1.ZReadOnlyQueryConsulta do begin
    Close();
    sql.clear();
    SQL.Add('SELECT co.id_contato AS ID,');
    SQL.Add('co.nome_contato AS Nome,');
    SQL.Add('co.data_nascimento AS Nascimento,');
    SQL.Add('ci.den_cidade AS Cidade');
    SQL.Add('FROM contato AS co,');
    SQL.Add('cidade AS ci');
    SQL.Add('WHERE co.id_cidade = ci.id_cidade');
    SQL.Add('AND co.data_nascimento BETWEEN :inicio AND :fim');
    ParamByName('inicio').AsDate:=DateInicio.Date;
    ParamByName('fim').AsDate:=DateFim.Date;
    Open();
  end;
end;

procedure TFormConsulta.ButtonConsCidadeClick(Sender: TObject);
begin
  with DataModule1.ZReadOnlyQueryConsulta do begin
    Close();
    SQL.Clear();
    SQL.Add('SELECT co.id_contato AS ID,');
    SQL.Add('co.nome_contato AS Nome,');
    SQL.Add('co.data_nascimento AS Nascimento,');
    SQL.Add('ci.den_cidade AS Cidade');
    SQL.Add('FROM contato AS co,');
    SQL.Add('cidade AS ci');
    SQL.Add('WHERE co.id_cidade = ci.id_cidade');
    SQL.Add('AND ci.den_cidade LIKE ' + QuotedStr('%' + EditCidade.Text + '%'));
    Open();
  end;
end;

procedure TFormConsulta.ButtonConsNomeClick(Sender: TObject);
begin
  with DataModule1.ZReadOnlyQueryConsulta do begin
    Close();
    SQL.Clear();
    SQL.Add('SELECT co.id_contato AS ID,');
    SQL.Add('co.nome_contato AS Nome,');
    SQL.Add('co.data_nascimento AS Nascimento,');
    SQL.Add('ca.den_categoria AS Categoria');
    SQL.Add('FROM contato AS co,');
    SQL.Add('categoria AS ca');
    SQL.Add('WHERE co.id_categoria = ca.id_categoria');
    SQL.Add('AND co.nome_contato LIKE ' + QuotedStr('%' + EditNome.Text + '%'));
    Open();
  end;
end;

end.

