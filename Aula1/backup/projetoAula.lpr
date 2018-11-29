program projetoAula;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, unitMenu, unitData, unitCidades,
  unitCategorias, unitContatos, unit1
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormCidades, FormCidades);
  Application.CreateForm(TFormCategorias, FormCategorias);
  Application.CreateForm(TFormContatos, FormContatos);
  Application.CreateForm(TFormConsulta, FormConsulta);
  Application.Run;
end.

