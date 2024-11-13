unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,uMyTranslation;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ObstEdit: TEdit;
    Label1: TLabel;
    ObstListBox: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ObstListBoxClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var Obstliste: TStringList;
  i: Integer;
  s: String;
begin
  Obstliste:=TStringList.Create;
  Obstliste.Add(' Kiwi ');
  Obstliste.Add(' Apfel ');
  Obstliste.Add(' Birne ');
  Obstliste.Add(' Orange ');
  s:='';
  for i:=0 to Obstliste.Count-1 do
  s:=s+Obstliste[i]+#13+'---------'+#13;
  ShowMessage(s);
  ShowMessage('Erstes Element!'+Obstliste[0]);
  Obstliste.Delete(0);
  ShowMessage('Zweites Element!'+Obstliste[0]);
  Obstliste.Clear;
  if Obstliste.Count=0
  then ShowMessage('Liste ist leer!')
  else ShowMessage('Erstes Element'+ObstListe[0]);
  Obstliste.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,Anzahl: Integer;
  Obst:String;
begin
  ObstListBox.Items.Add(' Kiwi  ');
  ObstListBox.Items.Add(' Apfel ');
  ObstListBox.Items.Add(' Birne ');
  ObstListBox.Items.Add(' Orange ');
  ObstListBox.items.insert(1,'Kirsche');
  Obst:=ObstEdit.Text;
  if ObstListBox.Items.IndexOf(Obst)=-1
  then ObstListBox.Items.Add(Obst)
  else ShowMessage(Obst+'ist schon vorhanden');
  ObstListBox.Items.SaveToFile('H:Dokumente\obst.txt');
  Anzahl:=ObstListBox.Items.Count;
  ShowMessage(' Anzahl: '+InTToStr(Anzahl));
  ShowMessage('weiter');
  ObstListBox.Items.Delete(0);
  ShowMessage('weiter');
  if MessageDlg('Willst Du alles löschen?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  if MessageDlg('Bist du dir sicher?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
  ObstListBox.Items.Clear;
  ShowMessage('Es wurde alles gelöscht!');
  end;
  end;

if MessageDlg('Willst du die Daten alle laden?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  ObstListBox.Items.LoadFromFile('H:\Dokumente\obst.txt');
  ShowMessage('Dateien wurden geladen!');
  ShowMessage('Jetzt wird sortiert...');
  ObstListBox.Sorted := True;
end;


end;

procedure TForm1.ObstListBoxClick(Sender: TObject);
var Index: Integer;
begin
Index:=ObstListBox.ItemIndex;
ShowMessage('Gewaehlte Position: '+IntToStr(Index));
end;

end.

