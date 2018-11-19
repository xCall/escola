program agenda;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, fprincipal, dprincipal, fcadcidade,
  fcadcategoria, fcadcontato, fconsulta
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TDataPrincipal, DataPrincipal);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadCidade, FormCadCidade);
  Application.CreateForm(TFormCadCategoria, FormCadCategoria);
  Application.CreateForm(TFormCadContato, FormCadContato);
  Application.CreateForm(TFormConsulta, FormConsulta);
  Application.Run;
end.

