//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

const int COLUMNS=2; //Число столбцов таблицы
String ColumnHeaders[COLUMNS] = { "Фамилия", "Показатель" }; //Заголовки столбцов
String SortModeStr[COLUMNS] = { "v", "^" }; //Метки режима сортировки по столбцу
int SortMode = 0; //Флажок режима сортировки - не выбрано
int MaxLen[COLUMNS] = { 30, 8 }; //Максимальные длины текста в столбцах

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormResize(TObject *Sender)
{
 Panel1->ClientWidth = 250;
 StringGrid1->ClientWidth = Form1->ClientWidth - Panel1->ClientWidth;
 StringGrid1->Left = 0; Panel1->Left = StringGrid1->ClientWidth+1;
 Panel1->Top = 0; StringGrid1->Top = 0;
 Panel1->ClientHeight = Form1->ClientHeight;
 StringGrid1->ClientHeight = Form1->ClientHeight;
 StringGrid1->ClientWidth = Form1->ClientWidth - Panel1->ClientWidth;
 StringGrid1->ColWidths[1]=100;
 StringGrid1->ColWidths[0]= StringGrid1->ClientWidth - StringGrid1->ColWidths[1] - 24;
  //Место справа оставим на возможную вертикальную прокрутку
 for (int i=0;i<Form1->ComponentCount; i++) {
  TComponent* tmp = Form1->Components[i];
  String CName = String(tmp->ClassName());
  if (CName == "TButton") {
   TButton *bt1 =static_cast<TButton*>(FindComponent(tmp->Name));
   bt1->Left = (Panel1->ClientWidth - bt1->ClientWidth) / 2;
  }
  else if (CName == "TEdit") {
   TEdit *bt1 =static_cast<TEdit*>(FindComponent(tmp->Name));
   bt1->Left = (Panel1->ClientWidth - bt1->ClientWidth) / 2;
  }
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::StringGrid1SelectCell(TObject *Sender, int ACol,
      int ARow, bool &CanSelect)
{
 if (ARow==0) StringGrid1->Options >> goEditing;
 else StringGrid1->Options << goEditing;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::StringGrid1DrawCell(TObject *Sender, int ACol,
      int ARow, TRect &Rect, TGridDrawState State)
{
if (ARow==0) {
 StringGrid1->Canvas->Brush->Color = clYellow;
 StringGrid1->Canvas->FillRect(Rect);
 DrawText(StringGrid1->Canvas->Handle,StringGrid1->Cells[ACol][0].c_str(),-1,&Rect,DT_CENTER|DT_VCENTER|DT_SINGLELINE);
}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
 int Row = StringGrid1->Row, r, c;
 StringGrid1->RowCount++;
 for (r=StringGrid1->RowCount-1; r>Row+1; r--)
 for (c=0; c<COLUMNS; c++) {
  StringGrid1->Cells[c][r] = StringGrid1->Cells[c][r-1];
  StringGrid1->Cells[c][r-1]="";
 }
 if (StringGrid1->Row+1 < StringGrid1->RowCount) StringGrid1->Row++;
 StringGrid1->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
 int Row = StringGrid1->Row, r, c;
 if (Row>0) {
  for (r=Row+1; r<StringGrid1->RowCount; r++)
  for (c=0; c<COLUMNS; c++) {
   StringGrid1->Cells[c][r-1]=StringGrid1->Cells[c][r];
  }
  for (c=0; c<COLUMNS; c++) StringGrid1->Cells[c][StringGrid1->RowCount-1]="";
  StringGrid1->RowCount--;
  if(StringGrid1->Row>StringGrid1->RowCount-1) StringGrid1->Row=StringGrid1->RowCount-1;
 }
 else StringGrid1->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::StringGrid1SetEditText(TObject *Sender, int ACol,
      int ARow, const AnsiString Value)
{
 if (StringGrid1->Cells[ACol][ARow].Length() > MaxLen[ACol]) {
  StringGrid1->Cells[ACol][ARow] = StringGrid1->Cells[ACol][ARow].SubString(1,MaxLen[ACol]);
 }
}
//---------------------------------------------------------------------------

void SortGrid(TStringGrid *SG, int Column, int Mode) {
 int MinRowId, RowId1, RowId2, ColId;
 String Temp1, Temp2;
 for (RowId1=1; RowId1<SG->RowCount - 1;RowId1++) {
   Temp1 = SG->Cells[Column][RowId1];
   MinRowId = RowId1;
   for (RowId2=RowId1 + 1;RowId2<SG->RowCount;RowId2++) {
     Temp2 = SG->Cells[Column][RowId2];
     if (Mode==1 && Temp2 < Temp1 || Mode==2 && Temp2 > Temp1) {
       Temp1 = SG->Cells[Column][RowId2];
       MinRowId = RowId2;
     }
   }
   for (ColId= 0; ColId<SG->ColCount; ColId++) {
     Temp2 = SG->Cells[ColId][RowId1];
     SG->Cells[ColId][RowId1] = SG->Cells[ColId][MinRowId];
     SG->Cells[ColId][MinRowId] = Temp2;
    }
  }
}

void __fastcall TForm1::StringGrid1DblClick(TObject *Sender)
{
int Col = StringGrid1->Selection.Left;
int Row = StringGrid1->Selection.Top;
if (Row==0) {
 SortMode = (SortMode==1?2:1);
 StringGrid1->Cells[Col][0]= ColumnHeaders[Col]+" "+ SortModeStr[SortMode-1];
 for (int c=0; c<COLUMNS; c++) if(c!=Col)
 StringGrid1->Cells[c][0]= ColumnHeaders[c];
 if (StringGrid1->RowCount>2) {
  SortGrid(StringGrid1, Col, SortMode);
  StringGrid1->Refresh();
 }
}

}
//---------------------------------------------------------------------------
String LowCase (String s) {
 String Upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ";
 String Lower = "abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя";
 String s2="",subs;
 int pos;
 for (int i=1; i<=s.Length(); i++) {
  subs = s.SubString(i,1);
  pos = Upper.Pos(subs);
  s2+=pos>0?Lower.SubString(pos,1):subs;
 }
 return s2;
}

void __fastcall TForm1::Button3Click(TObject *Sender)
{
int r,c,Row=StringGrid1->Row,found=0;
if (StringGrid1->RowCount>0) {
 String FindStr = LowCase (Edit1->Text);
 for (r=Row+1; r<StringGrid1->RowCount; r++)
 for (c=0; c<StringGrid1->ColCount; c++) {
  if (LowCase(StringGrid1->Cells[c][r]).Pos(FindStr)>0) {
   StringGrid1->Row=r;
   StringGrid1->Col=c;
   StringGrid1->SetFocus();
   found=1;
   goto out_label;
  }
 }
 out_label:
 if (!found) ShowMessage ("Не найдено!");
}
else ShowMessage ("Таблица пуста, поиск невозможен!");
}
//---------------------------------------------------------------------------

void ClearTable (TStringGrid *StringGrid1) {
 for (int i=1;i<StringGrid1->RowCount; i++)
  StringGrid1->Rows[i]->Clear();
 StringGrid1->RowCount=1;
 StringGrid1->Row=0;
 StringGrid1->SetFocus();
}

void __fastcall TForm1::Button4Click(TObject *Sender)
{
if (MessageDlg("Вы уверены, что хотите очистить всю таблицу?",
 mtConfirmation	, TMsgDlgButtons() << mbOK << mbCancel, 0)==mrOk) {
 ClearTable(StringGrid1);
}
}
//---------------------------------------------------------------------------

#include <stdio.h>
void __fastcall TForm1::Button5Click(TObject *Sender)
{
SaveDialog1->DefaultExt="txt";
SaveDialog1->Filter="ASCII files (*.txt)|*.txt";
if(SaveDialog1->Execute()){
 if (ExtractFileExt(SaveDialog1->FileName).UpperCase()==".TXT") {
  FILE *fp=fopen(SaveDialog1->FileName.c_str(),"wt");
  if (fp){
   if (StringGrid1->RowCount>1)
   for (int i=1;i<StringGrid1->RowCount;i++) {
    fprintf(fp,"%s",StringGrid1->Rows[i]->CommaText.c_str());
    if (i<StringGrid1->RowCount-1) fprintf(fp,"\n");
   }
   fclose(fp);
  }
  else ShowMessage ("Не могу открыть файл на запись, проверьте допустимость имени и права");
 }
 else {
  ShowMessage ("Поддерживается сохранение только текстовых файлов!");
 }
}
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Button6Click(TObject *Sender)
{
const int maxlen = 128;
String str; str.SetLength(maxlen+1);
OpenDialog1->DefaultExt="txt";
OpenDialog1->Filter="ASCII files (*.txt)|*.txt";
if(OpenDialog1->Execute()){
 if (ExtractFileExt(OpenDialog1->FileName).UpperCase()==".TXT") {
  FILE *fp=fopen(OpenDialog1->FileName.c_str(),"rt");
  if (fp){
   ClearTable(StringGrid1);
   int i=1;
   while (1) {
    fgets(str.c_str(),maxlen,fp);
    if (str.Length()>0) {
     StringGrid1->RowCount++;
     StringGrid1->Rows[i++]->CommaText = str;
    }
    if (feof(fp)) break;
   }
   fclose(fp);
  }
  else ShowMessage ("Не могу открыть файл на чтение, проверьте допустимость имени и права");
 }
 else {
  ShowMessage ("Поддерживается чтение только текстовых файлов!");
 }
}

}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
for (int c=0; c<COLUMNS; c++) {
 StringGrid1->Cells[c][0] =  ColumnHeaders[c];
}
}
//---------------------------------------------------------------------------

