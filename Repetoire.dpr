program Repetoire;

uses
  Forms,
  repertoire in 'repertoire.pas' {Form1},
  data_repertoire in 'data_repertoire.pas' {Data: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TData, Data);
  Application.Run;
end.
