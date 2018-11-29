unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TformInicio }

  TformInicio = class(TForm)
    buttonCotatos: TButton;
    buttonCidade: TButton;
    ButtonCategorias: TButton;
    buttonConsultas: TButton;
  private

  public

  end;

var
  formInicio: TformInicio;

implementation

{$R *.lfm}

end.

