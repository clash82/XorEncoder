{
  XorEncoder
  simple XOR algorithm implementation
  author: Rafa³ Toborek
  http://toborek.info
  http://github.com/clash82/XorEncoder
}

program xorEncoder;

uses
  Forms,
  main in 'main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
