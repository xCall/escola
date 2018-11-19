unit fconsulta;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBGrids;

type

  { TFormConsulta }

  TFormConsulta = class(TForm)
    ButtonConsultarNome: TButton;
    ButtonConsultarNascimento: TButton;
    ButtonConsultarCidade: TButton;
    DateInicio: TDateTimePicker;
    DateFim: TDateTimePicker;
    DBGridConsulta: TDBGrid;
    EditNome: TEdit;
    EditCidade: TEdit;
    GroupBoxOpcoes: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure ButtonConsultarCidadeClick(Sender: TObject);
    procedure ButtonConsultarNascimentoClick(Sender: TObject);
    procedure ButtonConsultarNomeClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormConsulta: TFormConsulta;

implementation

uses dprincipal;

{$R *.lfm}

{ TFormConsulta }

procedure TFormConsulta.ButtonConsultarNomeClick(Sender: TObject);
begin
  with dataPrincipal.ZRQueryConsulta do begin
    Close();
    SQL.Clear();
    SQL.Add('SELECT co.id_contato AS ID,');
    SQL.Add('       co.nome_contato AS Nome,');
    SQL.Add('       co.data_nascimento AS Nascimento,');
    SQL.Add('       ca.den_categoria AS Categoria');
    SQL.Add('FROM contato AS co,');
    SQL.Add('     categoria AS ca');
    SQL.Add('WHERE co.id_categoria = ca.id_categoria');
    SQL.Add('AND co.nome_contato LIKE ' + QuotedStr('%' + EditNome.Text + '%'));
    Open();
  end;
end;

procedure TFormConsulta.ButtonConsultarNascimentoClick(Sender: TObject);
begin
  with dataPrincipal.ZRQueryConsulta do begin
    Close();      // Fecha uma possível consulta aberta
    SQL.Clear();  // Limpa se houver qualquer instrução SQL
    SQL.Add('SELECT co.id_contato AS ID,');
    SQL.Add('       co.nome_contato AS Nome,');
    SQL.Add('       co.data_nascimento AS Nascimento,');
    SQL.Add('       ci.den_cidade AS Cidade');
    SQL.Add('FROM contato AS co,');
    SQL.Add('     cidade AS ci');
    SQL.Add('WHERE co.id_cidade = ci.id_cidade');
    SQL.Add('AND co.data_nascimento BETWEEN :inicio AND :fim');
    ParamByName('inicio').AsDate:=DateInicio.Date;
    ParamByName('fim').AsDate:=DateFim.Date;
    Open();
  end;
end;

procedure TFormConsulta.ButtonConsultarCidadeClick(Sender: TObject);
begin
  with dataPrincipal.ZRQueryConsulta do begin
    Close();
    SQL.Clear();
    SQL.Add('SELECT co.id_contato AS ID,');
    SQL.Add('       co.nome_contato AS Nome,');
    SQL.Add('       co.data_nascimento AS Nascimento,');
    SQL.Add('       ci.den_cidade AS Cidade');
    SQL.Add('FROM contato AS co,');
    SQL.Add('     cidade AS ci');
    SQL.Add('WHERE co.id_cidade = ci.id_cidade');
    SQL.Add('AND ci.den_cidade LIKE ' + QuotedStr('%' + EditCidade.Text + '%'));
    Open();
  end;
end;

end.

