program ProjectLP;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
