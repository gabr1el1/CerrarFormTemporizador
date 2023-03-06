unit FormTimerClose;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TfrmOnTimerClose = class(TForm)
    lblMessage: TLabel;
    btnYes: TButton;
    btnNo: TButton;
    tmrTimeOut: TTimer;
    procedure FormShow(Sender: TObject);
    procedure tmrTimeOutTimer(Sender: TObject);
    procedure Salir(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    seconds:integer;
  end;

var
  frmOnTimerClose: TfrmOnTimerClose;

implementation

{$R *.fmx}

uses FormMain;

procedure TfrmOnTimerClose.btnNoClick(Sender: TObject);
begin
  Salir(btnNo);
end;

procedure TfrmOnTimerClose.btnYesClick(Sender: TObject);
begin
  Salir(btnYes);
end;

procedure TfrmOnTimerClose.FormShow(Sender: TObject);
begin
  btnNo.Text := 'No';
  seconds := 5;
  tmrTimeOut.Enabled := true;
end;



procedure TfrmOnTimerClose.tmrTimeOutTimer(Sender: TObject);
  begin
  btnNo.Text := Format('No (%d)', [seconds]);
  dec(seconds); // seconds -= 1; (c++)
  if seconds < 0 then
  begin
    tmrtimeOut.Enabled := false;
    Salir(btnNo);
  end;
end;
procedure TfrmOnTimerClose. Salir(Sender: TObject);
begin
  // obtener el valor de ModalResult dependiendo de cual
  // botón se presionó (Yes o No), el boton yes está asociado
  // con mrClose
  ModalResult := (Sender as TButton).ModalResult;
  // ESCRIBA ACA SU LÓGICA PARA DECIDIR QUE HACER SI
  // EL USUARIO PRESIONA EL BOTON SI O EL BOTON NO
  case modalResult of
  mrNo:
  begin
  frmMain.CloseOk:=false;
  frmMain.notShow:=false;
  Close;
  end;
  mrClose:
  begin
  frmMain.CloseOk:=true;
  frmMain.notShow:=true;
  frmMain.Close;
  end;
  end;

end;

end.
