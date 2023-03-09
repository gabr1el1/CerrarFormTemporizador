unit FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation;

type
  TfrmMain = class(TForm)
    tlbHeader: TToolBar;
    memLog: TMemo;
    lblInfo: TLabel;
    btnExit: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CloseOk:boolean;
    notShow:boolean;
  end;

var
  frmMain: TfrmMain;


implementation

{$R *.fmx}

uses FormTimerClose;


procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frmOnTimerClose.Show;
  CanClose:=CloseOk;
end;

end.
