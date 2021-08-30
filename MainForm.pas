unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.Samples.Spin, Vcl.StdCtrls, Vcl.ExtCtrls, VCLTee.TeeProcs,
  VCLTee.Chart, Math;

type
  TFMain = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    btnGenerate: TButton;
    btnAuto: TButton;
    Chart1: TChart;
    Chart2: TChart;
    ListBox1: TListBox;
    ListBox2: TListBox;
    SpinEdit1: TSpinEdit;
    btnClose: TButton;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Label8: TLabel;
    Label9: TLabel;
    btnClear: TButton;
    Chart3: TChart;
    Series3: TLineSeries;
    procedure btnCloseClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    function realwave(a,b,c: integer):real;
    procedure btnAutoClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  a1, a2, a3, f1, f2, f3, n: integer;
  thewave, auto, error, temp, alphajadi, pre : array [0..1000] of real;
  alpha :array [0..1000,0..1000] of real;
  FMain: TFMain;

implementation

{$R *.dfm}
function TFMain.realwave(a: Integer; b: Integer; c: Integer):real;
var y: real;
begin
  y := a*sin(2*pi*b*c/n);
  result := y;
end;

procedure TFMain.btnGenerateClick(Sender: TObject);
var i: integer;
begin
  Series1.Clear; Series2.Clear; Series3.Clear;
  a1 := strtoint(Edit1.Text);
  f1 := strtoint(Edit2.Text);
  a2 := strtoint(Edit3.Text);
  f2 := strtoint(Edit4.Text);
  a3 := strtoint(Edit5.Text);
  f3 := strtoint(Edit6.Text);
  n  := strtoint(Edit7.Text);

  for i := 1 to n-1 do
  begin
    thewave[i] := realwave(a1,f1,i) + realwave(a2,f2,i) + realwave(a3,f3,i);
    Series1.AddXY(i,thewave[i]);
  end;
end;

procedure TFMain.btnAutoClick(Sender: TObject);
var i,j: integer;
begin
  for i := 0 to n-1 do
  begin
    for j := 0 to (n-1-i) do
    begin
      auto[i] := auto[i] + (thewave[j]*thewave[i+j])/n;
    end;
    Series2.AddXY(i,auto[i]);
  end;
end;

procedure TFMain.SpinEdit1Change(Sender: TObject);
var
  i, j, k: integer;
begin
  Listbox1.Clear;
  Listbox2.Clear;
  Series3.Clear;

  k := SpinEdit1.Value;
  error[0] := auto[0];
  for i := 1 to k do
  begin
    temp[i] := 0;
    for j := 1 to i-1 do
    begin
      temp[i] := temp[i] - alpha[i-1,j]*auto[i-j];
    end;

    temp[i] := (auto[i] + temp[i])/error[i-1];
    alpha[i,i] := temp[i];

    if i>1 then
    begin
      for j := 1 to i-1 do
      begin
        alpha[i,j] := alpha[i-1,j] - temp[i]*alpha[i-1,i-j];
      end;
    end;
    error[i] := (1-sqr(temp[i]))*error[i-1];
    Listbox2.Items.Add('Error[' + inttostr(i) + '] = ' + floattostr(roundto(error[i],-2)));
  end;

  for i := 1 to k do
  begin
    alphajadi[i] := alpha[k,i];
    Listbox1.Items.Add(floattostr(roundto(alphajadi[i],-2)));
  end;

  for i := 1 to n do
  begin
    pre[i] := 0;
    for j := 1 to k do
    begin
      pre[i] := pre[i] + alphajadi[j]*thewave[i-j];
    end;
    Series3.AddXY(i,pre[i]);
  end;
end;

procedure TFMain.btnClearClick(Sender: TObject);
begin
  Series1.Clear; Series2.Clear; Series3.Clear;
  SpinEdit1.Value := 1;
  Edit1.Clear; Edit2.Clear; Edit3.Clear; Edit4.Clear; Edit5.Clear; Edit6.Clear; Edit7.Clear;
  Listbox1.Clear; Listbox2.Clear;
end;

procedure TFMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
