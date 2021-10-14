







// Проект АНТИМАТ 1.0
//
// Автор:  Горшенин Сергей,
//
// Обсудить: https://www.cyberforum.ru/blogs/1506633/




unit AntiMatUnit1;


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls, IniFiles, LazUTF8, StrUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    AddLetterBtn1: TButton;
    AddLineBtn: TButton;
    AddLetterBtn: TButton;
    ApplyBtn: TButton;
    Button1: TButton;
    CloseAboutPanelBtn: TButton;
    Button3: TButton;
    CloseWhiteBtn: TButton;
    DelWhiteBtn: TButton;
    DelWhiteWordLabel: TLabel;
    ImportToWhiteBtn: TButton;
    Label10: TLabel;
    Memo2: TMemo;
    AboutMemo: TMemo;
    Panel7: TPanel;
    AboutPanel: TPanel;
    ExportBtn: TButton;
    WhiteBtn: TButton;
    CancSavingBtn: TButton;
    CheckBtn: TButton;
    DelLetterBtn1: TButton;
    DelLetterLabel1: TLabel;
    Label9: TLabel;
    Panel6: TPanel;
    WhiteGrid: TStringGrid;
    WhitePanel: TPanel;
    StopStringEdit: TEdit;
    Grid3: TStringGrid;
    IntEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ClearMemTextBtn: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SelSlotPanel: TPanel;
    ResLabel: TLabel;
    ResMemo: TMemo;
    Slot1Btn: TButton;
    MemText: TButton;
    ImportBtn: TButton;
    ClearAllBtn: TButton;
    Label3: TLabel;
    Memo1: TMemo;
    Slot2Btn: TButton;
    Slot11Btn: TButton;
    Slot12Btn: TButton;
    Slot3Btn: TButton;
    Slot4Btn: TButton;
    Slot5Btn: TButton;
    Slot6Btn: TButton;
    Slot7Btn: TButton;
    Slot8Btn: TButton;
    Slot9Btn: TButton;
    Slot10Btn: TButton;
    TestMemo: TMemo;
    SavingPanel: TPanel;
    SaveLettBtn: TButton;
    SaveBtn: TButton;
    CheckBox1: TCheckBox;
    DelLetterLabel: TLabel;
    DelLetterBtn: TButton;
    Label2: TLabel;
    TimeEdit: TEdit;
    ExitSettingsBtn: TButton;
    Label1: TLabel;
    Panel2: TPanel;
    SettPanel: TPanel;
    SettingsBtn: TButton;
    DelLineBtn: TButton;
    DelLabel: TLabel;
    Panel1: TPanel;
    Grid1: TStringGrid;
    Grid2: TStringGrid;
    SaveTimer: TTimer;
    procedure AddLetterBtn1Click(Sender: TObject);
    procedure AddLetterBtnClick(Sender: TObject);
    procedure AddLineBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CloseAboutPanelBtnClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CloseWhiteBtnClick(Sender: TObject);
    procedure CancSavingBtnClick(Sender: TObject);
    procedure CheckBtnClick(Sender: TObject);     // ПРОВЕРИТЬ НА ОСКОРБИТЕЛЬНОСТЬ
    procedure ClearAllBtnClick(Sender: TObject);
    procedure DelLetterBtn1Click(Sender: TObject);
    procedure DelWhiteBtnClick(Sender: TObject);
    procedure DelLetterBtnClick(Sender: TObject);
    procedure DelLineBtnClick(Sender: TObject);
    procedure ExitSettingsBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure Grid2SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure Grid3SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure ImportBtnClick(Sender: TObject);    // ИМПОРТ
    procedure ClearMemTextBtnClick(Sender: TObject);
    procedure ImportToWhiteBtnClick(Sender: TObject);
    procedure IntBtnClick(Sender: TObject);
    procedure MemTextClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure SaveLettBtnClick(Sender: TObject);
    procedure SaveTimerTimer(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
    procedure SettingsBtnClick(Sender: TObject);
    procedure Grid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure Slot10BtnClick(Sender: TObject);
    procedure Slot11BtnClick(Sender: TObject);
    procedure Slot12BtnClick(Sender: TObject);
    procedure Slot1BtnClick(Sender: TObject);
    procedure Slot2BtnClick(Sender: TObject);
    procedure Slot3BtnClick(Sender: TObject);
    procedure Slot4BtnClick(Sender: TObject);
    procedure Slot5BtnClick(Sender: TObject);
    procedure Slot6BtnClick(Sender: TObject);
    procedure Slot7BtnClick(Sender: TObject);
    procedure Slot8BtnClick(Sender: TObject);
    procedure Slot9BtnClick(Sender: TObject);
    procedure TestMemoChange(Sender: TObject);
    function Translit(S: string): string;
    function Translit2(S: string): string;
    function ReTranslit2(S: string): string;
    procedure Sorting;   // СОРТИРОВКА перед проверкой текста на оскорбительность
    procedure SaveToSlot;
    procedure LoadFromSlot;
    function AntimatCheck(All:string): real;  // проверка текста на оскорбительность
    procedure WhiteBtnClick(Sender: TObject);
    procedure WhiteGridSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
  private

  public

  end;

var
  Form1: TForm1;
  LinesCount: integer;
  WhiteCount: integer;
  LineIs: integer;
  LetterLineIs: integer;
  LetterLinesCount: integer;
  Letter2LineIs: integer;
  Letter2LinesCount: integer;
  WhiteLineIs: integer;
  AntiMatFile: string;
  SlotsFile: string;
  ExportFile: string;
  SaveTime: integer;
  EmptyLine: integer;
  TMassR:array[1..1000] of string; // для ТРАНСЛИТА 1 - таблица перевода, русские символы
  TMassT:array[1..1000] of string; // для ТРАНСЛИТА 1 - таблица перевода, латиница
  TMassR2:array[1..1000] of string; // для ТРАНСЛИТА 2 - таблица перевода, русские символы
  TMassT2:array[1..1000] of string; // для ТРАНСЛИТА 2 - таблица перевода, латиница
  MAW1:array[1..10000] of string; // массив слов для сортировки
  MAW1osk:array[1..10000] of integer; // массив величин оскорбительности
  MAW2:array[1..10000] of string; // массив отсортированных слов
  MAW2osk:array[1..10000] of integer; // массив величин оскорбительности
  MAW3:array[1..10000] of integer; //  массив номеров найденных плохих слов из массива MAW2
  MAWhite:array[1..10000] of string; // массив слов "Белый список" переведённых в транслит
  MAWhiteBP:array[1..10000] of string; // массив слов "Белый список" переведённых в транслит БЕЗ ПРОБЕЛОВ
  MAL:array[1..10000] of integer; // массив длин несортированных слов массива MAW1
  MAH:array[1..10000] of boolean; // массив флагов присутствия букв BPYHCX у несортированных слов массива MAW1
  MAH2:array[1..10000] of boolean; // массив флагов присутствия букв BPYHCX у сортированных слов массива MAW2
  MAW1len: integer; // число слов в неотсортированном массиве
  MAW2len: integer; // число слов в отсортированном массиве
  MAW3len: integer; // число найденных плохих слов
  MAWhiteLen: integer; // длина Белого списка
  MAW2N: array[1..10000] of integer; // сколько раз встречается каждое плохое слово в анализируемом тексте
  MAW2WF: array[1..10000] of integer; // сколько раз плохое слово встретилось "с нулевым интервалом"
  MAW2Links: array[1..10000] of integer; // ссылки на чуть более короткое слово, которое есть в этом более длинном
  MemSlotFlag: boolean;
  SlotIs: integer;
  Interval: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.AddLineBtnClick(Sender: TObject);  //  ДОБАВИТЬ СТРОКУ В ТАБЛИЦУ
var
  i: integer;
begin
  i:=Grid1.RowCount;
  i:=i+1;
  LinesCount:=i;
  Grid1.RowCount:=i;
end;

procedure TForm1.ApplyBtnClick(Sender: TObject);
var
  i, k: integer;
  AM: TIniFile;
begin
  i:=10;
  if (TryStrToInt(TimeEdit.Text, k)) then i:=k;
  if (i<1) then i:=10;
  SaveTime:=i;
  SaveTimer.Interval:=SaveTime*1000;
  try
      AM := TIniFile.Create(AntiMatFile);
      with AM do
           begin
            WriteInteger ('config', 'AutoSaveTime', SaveTime);
           end;
      finally AM.Free;
     // except on Ex: Exception do
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.CloseAboutPanelBtnClick(Sender: TObject);
begin
    AboutPanel.Visible:=False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  AboutPanel.Visible:=True;
end;

procedure TForm1.CloseWhiteBtnClick(Sender: TObject);
begin
  WhitePanel.Visible:=False;
end;

procedure TForm1.CancSavingBtnClick(Sender: TObject);
begin
   SelSlotPanel.Visible:=False;
 MemSlotFlag:=false;
 CancSavingBtn.Visible:=false;
end;

procedure TForm1.CheckBtnClick(Sender: TObject);
var
  Ns: integer;
  i, j, k, m, nw: integer;
  du: integer;
  word1, tword1: string;
  line: string;
  tline: string;
  len: integer;
  lenWord: integer;
  tempLetter: string;
  povtor: boolean;
  All: string;
  AllLen: integer;
  wpos: integer;
  countw: integer;
  finded: boolean;
  MasPos: array[1..10000] of integer;
  tmp: string;
  coz, curr, lastpos, count1, FirstLetterPos, sum, res, lenW1: integer;
  letter: string;
  StopString: string;
  SumStops: integer;
  AddLetter: boolean;  // true если в интервале нет Стоп-Символов ( StopString )
  CutTxt: string;
  Result1, Result2: real;
  All2: string;
  DopString: string;
  RepString: string;
  letter2: string;

begin
  ResMemo.Clear;
  ResLabel.Caption:='РЕЗУЛЬТАТ = ??? %';

  AllLen:=Length(All);
  if (AllLen>10000) then ShowMessage('В тексте больше 10000 символов ('+IntToStr(AllLen)+'), программа на это не рассчитана, увеличьте число и перекомпилируйте программу. Строка:   MasPos: array[1..10000] of integer;');
  if (AllLen>10000) then Exit;


  StopString:=StopStringEdit.Text;
  TryStrToInt(IntEdit.text, Interval); // Интервал по умолчанию заносим в переменную
  All:='';        // в этой переменной будет весь текст транслитом_2 в одну строчку
  Ns:=TestMemo.Lines.Count;
//  ImportBtn.Caption:=IntToStr(Ns);
  if (Ns=0) then exit;
  ResMemo.Clear;
  for k:=1 to Ns do
    begin
     line:=TestMemo.Lines[k-1]+' ';
     len:=UTF8Length(line);
     if (len>0) then
      begin
        tline:=Translit2(line);
        ResMemo.Append(tline);
        All:=All+tline;
      end;
    end;
  ResMemo.Append('-------------------------------');

  Sorting;   //  вызов процедуры сортировки массива оскорбительных слов - сортировка по длине слова, от длинных к коротким выстраиваем

  Result1:=AntimatCheck(All);  // ПРОВЕРКА ТЕКСТА НА ОСКОРБИТЕЛЬНОСТЬ


  ResMemo.Append('В Чёрном Списке = '+IntToStr(MAW2len)+' слов');
  ResMemo.Append('   ');
  ResMemo.Append('РЕЗУЛЬТАТ = '+FloatToStr(Result1)+' %');

  ResLabel.Caption:='РЕЗУЛЬТАТ = '+IntToStr(Round(Result1))+' %  оскорбительности';

end;



function TForm1.AntimatCheck(All:string): real;
var
  Ns: integer;
  i, j, k, m, nw: integer;
  du: integer;
  word1, tword1: string;
  line: string;
  tline: string;
  len: integer;
  lenWord: integer;
  tempLetter: string;
  povtor: boolean;
//  All: string;
  AllLen: integer;
  wpos: integer;
  countw: integer;
  finded: boolean;
  MasPos: array[1..10000] of integer;
  tmp: string;
  coz, curr, lastpos, count1, FirstLetterPos, sum, res, lenW1: integer;
  letter: string;
  coz2: integer;
  letter2: string;
  StopString: string;
  SumStops: integer;
  AddLetter: boolean;  // true если в интервале нет Стоп-Символов ( StopString )
  CutTxt: string;
  LenLetters: integer; // длина текста для подсчитывания РЕЗУЛЬТАТА потом
  itogo: real;
  MeanLetters: string;
  tbool: boolean;
  sumint: integer; // сумма интервалов между буквами найденного плохого слова (если = 0, то надо проверить это слово по белому списку)
  delta: integer;
  LinkN: integer;
  RepsN: integer;
  NadoIsk: boolean;
  Provereno: integer;
  NumBadWord, NBW2: integer;
  NumNul: integer; // сколько раз это слово встретилось с нулевым интервалом
  WhiteWord: string;
  WhiteWordBP: string;  // белое слово без пробелов
  WC: integer; // счётчик найденных в тексте белых слов
  osk: integer;
begin
  Provereno:=0;
  Result:=0;
  itogo:=0;
  StopString:=StopStringEdit.Text;
  TryStrToInt(IntEdit.text, Interval); // Интервал по умолчанию заносим в переменную


  if (MAW2len=0) then ResLabel.Caption:='РЕЗУЛЬТАТ = Неизвестная ошибка массива оскорбительных слов';
  if (MAW2len=0) then exit;
  AllLen:=Length(All);

  MeanLetters:='';  // по каким буквам считать длину текста для подсчитывания РЕЗУЛЬТАТА потом
  for k:=1 to Letter2LinesCount do
     begin
      MeanLetters:=MeanLetters+TMassT2[k];
     end;

  LenLetters:=0;

  For i:=1 to Length(All) do  // сканируем текст - считаем число букв
     begin
      letter:=All[i];
      if (Pos(letter, MeanLetters)>0) then LenLetters:=LenLetters+1;  //  считаем число букв
     end;

   if (LenLetters=0) then exit; // LenLetters:=1;


   for i:=1 to MAW2len do
      begin
       MAW2N[i]:=0;  // очистkа старых записей
       MAW2WF[i]:=0; // очистkа старых записей
      end;

   // ------ далее начинаем искать оскорбительные слова -----------

   lastpos:=0; // бегунок по тексту ставим в начало
   for i:=MAW2len downto 1 do // MAW2len = число плохих слов в отсортированном массиве
     begin
       word1:=MAW2[i]; // берём плохое слово
       tbool:=MAH2[i]; // флаг наличия BPYHCX
       LinkN:=MAW2Links[i];
       NadoIsk:=true;
       if (LinkN>0) then
        begin
          if (MAW2N[LinkN]=0) then NadoIsk:=false; // более коротких не было
        end;
       if ((LinkN=0) or NadoIsk) then
        begin
         Provereno:=Provereno+1;  // счётчик реально проверенных слов
         repeat
         curr:=0;
         finded:=false;  // флаг "нашли / не нашли" ставим в исходное положение
         count1:=0;  // в этой переменной считаем сколько совпало первых букв найденного плохого слова (по совпадению всех сделаем вывод что нашли слово)
         sumint:=0;  // сумма интервалов между буквами найденного плохого слова (если = 0, то надо проверить это слово по белому списку)
         tmp:='';
         lenW1:=Length(word1);
           for j:=1 to lenW1 do  // пройдёмся по буковкам плохого слова
             begin
              letter:=Copy(word1, j, 1); // берём букву плохого слова
              coz:=PosEx(letter, All, lastpos+1); // ищем её в тексте
              if (tbool) then  // если есть символы BPYHCX в этом плохом слове
               begin
                 letter2:='';
                 if (letter='h') then letter2:='x';
                 if (letter='v') then letter2:='b';
                 if (letter='r') then letter2:='p';
                 if (letter='u') then letter2:='y';
                 if (letter='n') then letter2:='h';
                 if (letter='s') then letter2:='c';
                 if (letter2<>'') then
                   begin
                     coz2:=PosEx(letter2, All, lastpos+1); // ищем ещё такую в тексте
                     if (((coz2>0) and (coz2<coz)) or ((coz2>0) and (coz=0))) then
                         begin
                           coz:=coz2;
                           letter:=letter2;
                         end;
                   end;
               end;

              if ((coz>0) and (j=1)) then    // нашли первую букву плохого слова в тексте
               begin
                 lastpos:=coz;
                // MasPos[j]:=lastpos; // запоминаем позицию буквы
                 count1:=count1+1;
                 tmp:=tmp+letter;
                 FirstLetterPos:=coz;
               end;

              delta:=coz-lastpos-1;
              if ((coz>0) and (delta<(Interval+2)) and (j<>1)) then    // нашли вторую букву плохого слова недалеко от первой в тексте
               begin
                 AddLetter:=true;  // флаг добавлять ли эту букву в найденные - будет зависеть от того есть ли на интервале какие-то буквы
                 if (interval>0) then
                  begin
                    SumStops:=0;  // сумма находок стоп-символов
                    CutTxt:=Copy(All,lastpos+1,coz-lastpos-1);  // текст интервала
                    for m:=1 to Length(CutTxt) do SumStops:=SumStops+Pos(CutTxt[m],StopString); // ищем там стоп-символы
                    if (SumStops>0) then AddLetter:=false; // если нашли - то нам буква не подходит
                  end;
                 if AddLetter then  // если true - то буква подходит
                  begin
                    lastpos:=coz;
                    // MasPos[j]:=lastpos;  // запоминаем позицию буквы
                    count1:=count1+1;
                    tmp:=tmp+letter;
                    sumint:=sumint+delta;  // считаем сумму интервалов,  если = 0 - значит требуется ещё проверка по белому списку
                  end;
               end;
              if (coz=0) then FirstLetterPos:=0;
             end;

            if (count1=lenW1) then
            begin
              finded:= true;
              MAW2N[i]:=MAW2N[i]+1;  // у данного слова увеличиваем счётчик (считаем сколько раз нашли такое слово)
              if (sumint=0) then MAW2WF[i]:=MAW2WF[i]+1; // попалось слово с нулевым интервалом, а значит оно возможно из белого списка
              // for j:=1 to lenW1 do All[MasPos[j]]:='.';  // удаляем найденное слово из текста чтоб не мешалось (ставим там точки)
              lastpos:=coz;
            end;

           if (not finded) and (FirstLetterPos>0) then
            begin
              lastpos:=FirstLetterPos;
              finded:=true;
            end;
      until (not finded);
      end;
      lastpos:=0;
     end;

   MAW3len:=0;
   for i:=1 to MAW2Len do // пройдёмся по найденным плохим словам
     begin
      k:=MAW2N[i];    // сколько раз найдено это слово
      if (k>0) then
        begin
         MAW3len:=MAW3len+1;
         MAW3[MAW3len]:=i; // запоминаем номер плохого слова из массива MAW2
        end;
     end;


   if (MAW3len>1) then   // уменьшаем число найденных коротких плохих слов если они входят в более длинные плохие слова
     begin
      for i:=MAW3len downto 2 do
        begin
         NumBadWord:=MAW3[i];
         word1:=MAW2[NumBadWord]; // короткое плохое слово
        for k:=1 to (i-1) do
          begin
           NBW2:=MAW3[k];
           if (Pos(word1, MAW2[NBW2])>0) then MAW2N[NumBadWord]:=MAW2N[NumBadWord]-1;
          end;
        end;
     end;


   If (MAWhiteLen>0) then  // проверка по БЕЛОМУ СПИСКУ
     begin
       for i:=1 to MAW3Len do
         begin
           NumBadWord:=MAW3[i];
           NumNul:=MAW2WF[NumBadWord];
           if (NumNul>=0) then  //   >0 для случаев нулевых интервалов
             begin
               word1:=MAW2[NumBadWord];
               WhiteWord:='';
               for k:=1 to MAWhiteLen do   // ищем белое слово, в котором есть плохое word1
                 begin
                   if (Pos(word1, MAWhiteBP[k])>0) then
                     begin
                       WhiteWordBP:=MAWhiteBP[k];
                       WhiteWord:=MAWhite[k];
                       if (WhiteWord<>'') then  // теперь надо посмотреть есть ли в тексте это белое слово
                         begin
                           WC:=0;  // счётчик найденных в тексте белых слов
                           lastpos:=0; // бегунок по тексту ставим в начало
                           repeat
                             coz:=PosEx(WhiteWord, All, lastpos+1); // ищем слово в тексте
                             if (coz>0) then
                               begin
                                 WC:=WC+1;
                                 lastpos:=coz;
                               end;
                           until (coz=0);
                           if (WC>0) then MAW2N[NumBadWord]:=MAW2N[NumBadWord]-WC;   //  слово есть в белом списке, поэтому убираем из результатов
                         end;

                     end;
                 end;
             end;

         end;
     end;


   // ФИНАЛЬНЫЙ ПОДСЧЁТ ИТОГОВОЙ ОСКОРБИТЕЛЬНОСТИ ТЕКСТА:
   for i:=1 to MAW3Len do // пройдёмся по найденным плохим словам
     begin
     NumBadWord:=MAW3[i];
      k:=MAW2N[NumBadWord];    // сколько раз найдено это слово
      osk:=MAW2osk[NumBadWord];
      if (k>0) then
        begin
         word1:=MAW2[NumBadWord];
          ResMemo.Append('   '+ReTranslit2(word1)+' = '+IntToStr(k)+' х '+IntToStr(osk)+'%    '+word1);
          itogo:=itogo+Length(word1)*k*osk/LenLetters;   // todo сделать учёт степени оскорбительности каждого слова (вместо 100)
        end;
     end;
   Result:=itogo;
   ResMemo.Append('   проверено слов = '+IntToStr(Provereno));
end;

procedure TForm1.WhiteBtnClick(Sender: TObject);
begin
  WhitePanel.Visible:=True;

end;

procedure TForm1.WhiteGridSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);

var
  i: integer;
  WW: string;
begin
  WhiteLineIs:=aRow;
  i:=aRow;
  WW:=WhiteGrid.Cells[1,i];
  DelWhiteWordLabel.Caption:=IntToStr(WhiteLineIs)+'.  '+WW;
end;





procedure TForm1.ClearAllBtnClick(Sender: TObject);
var
    buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('УДАЛИТЬ ВСЕ СЛОВА ИЗ ТАБЛИЦЫ ?!?',mtConfirmation, mbOKCancel, 0);
  if buttonSelected = mrOK     then
    begin
      SaveTimer.Enabled:=False;
      LinesCount:=1;
      Grid1.RowCount:=LinesCount;
      LinesCount:=2;
      Grid1.RowCount:=LinesCount;
      LineIs:=2;
      SaveTimer.Enabled:=True;
    end;
end;

procedure TForm1.DelLetterBtn1Click(Sender: TObject);  // таблица ТРАНСЛИТ 2 - удалить букву
begin
    if (Grid3.RowCount<2) then exit;
    if (Letter2LineIs<1) then exit;
   SaveTimer.Enabled:=False;
   Grid3.DeleteRow(LetterLineIs);
   if (Grid3.RowCount<2) then Grid3.RowCount:=2;
   Letter2LinesCount:=Grid3.RowCount;
   SaveTimer.Enabled:=True;
end;

procedure TForm1.DelWhiteBtnClick(Sender: TObject);  // удалить слово из белого списка
begin
  if (WhiteGrid.RowCount<2) then exit;
    if (WhiteLineIs<1) then exit;
    SaveTimer.Enabled:=False;
     WhiteGrid.DeleteRow(WhiteLineIs);
   if (WhiteGrid.RowCount<2) then WhiteGrid.RowCount:=2;
//     LetterLinesCount:=Grid2.RowCount;
     SaveTimer.Enabled:=True;
end;

procedure TForm1.DelLetterBtnClick(Sender: TObject);  // таблица ТРАНСЛИТ 1 - удалить букву
begin
  if (Grid2.RowCount<2) then exit;
  if (LetterLineIs<1) then exit;
  SaveTimer.Enabled:=False;
   Grid2.DeleteRow(LetterLineIs);
   if (Grid2.RowCount<2) then Grid2.RowCount:=2;
   LetterLinesCount:=Grid2.RowCount;
   SaveTimer.Enabled:=True;
end;

procedure TForm1.AddLetterBtnClick(Sender: TObject);   // таблица ТРАНСЛИТ 1 - добавить букву
var
  i: integer;
begin
  i:=Grid2.RowCount;
  i:=i+1;
  if (i>1000) then
    begin
      i:=1000;
      ShowMessage('В программе длина массива букв = 1000,  поставьте нужное Вам число и перекомпилируйте программу');
    end;
  LetterLinesCount:=i;
  Grid2.RowCount:=i;
end;

procedure TForm1.AddLetterBtn1Click(Sender: TObject);  // таблица ТРАНСЛИТ 2 - добавить букву
var
  i: integer;
begin
  i:=Grid3.RowCount;
  i:=i+1;
  if (i>1000) then
    begin
      i:=1000;
      ShowMessage('В программе длина массива букв = 1000,  поставьте нужное Вам число и перекомпилируйте программу');
    end;
  Letter2LinesCount:=i;
  Grid3.RowCount:=i;
end;

procedure TForm1.DelLineBtnClick(Sender: TObject);
begin
   if (Grid1.RowCount<2) then exit;
  If (LineIs<1) then exit;
   SaveTimer.Enabled:=False;
   Grid1.DeleteRow(LineIs);
   if (Grid1.RowCount<2) then Grid1.RowCount:=2;
   LinesCount:=Grid1.RowCount;
   SaveTimer.Enabled:=True;
end;

procedure TForm1.ExitSettingsBtnClick(Sender: TObject);
begin
  SettPanel.Visible:=False;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  AM: TIniFile;
  i, iRow: integer;
  Ws, Ts, Istr, Os: string;
  RL, TL: string;
  its: string;
  sst: string;
  FileCreating: TFileStream;
begin
  SavingPanel.Left:=271;
  SavingPanel.Top:=635;

  MemSlotFlag:= false;
  SelSlotPanel.Top:=238;
  SelSlotPanel.Left:=501;

  SettPanel.Left:=128;
  SettPanel.Top:=8;

  AboutPanel.Width:=320;
  AboutPanel.Height:=160;
  AboutMemo.Width:=300;
  AboutMemo.Height:=120;

  CloseAboutPanelBtn.Top:=136;
  CloseAboutPanelBtn.Left:=120;

  AboutMemo.Clear;
  AboutMemo.Append(' Проект АНТИМАТ 1.0');
  AboutMemo.Append(' ');
  AboutMemo.Append(' Автор:  Горшенин Сергей');
  AboutMemo.Append(' ');
  AboutMemo.Append(' Обсудить: https://www.cyberforum.ru/blogs/1506633/');
  AboutMemo.Append(' ');
  AboutMemo.Append('Принимаю благодарности рублями на Ю.Мани - 4100191036612 :)');


  AntiMatFile:='antimat.ini';
     if not FileExists(AntiMatFile) then
    begin
      FileCreating:= TFileStream.Create(AntiMatFile, fmCreate);
      FreeAndNil(FileCreating);
    end;

  SlotsFile:='slots.ini';
        if not FileExists(SlotsFile) then
       begin
         FileCreating:= TFileStream.Create(SlotsFile, fmCreate);
         FreeAndNil(FileCreating);
       end;


  LinesCount:=2;
  LineIs:=1;
  LetterLineIs:=1;
  LetterLinesCount:=2;

  Letter2LineIs:=1;
  Letter2LinesCount:=2;
           try
               AM := TIniFile.Create(AntiMatFile);
               with AM do
                    begin
                     LinesCount:=ReadInteger ('config', 'LinesCount', 2 );
                     Grid1.RowCount:=LinesCount;

                     LetterLinesCount:=ReadInteger ('config', 'LetterLinesCount', 2 );
                     Grid2.RowCount:=LetterLinesCount;

                     Letter2LinesCount:=ReadInteger ('config', 'Letter2LinesCount', 2 );
                     Grid3.RowCount:=Letter2LinesCount;

                     WhiteCount:=ReadInteger ('config', 'WhiteCount', 2 );
                     WhiteGrid.RowCount:=WhiteCount;

                     sst:=ReadString ('config', 'StopString', 'abcdefghijklmnopqrstuvwxyz1234567890' ); // StopString:=StopStringEdit.Text
                     StopStringEdit.Text:=sst;

                     Interval:=ReadInteger ('config', 'Interval', 20);
                     IntEdit.text:=IntToStr(Interval);



                     SaveTime:=ReadInteger ('config', 'AutoSaveTime', 60 );
                     If (SaveTime<1) then SaveTime:=60;
                     TimeEdit.Text:=IntToStr(SaveTime);
                     SaveTimer.Interval:=SaveTime*1000;

                     Ts:=ReadString ('config', 'AutoSaveFlag', 'on');
                     if (Ts='on') then CheckBox1.Checked:=true else CheckBox1.Checked:=False;


                     if (LinesCount>1) then
                       begin
                         For i:=2 to LinesCount do
                          begin
                            iRow:=i-1;
                            its:=IntToStr(iRow);
                            Ws:=ReadString ('rules', its+'_W', '' );
                            Ts:=ReadString ('rules', its+'_T', '' );
                            Istr:=ReadString ('rules', its+'_I', '' );
                            Os:=ReadString ('rules', its+'_O', '' );

                            Grid1.Cells[1,iRow]:=Ws;
                            Grid1.Cells[2,iRow]:=Ts;
                            Grid1.Cells[3,iRow]:=Istr;
                            Grid1.Cells[4,iRow]:=Os;

                          end;
                       end;


                     if (WhiteCount>1) then
                       begin
                         For i:=2 to WhiteCount do
                          begin
                            iRow:=i-1;
                            its:=IntToStr(iRow);
                            Ws:=ReadString ('whitelist', its, '' );
                            WhiteGrid.Cells[1,iRow]:=Ws;
                          end;
                       end;


                     if (LetterLinesCount>1) then
                     begin
                       For i:=2 to LetterLinesCount do
                         begin
                           iRow:=i-1;
                           its:=IntToStr(iRow);
                           RL:=ReadString ('translit1', its+'_R', '' );
                           Grid2.Cells[1,iRow]:=RL;
                           TL:=ReadString ('translit1', its+'_T', '' );
                           Grid2.Cells[2,iRow]:=TL;
                           TMassR[iRow]:=UTF8LowerCase(RL, 'ru');  // для ТРАНСЛИТА - таблица перевода, русские символы
                           TMassT[iRow]:=AnsiLowerCase(TL); // латиница
                         end;
                       end;

                     if (Letter2LinesCount>1) then
                     begin
                       For i:=2 to Letter2LinesCount do
                         begin
                           iRow:=i-1;
                           its:=IntToStr(iRow);
                           RL:=ReadString ('translit2', its+'_R', '' );
                           Grid3.Cells[1,iRow]:=RL;
                           TL:=ReadString ('translit2', its+'_T', '' );
                           Grid3.Cells[2,iRow]:=TL;
                           TMassR2[iRow]:=UTF8LowerCase(RL, 'ru');  // для ТРАНСЛИТА - таблица перевода, русские символы
                           TMassT2[iRow]:=AnsiLowerCase(TL); // латиница
                         end;
                       end;



                    end;
               finally AM.Free;
              // except on Ex: Exception do
           end;
  for i:=12 downto 1 do
     begin
      SlotIs:=i;
      LoadFromSlot;
     end;
end;

procedure TForm1.Grid1SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  if (EmptyLine=aRow) then Grid1.Cells[2,aRow]:=Translit(Grid1.Cells[1,aRow]);
end;

procedure TForm1.Grid2SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
var
  i: integer;
  RL, TL: string;
begin
  LetterLineIs:=aRow;
  i:=aRow;
  RL:=Grid2.Cells[1,i];
  TL:=Grid2.Cells[2,i];
  DelLetterLabel.Caption:=IntToStr(LetterLineIs)+'.  '+RL+' = '+TL;
end;

procedure TForm1.Grid3SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
var
  i: integer;
  RL, TL: string;
begin
  Letter2LineIs:=aRow;
  i:=aRow;
  RL:=Grid3.Cells[1,i];
  TL:=Grid3.Cells[2,i];
  DelLetterLabel1.Caption:=IntToStr(Letter2LineIs)+'.  '+RL+' = '+TL;
end;


procedure TForm1.ImportBtnClick(Sender: TObject);
var
  Ns: integer;
  i, j, k, nw: integer;
  du: integer;
  word1, tword1: string;
  line: string;
  len: integer;
  lenWord: integer;
  tempLetter: string;
  povtor: boolean;
begin
  Ns:=Memo1.Lines.Count;
//  ImportBtn.Caption:=IntToStr(Ns);
  if (Ns=0) then exit;
  nw:=0;  // Число добавленных слов
  SaveTimer.Enabled:=False;
  for k:=1 to Ns do
    begin
     line:=Memo1.Lines[k-1]+' ';
     len:=UTF8Length(line);
     if (len>0) then
      begin
        i:=0;
        word1:='';
        repeat
          i:=i+1;
          tempLetter:=UTF8Copy(line,i,1);
          if (tempLetter<>' ') then
            begin
              word1:=word1+tempLetter;
            end
            else
              begin
                lenWord:=UTF8Length(word1);
                if (lenWord>2) then
                  begin
                      tword1:=Translit(word1);
                      j:=Grid1.RowCount;
                      if (j>1) then
                        begin
                          povtor:=false;
                          for du:=1 to (j-1) do
                            begin
                              if (Grid1.Cells[2,du]=tword1) then povtor:=true;
                            end;
                          if (not povtor) then
                            begin
                              j:=j+1;
                              LinesCount:=j;
                              Grid1.RowCount:=j;
                              Grid1.Cells[1,j-1]:=word1;
                              Grid1.Cells[2,j-1]:=tword1;
                              word1:='';
                              nw:=nw+1;
                            end else word1:='';
                        end
                        else
                          begin
                           j:=j+1;
                           LinesCount:=j;
                           Grid1.RowCount:=j;
                           Grid1.Cells[1,j-1]:=word1;
                           Grid1.Cells[2,j-1]:=tword1;
                           word1:='';
                           nw:=nw+1;
                          end;
                  end else word1:='';
              end;
        until (i>=len);
      end;
    end;
  ShowMessage('Число импортированных слов = '+intToStr(nw));
  SaveTimer.Enabled:=True;
end;

procedure TForm1.ClearMemTextBtnClick(Sender: TObject);
begin
  TestMemo.Clear;
end;

procedure TForm1.ImportToWhiteBtnClick(Sender: TObject);
var
  Ns: integer;
  i, j, k, nw, lico: integer;
  du: integer;
  word1, tword1: string;
  line: string;
  len: integer;
  lenWord: integer;
  tempLetter: string;
  povtor: boolean;
begin
  Ns:=Memo2.Lines.Count;
  if (Ns=0) then exit;
  nw:=0;  // Число добавленных слов
  SaveTimer.Enabled:=False;
  for k:=1 to Ns do
    begin
     line:=Memo2.Lines[k-1]+' ';
     len:=UTF8Length(line);
     if (len>0) then
      begin
        i:=0;
        word1:='';
        repeat
          i:=i+1;
          tempLetter:=UTF8Copy(line,i,1);
          if (tempLetter<>' ') then
            begin
              word1:=word1+tempLetter;
            end
            else
              begin
                lenWord:=UTF8Length(word1);
                if (lenWord>2) then
                  begin
                    //  tword1:=Translit(word1);
                      j:=WhiteGrid.RowCount;
                      if (j>1) then
                        begin
                          povtor:=false;
                          for du:=1 to (j-1) do
                            begin
                              if (WhiteGrid.Cells[1,du]=word1) then povtor:=true;
                            end;
                          if (not povtor) then
                            begin
                              j:=j+1;
                              lico:=j;
                              WhiteGrid.RowCount:=j;
                              WhiteGrid.Cells[1,j-1]:=word1;
                         //     Grid1.Cells[2,j-1]:=tword1;
                              word1:='';
                              nw:=nw+1;
                            end else word1:='';
                        end
                        else // первое слово в списке
                          begin
                           j:=j+1;
                           lico:=j;
                           WhiteGrid.RowCount:=j;
                           WhiteGrid.Cells[1,j-1]:=word1;
                         //  Grid1.Cells[2,j-1]:=tword1;
                           word1:='';
                           nw:=nw+1;
                          end;
                  end else word1:='';
              end;
        until (i>=len);
      end;
    end;
  ShowMessage('Число импортированных слов = '+intToStr(nw));
  SaveTimer.Enabled:=True;
end;


procedure TForm1.IntBtnClick(Sender: TObject);
begin
  TryStrToInt(IntEdit.text, Interval);
end;

procedure TForm1.MemTextClick(Sender: TObject);
begin
  MemSlotFlag:=true;
  SelSlotPanel.Visible:=true;
  CancSavingBtn.Visible:=True;
end;



procedure TForm1.SaveBtnClick(Sender: TObject);
var
  AM: TMemIniFile;
  i, iRow: integer;
  Ws, Ts, Istr, Os, RL, TL: string;
  its: string;
  sst: string;
begin
  SaveTimer.Enabled:=False;
  SavingPanel.Visible:=True;
  Application.ProcessMessages;
  LinesCount:=Grid1.RowCount; // чёрный список
  LetterLinesCount:=Grid2.RowCount; // буквы Транслит_1
  Letter2LinesCount:=Grid3.RowCount;// буквы Транслит_2
  WhiteCount:=WhiteGrid.RowCount;  // белый список
   AM := TMemIniFile.Create(AntiMatFile);
  try
      // AM := TIniFile.Create(AntiMatFile);
      with AM do
           begin
            WriteInteger ('config', 'LinesCount', LinesCount );
            WriteInteger ('config', 'LetterLinesCount', LetterLinesCount );
            WriteInteger ('config', 'Letter2LinesCount', Letter2LinesCount );
            WriteInteger ('config', 'WhiteCount', WhiteCount );
            WriteInteger ('config', 'AutoSaveTime', SaveTime);
            if CheckBox1.Checked then Ts:='on' else Ts:='off';
            WriteString ('config', 'AutoSaveFlag', Ts);
            sst:=StopStringEdit.Text;
            WriteString ('config', 'StopString', sst ); // StopString:=StopStringEdit.Text
//            Interval:=20;
            TryStrToInt(IntEdit.text, Interval); // Интервал по умолчанию заносим в переменную
            WriteInteger ('config', 'Interval', Interval);

            if (LetterLinesCount>1) then
              begin
                EraseSection('translit1');
                For i:=2 to LetterLinesCount do
                 begin
                   iRow:=i-1;
                   its:=IntToStr(iRow);
                   RL:=Grid2.Cells[1,iRow];
                   WriteString ('translit1', its+'_R', RL );
                   TMassR[iRow]:=UTF8LowerCase(RL, 'ru');  // для ТРАНСЛИТА - таблица перевода, русские символы
                   TL:=Grid2.Cells[2,iRow];
                   WriteString ('translit1', its+'_T', TL );
                   TMassT[iRow]:=AnsiLowerCase(TL); // латиница
                 end;
              end;

            if (Letter2LinesCount>1) then
              begin
                EraseSection('translit2');
                For i:=2 to Letter2LinesCount do
                 begin
                   iRow:=i-1;
                   its:=IntToStr(iRow);
                   RL:=Grid3.Cells[1,iRow];
                   WriteString ('translit2', its+'_R', RL );
                   TMassR2[iRow]:=UTF8LowerCase(RL, 'ru');  // для ТРАНСЛИТА - таблица перевода, русские символы
                   TL:=Grid3.Cells[2,iRow];
                   WriteString ('translit2', its+'_T', TL );
                   TMassT2[iRow]:=AnsiLowerCase(TL); // латиница
                 end;
              end;


            if (LinesCount>1) then
              begin
                EraseSection('rules');    // чёрный список
                For i:=2 to LinesCount do
                 begin
                   iRow:=i-1;
                   its:=IntToStr(iRow);
                   Ws:=Grid1.Cells[1,iRow];
                   WriteString ('rules', its+'_W', Ws );
                   Ts:=Grid1.Cells[2,iRow];
                   WriteString ('rules', its+'_T', Ts );
                   Istr:=Grid1.Cells[3,iRow];
                   WriteString ('rules', its+'_I', Istr );
                   Os:=Grid1.Cells[4,iRow];
                   WriteString ('rules', its+'_O', Os );
                 end;
              end;

            if (WhiteCount>1) then  //   WhiteCount:=WhiteGrid.RowCount;  // белый список
              begin
                EraseSection('whitelist');    // белый список
                For i:=2 to WhiteCount do
                 begin
                   iRow:=i-1;
                   its:=IntToStr(iRow);
                   Ws:=WhiteGrid.Cells[1,iRow];
                   WriteString ('whitelist', its, Ws );
                 end;
              end;

           end;
      finally
        begin
         AM.UpdateFile;
         AM.Free;
        end;
     // except on Ex: Exception do
  end;
 SavingPanel.Visible:=False;
 SaveTimer.Enabled:=True;

end;


procedure TForm1.SaveToSlot;
var
  SLOT: TMemIniFile;
  i : integer;
  tmp, razdel: string;
  linesN: integer;


begin
   SLOT := TMemIniFile.Create(SlotsFile);
  try
      // AM := TIniFile.Create(AntiMatFile);
      with SLOT do
           begin
            razdel:='slot_'+IntToStr(SlotIs);
            linesN:=TestMemo.Lines.Count;
            if (linesN>0) then
              begin
                EraseSection(razdel);
                WriteInteger (razdel, 'LinesCount', linesN );
                for i:=1 to linesN do
                 begin
                  tmp:=TestMemo.Lines[i-1];
                  WriteString (razdel, 'L_'+IntToStr(i), tmp);
                 end;
              end;

           end;
      finally
        begin
         SLOT.UpdateFile;
         SLOT.Free;
        end;
     // except on Ex: Exception do
  end;
 SelSlotPanel.Visible:=False;
 MemSlotFlag:=false;
 CancSavingBtn.Visible:=false;
 LoadFromSlot;
end;


procedure TForm1.LoadFromSlot;
var
  SLOT: TMemIniFile;
  i : integer;
  tmp, razdel: string;
  linesN: integer;
  sum: integer;
  forhint: string;
begin
   SLOT := TMemIniFile.Create(SlotsFile);
   TestMemo.Clear;
   sum:=0;
  try
      with SLOT do
           begin
            razdel:='slot_'+IntToStr(SlotIs);
            linesN:=ReadInteger (razdel, 'LinesCount', 0 );;
            if (linesN>0) then
              begin
                TestMemo.Clear;
                for i:=1 to linesN do
                 begin
                  tmp:=ReadString (razdel, 'L_'+IntToStr(i), '');
                  TestMemo.Append(tmp);
                  if i=1 then forhint:=tmp;
                 end;
              end;

           end;
      finally
        begin
         SLOT.Free;
        end;
     // except on Ex: Exception do
  end;

 if ((SlotIs=1) and (linesN>0)) then
   begin
     Slot1Btn.Hint:=forhint;
     Slot1Btn.Caption:='Текст';
   end;

  if ((SlotIs=2) and (linesN>0)) then
   begin
     Slot2Btn.Hint:=forhint;
     Slot2Btn.Caption:='Текст';
   end;

  if ((SlotIs=3) and (linesN>0)) then
   begin
     Slot3Btn.Hint:=forhint;
     Slot3Btn.Caption:='Текст';
   end;

  if ((SlotIs=4) and (linesN>0)) then
   begin
     Slot4Btn.Hint:=forhint;
     Slot4Btn.Caption:='Текст';
   end;

  if ((SlotIs=5) and (linesN>0)) then
   begin
     Slot5Btn.Hint:=forhint;
     Slot5Btn.Caption:='Текст';
   end;

  if ((SlotIs=6) and (linesN>0)) then
   begin
     Slot6Btn.Hint:=forhint;
     Slot6Btn.Caption:='Текст';
   end;

  if ((SlotIs=7) and (linesN>0)) then
   begin
     Slot7Btn.Hint:=forhint;
     Slot7Btn.Caption:='Текст';
   end;

  if ((SlotIs=8) and (linesN>0)) then
   begin
     Slot8Btn.Hint:=forhint;
     Slot8Btn.Caption:='Текст';
   end;

  if ((SlotIs=9) and (linesN>0)) then
   begin
     Slot9Btn.Hint:=forhint;
     Slot9Btn.Caption:='Текст';
   end;

  if ((SlotIs=10) and (linesN>0)) then
   begin
     Slot10Btn.Hint:=forhint;
     Slot10Btn.Caption:='Текст';
   end;

  if ((SlotIs=11) and (linesN>0)) then
   begin
     Slot11Btn.Hint:=forhint;
     Slot11Btn.Caption:='Текст';
   end;

  if ((SlotIs=12) and (linesN>0)) then
   begin
     Slot12Btn.Hint:=forhint;
     Slot12Btn.Caption:='Текст';
   end;


 SelSlotPanel.Visible:=False;
end;


procedure TForm1.SaveLettBtnClick(Sender: TObject);
begin
  SaveBtnClick(Form1);
end;

procedure TForm1.SaveTimerTimer(Sender: TObject);
begin
  if CheckBox1.Checked then SaveBtnClick(Form1);
end;

procedure TForm1.ExportBtnClick(Sender: TObject);
var
  FileCreating: TFileStream;
  AM: TMemIniFile;
  i, iRow: integer;
  Ws, Ts, Istr, Os, RL, TL: string;
  its: string;
  sst: string;
begin
  SavingPanel.Visible:=True;
  Application.ProcessMessages;
  Sorting;
  LinesCount:=Grid1.RowCount; // чёрный список
  LetterLinesCount:=Grid2.RowCount; // буквы Транслит_1
  Letter2LinesCount:=Grid3.RowCount;// буквы Транслит_2
  WhiteCount:=WhiteGrid.RowCount;  // белый список

  ExportFile:='antimat-sorted.ini';
     if not FileExists(ExportFile) then
    begin
      FileCreating:= TFileStream.Create(ExportFile, fmCreate);
      FreeAndNil(FileCreating);
    end;


  AM := TMemIniFile.Create(ExportFile);
  try
      // AM := TIniFile.Create(AntiMatFile);
      with AM do
           begin
          //  WriteInteger ('config', 'LinesCount', LinesCount );
            WriteInteger ('config', 'LetterLinesCount', LetterLinesCount );
            WriteInteger ('config', 'Letter2LinesCount', Letter2LinesCount );
          //  WriteInteger ('config', 'WhiteCount', WhiteCount );
            sst:=StopStringEdit.Text;
            WriteString ('config', 'StopString', sst ); // StopString:=StopStringEdit.Text
//            Interval:=20;
            TryStrToInt(IntEdit.text, Interval); // Интервал по умолчанию заносим в переменную
            WriteInteger ('config', 'Interval', Interval);
            WriteInteger ('config', 'MAW2len', MAW2len);
            WriteInteger ('config', 'MAWhiteLen', MAWhiteLen);


            if (LetterLinesCount>1) then
              begin
                EraseSection('translit1');
                For i:=2 to LetterLinesCount do
                 begin
                   iRow:=i-1;
                   its:=IntToStr(iRow);
                   RL:=Grid2.Cells[1,iRow];
                   WriteString ('translit1', its+'_R', RL );
                   TMassR[iRow]:=UTF8LowerCase(RL, 'ru');  // для ТРАНСЛИТА - таблица перевода, русские символы
                   TL:=Grid2.Cells[2,iRow];
                   WriteString ('translit1', its+'_T', TL );
                   TMassT[iRow]:=AnsiLowerCase(TL); // латиница
                 end;
              end;

            if (Letter2LinesCount>1) then
              begin
                EraseSection('translit2');
                For i:=2 to Letter2LinesCount do
                 begin
                   iRow:=i-1;
                   its:=IntToStr(iRow);
                   RL:=Grid3.Cells[1,iRow];
                   WriteString ('translit2', its+'_R', RL );
                   TMassR2[iRow]:=UTF8LowerCase(RL, 'ru');  // для ТРАНСЛИТА - таблица перевода, русские символы
                   TL:=Grid3.Cells[2,iRow];
                   WriteString ('translit2', its+'_T', TL );
                   TMassT2[iRow]:=AnsiLowerCase(TL); // латиница
                 end;
              end;


            if (MAW2len>0) then
              begin
                EraseSection('MAW2');    // чёрный список
                For i:=1 to MAW2len do
                 begin
                   its:=IntToStr(i);
                   WriteString ('MAW2', its+'_W', MAW2[i] );

                   Ts:='0';
                   If (MAH2[i]) then Ts:='1';
                   WriteString ('MAW2', its+'_H', Ts );

                   WriteInteger ('MAW2', its+'_O', MAW2osk[i] );

                   WriteInteger ('MAW2', its+'_L', MAW2Links[i] );
                 end;
              end;

            if (MAWhiteLen>0) then  //    белый список
              begin
                EraseSection('whitelist');    // белый список
                For i:=1 to MAWhiteLen do
                 begin
                   its:=IntToStr(i);
                   WriteString ('whitelist', its, MAWhite[i] );
                   WriteString ('whitelist', its+'_bp', MAWhiteBP[i] );
                 end;
              end;

           end;
      finally
        begin
         AM.UpdateFile;
         AM.Free;
        end;
     // except on Ex: Exception do
  end;
 SavingPanel.Visible:=False;
 ShowMessage('Отсортированный чёрный список + Белый + таблицы транслита сохранены в файл "antimat-sorted.ini", можно использовать в своих проектах.');
end;


procedure TForm1.SettingsBtnClick(Sender: TObject);
begin
  SettPanel.Visible:=True;
end;

procedure TForm1.Grid1SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
var
  i: integer;
  Ws, Ts, Istr, Os: string;
begin
  LineIs:=aRow;
  i:=LineIs;
  If (Grid1.Cells[2,i]='') then EmptyLine:=aRow else EmptyLine:=0;
  Ws:=Grid1.Cells[1,i];
  Ts:=Grid1.Cells[2,i];
  Istr:=Grid1.Cells[3,i];
  Os:=Grid1.Cells[4,i];
  DelLabel.Caption:=IntToStr(LineIs)+'.  '+Ws+' - '+Ts+' - '+Istr+' - '+Os;
end;

procedure TForm1.Slot10BtnClick(Sender: TObject);
begin
    SlotIs:=10;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot11BtnClick(Sender: TObject);
begin
    SlotIs:=11;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot12BtnClick(Sender: TObject);
begin
    SlotIs:=12;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot1BtnClick(Sender: TObject);
begin
  SlotIs:=1;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot2BtnClick(Sender: TObject);
begin
  SlotIs:=2;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;
end;

procedure TForm1.Slot3BtnClick(Sender: TObject);
begin
  SlotIs:=3;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;
end;

procedure TForm1.Slot4BtnClick(Sender: TObject);
begin
  SlotIs:=4;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;
end;

procedure TForm1.Slot5BtnClick(Sender: TObject);
begin
  SlotIs:=5;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot6BtnClick(Sender: TObject);
begin
  SlotIs:=6;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot7BtnClick(Sender: TObject);
begin
  SlotIs:=7;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot8BtnClick(Sender: TObject);
begin
  SlotIs:=8;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.Slot9BtnClick(Sender: TObject);
begin
    SlotIs:=9;
  if MemSlotFlag then
    begin
      SaveToSlot;
    end
    else LoadFromSlot;

end;

procedure TForm1.TestMemoChange(Sender: TObject);
begin

end;

//------------------------------
//------------------------------------------------
function TForm1.Translit(S: string): string;
var
  i, k: Integer;
  TS, RS, FS: string;
  CurChar: string;
  NewChar: string;
begin
Result := '';
RS := '';
if UTF8Length(S) = 0 then
   Exit;
S:=UTF8LowerCase(S, 'ru');

for i := 1 to UTF8Length(S) do
 begin
  CurChar:=UTF8Copy(S,i,1);
  NewChar:='';
  for k:=1 to LetterLinesCount do
   begin
    if (TMassR[k]=CurChar) then NewChar:=TMassT[k];
   end;
  if (NewChar='') then RS:=RS+CurChar
                  else RS:=RS+NewChar;
 end;
 Result:=RS;
end;



function TForm1.Translit2(S: string): string;
var
  i, k: Integer;
  TS, RS, FS: string;
  CurChar: string;
  NewChar: string;
begin
Result := '';
RS := '';
if UTF8Length(S) = 0 then
   Exit;
S:=UTF8LowerCase(S, 'ru');

for i := 1 to UTF8Length(S) do
 begin
  CurChar:=UTF8Copy(S,i,1);
  NewChar:='';
  for k:=1 to Letter2LinesCount do
   begin
    if (TMassR2[k]=CurChar) then NewChar:=TMassT2[k];
   end;
  if (NewChar='') then RS:=RS+CurChar
                  else RS:=RS+NewChar;
 end;
 Result:=RS;
end;



function TForm1.ReTranslit2(S: string): string;
var
  i, k: Integer;
  TS, RS, FS: string;
  CurChar: string;
  NewChar: string;
begin
Result := '';
RS := '';
if UTF8Length(S) = 0 then
   Exit;
// S:=UTF8LowerCase(S, 'ru');

for i := 1 to UTF8Length(S) do
 begin
  CurChar:=UTF8Copy(S,i,1);
  NewChar:='';
  for k:=1 to 33 do
   begin
    if (TMassT2[k]=CurChar) then NewChar:=TMassR2[k];
   end;
  if (NewChar='') then RS:=RS+CurChar
                  else RS:=RS+NewChar;
 end;
 Result:=RS;
end;




procedure TForm1.Sorting;
var
  i, k, m, iRow: integer;
  Ts, Ts2: string;
  wlen: integer;
  maxlen: integer;
  maxpos: integer;
  povtor: boolean;
  addit: boolean;
  tbool: boolean;
  naiden: boolean;
  osk: integer;  // оскорбительность
  osks: string;
begin
  MAW2len:=0;
  MAW1len:=0;
  LinesCount:=Grid1.RowCount; // чёрный список
  LetterLinesCount:=Grid2.RowCount; // буквы Транслит_1
  Letter2LinesCount:=Grid3.RowCount;// буквы Транслит_2
  WhiteCount:=WhiteGrid.RowCount;  // белый список

  if (LinesCount<2) then exit;
  For i:=2 to LinesCount do
                begin
                  iRow:=i-1;
                  Ts:=Translit2(Grid1.Cells[1,iRow]);  // переводим русские плохие слова в Транслит_2
                  Ts:=StringReplace(Ts, ' ', '', [rfReplaceAll]); // убираем пробелы
                  wlen:=Length(Ts);
                  if (wlen>2) then  // короткие не берём
                    begin           // проверка на повторки
                      povtor:=false;
                      if (MAW1len>0) then
                        begin
                          k:=0;
                          repeat // for k:=1 to MAW1len do
                            k:=k+1;
                            if (Ts=MAW1[k]) then povtor:=true;
                          until ((k=MAW1len) or povtor);
                        end;
                      if (not povtor) then
                        begin
                          tbool:=false;
                          if ((Pos('h', Ts)>0) or (Pos('v', Ts)>0) or (Pos('r', Ts)>0) or (Pos('u', Ts)>0) or (Pos('n', Ts)>0) or (Pos('s', Ts)>0)) then tbool:=true;
                          MAW1len:=MAW1len+1;
                          MAW1[MAW1len]:=Ts;   // ... и заносим их в таблицу
                          MAL[MAW1len]:=wlen;
                          MAH[MAW1len]:=tbool;
                          osk:=100;
                          osks:=Grid1.Cells[4,iRow];
                          If (osks<>'') then TryStrToInt(osks,osk);
                          MAW1osk[MAW1len]:=osk;
                        end;
                    end;
                end;



  For i:=2 to LinesCount do
                begin
                  iRow:=i-1;
                  Ts:=Grid1.Cells[2,iRow];  // берём транслитные плохие слова
                  Ts:=StringReplace(Ts, ' ', '', [rfReplaceAll]); // убираем пробелы
                  wlen:=Length(Ts);
                  if (wlen>2) then
                    begin
                        povtor:=false;
                        if (MAW1len>0) then
                          begin
                            k:=0;
                            repeat // for k:=1 to MAW1len do
                              k:=k+1;
                              if (Ts=MAW1[k]) then povtor:=true;
                            until ((k=MAW1len) or povtor);
                          end;
                        if (not povtor) then
                          begin
                            MAW1len:=MAW1len+1;
                            MAW1[MAW1len]:=Ts;   // ... и заносим их в таблицу
                            MAL[MAW1len]:=wlen;
                            MAH[MAW1len]:=false;
                            osk:=100;
                            osks:=Grid1.Cells[4,iRow];
                            If (osks<>'') then TryStrToInt(osks,osk);
                            MAW1osk[MAW1len]:=osk;
                          end;
                    end;
                end;


  WhiteCount:=WhiteGrid.RowCount;  // белый список
  MAWhiteLen:=0; // длина списка
  if (WhiteCount>1) then  //
              begin
                For i:=2 to WhiteCount do
                 begin
                  iRow:=i-1;
                  Ts:=Translit2(WhiteGrid.Cells[1,iRow]);  // переводим русские белые слова в Транслит_2
                  Ts2:=StringReplace(Ts, ' ', '', [rfReplaceAll]); // убираем пробелы
                  Ts2:=StringReplace(Ts2, '.', '', [rfReplaceAll]); // убираем .
                  Ts2:=StringReplace(Ts2, ',', '', [rfReplaceAll]); // убираем ,
                  wlen:=Length(Ts);
                  if (wlen>2) then  // короткие не берём
                    begin           // проверка на повторки
                      povtor:=false;
                      if (MAWhiteLen>0) then
                        begin
                          k:=0;
                          repeat // for k:=1 to MAW1len do
                            k:=k+1;
                            if (Ts=MAWhite[k]) then povtor:=true;
                          until ((k=MAWhiteLen) or povtor);
                        end;
                      if (not povtor) then
                        begin
                          MAWhiteLen:=MAWhiteLen+1;
                          MAWhite[MAWhiteLen]:=Ts;   // ... и заносим их в таблицу
                          MAWhiteBP[MAWhiteLen]:=Ts2;
                        end;
                    end;
                 end;
              end;




  if (MAW1len=0) then exit;

  repeat     // сортировка по убыванию
    maxlen:=0;
    maxpos:=0;
    for i:=1 to MAW1len do
       begin
        if (MAL[i]>maxlen) then
          begin
            maxlen:=MAL[i];
            maxpos:=i;
          end;
       end;

       if (maxlen>0) then
         begin
           MAW2len:=MAW2len+1;          // длина отсортированного массива
           MAW2[MAW2len]:=MAW1[maxpos];  // записываем слово
           MAH2[MAW2len]:=MAH[maxpos];  // записываем флаг наличия букв BPYHCX
           MAW2osk[MAW2len]:=MAW1osk[maxpos];
           MAL[maxpos]:=0;
         end;
  until (maxlen=0) ;


  if (MAW2len=0) then exit;

  for i:=1 to MAW2len do MAW2Links[i]:=0;  // обнуляем массив на всякий случай

  if (MAW2len>1) then  // начинаем искать короткие слова, входящие в длинные и давать на них ссылки
    begin
      for i:=1 to (MAW2len-1) do
         begin
          Ts:=MAW2[i];
          k:=i;
          naiden:=false;
          repeat
            k:=k+1;
            if (Pos(MAW2[k], Ts)>0) then naiden:=true;
          until ((k>=MAW2len) or naiden);
          if naiden then MAW2Links[i]:=k;
         end;
    end;




end;





end.

