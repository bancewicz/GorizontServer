//---------------------------------------------------------------------------
void __fastcall TFMain::TmUpdateTimer(TObject *Sender)
{
  static TTreeNode* oldSel=NULL;
  UpdateLog(); // gluk 3
  if(Visible)
  {
    if(TreeView->Selected!=NULL)
    {
      int ix=TreeView->Selected->StateIndex;
      // Сервер
      TSPrs->TabVisible=(ix==0);
      TSSens->TabVisible=(ix==0);
      // Порт
      TSCOM->TabVisible=(ix>0)&&(ix<256);
      // Датчик
      TSSrs->TabVisible=(ix>256);
    }

//Все дерево перерисовывается тут
    if(TreeView->Visible)  UpdateTree();

    if(PortsList->Visible) UpdatePortsList();
    if(COMList->Visible)   UpdatePort();
    if(SensList->Visible)  UpdateSensList();

    if(SrsList->Visible)   UpdateSrs();

    if(TSTest->TabVisible) UpdateStat();
    if(TSLog->TabVisible)  UpdateLog();
    StatusBar->Panels->Items[0]->Text=FormatDateTime("hh:nn:ss dd.mm.yy",Now());

    AnsiString s=TmSave->Interval/1000.0;
    if(CanSave) {if(StatusBar->Panels->Items[1]->Text!=s)  StatusBar->Panels->Items[1]->Text=s;}
    else        {if(StatusBar->Panels->Items[1]->Text!="") StatusBar->Panels->Items[1]->Text="";}

    CBTCP->Checked=GPRSServer->Active;
    ETCP->Text=GPRSServer->Socket->ActiveConnections;
  }
  if(oldSel!=TreeView->Selected) {oldSel=TreeView->Selected;UpdateTV();}
  //UpdateTray();
}
//---------------------------------------------------------------------------
void __fastcall TFMain::UpdateTree(void)
{
  if(!Visible) return;

  AnsiString s;TTreeNodes* I=TreeView->Items;TTreeNode  *LI,*CLI;

  // List
//???Считаем число портов
  int n=1;
  for(int i=0;i<BTPrs.NumPrs;i++,n++)
  {
        for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++,n++);
  }

//Если вершин удерева не равно числу узлов системы
  if(I->Count!=n)
  {

//Очищаем
    I->Clear();

//Вроде можно разрешить всплывающие подсказки

//    TreeView->ToolTips=true;

//!!! тут рисуется дерево

AnsiString spar("");

//Добавляем корневую вершину
//!!!    LI=I->Add(NULL,"Сервер");TreeView->Selected=LI;

     spar.printf("[%s]",BTPrs.Name);
     LI=I->Add(NULL,spar);TreeView->Selected=LI;

//Создаем вершины с портами
    LI->StateIndex=0;

    for(int i=0;i<BTPrs.NumPrs;i++)
    {
      CLI=I->AddChild(LI,"");
      for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++)
      {
        I->AddChild(CLI,"");
       }
    }

    LI->Expanded=true;

    TreeView->FullExpand();

  }


  int iix;

  if(BTPrs.on)  iix=20;
  else          iix=21;

  if(I->GetFirstNode()->ImageIndex!=iix)    I->GetFirstNode()->ImageIndex=iix;
  if(I->GetFirstNode()->SelectedIndex!=iix) I->GetFirstNode()->SelectedIndex=iix;

  n=1;for(int i=0;i<BTPrs.NumPrs;i++,n++)
  {
    iix=BTPrs.Ps[i].p+1;
    //!!!s=(s="COM")+iix;

    s=(s="")+(i+1);

    s+=" ";

    s+="[COM";
    s+=iix;
    s+="]";

    s+=" ";

//!!! Не надо загромождать пока

//    s+=" [";
//    s+=BTPrs.Ps[i].Name;
//    s+="]";

    if(I->Item[n]->Text!=s) I->Item[n]->Text=s;
    if(I->Item[n]->StateIndex!=(i+1)) I->Item[n]->StateIndex=(i+1);

    iix=COMState(BTPrs.Ps+i,&s);
    if(I->Item[n]->ImageIndex!=iix) I->Item[n]->ImageIndex=iix;
    if(I->Item[n]->SelectedIndex!=iix) I->Item[n]->SelectedIndex=iix;

    for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++,n++)
    {
//!!!      s=(s="Датчик ")+(BTPrs.Ps[i].Srs[j]->N+1);

   s=(s="")+(BTPrs.Ps[i].Srs[j]->N+1);

    s+=" ";
/*
    s+=BTPrs.Ps[i].Srs[j]->Name;
*/
    if (BTPrs.Ps[i].Srs[j]->isInd3_211)  s+="ИН-Д3";
    else                                 s+="АН-Д3";

    s+=" [";
    s+=BTPrs.Ps[i].Srs[j]->adr;

    s+="]";


       if(I->Item[n+1]->Text!=s) I->Item[n+1]->Text=s;

//!!!


//Тут перерисовка иконок от состояния датчика

      iix=i+1+(j+1)*256;
      if(I->Item[n+1]->StateIndex!=iix) I->Item[n+1]->StateIndex=iix;

      TBTSensor* S=BTPrs.Ps[i].Srs[j];

      bool On=(S->on)&&(BTPrs.Ps[i].on);

      iix=SrsState(S,&s);

      if(I->Item[n+1]->ImageIndex!=iix) I->Item[n+1]->ImageIndex=iix;

      if(I->Item[n+1]->SelectedIndex!=iix) I->Item[n+1]->SelectedIndex=iix;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::UpdatePortsList(void)
{
  AnsiString s;int iix;TListItems* I=PortsList->Items;TListItem  *LI;
  // List
  if(I->Count!=BTPrs.NumPrs)
  {
    I->Clear();
    for(int i=0;i<BTPrs.NumPrs;i++)
    {
      LI=I->Add();
      LI->SubItems->Add("");LI->SubItems->Add("");
      LI->SubItems->Add("");LI->SubItems->Add("");
      LI->SubItems->Add("");
    }
  }
  // List Items
  for(int i=0;i<BTPrs.NumPrs;i++)
  {
    s=(s="COM")+(BTPrs.Ps[i].p+1);
    if(I->Item[i]->Caption!=s) I->Item[i]->Caption=s;

    iix=COMState(BTPrs.Ps+i,&s);
    if(I->Item[i]->ImageIndex!=iix) I->Item[i]->ImageIndex=iix;
    if(I->Item[i]->SubItems->Strings[0]!=s) I->Item[i]->SubItems->Strings[0]=s;
    s=BTPrs.StrTmOn(i);
    if(I->Item[i]->SubItems->Strings[1]!=s) I->Item[i]->SubItems->Strings[1]=s;
    s=BTPrs.Ps[i].CPrt->bw;
    if(I->Item[i]->SubItems->Strings[2]!=s) I->Item[i]->SubItems->Strings[2]=s;
    s=BTPrs.Ps[i].CPrt->br;
    if(I->Item[i]->SubItems->Strings[3]!=s) I->Item[i]->SubItems->Strings[3]=s;
    s=BTPrs.Ps[i].CPrt->eo;
    if(I->Item[i]->SubItems->Strings[4]!=s) I->Item[i]->SubItems->Strings[4]=s;
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::UpdatePort(void)
{
  TListItems* I=COMList->Items;AnsiString s;
  int ix=TreeView->Selected->StateIndex;
  int i=(ix-1)&0xFF;
  // Сервер
  if(ix==0)
  {
    TSCOM->TabVisible=false;
    return;
  }
  if(I->Count<=0) return;

  //s=((s="COM")+(BTPrs.Ps[i].p+1))+": "+BTPrs.Ps[i].Name;
  s=BTPrs.Ps[i].Name;
  if(I->Item[0]->SubItems->Strings[0]!=s) I->Item[0]->SubItems->Strings[0]=s;
  COMState(BTPrs.Ps+i,&s);
  if(I->Item[1]->SubItems->Strings[0]!=s) I->Item[1]->SubItems->Strings[0]=s;
  s=BTPrs.StrTmOn(i);
  if(I->Item[2]->SubItems->Strings[0]!=s) I->Item[2]->SubItems->Strings[0]=s;
  s=BTPrs.StrTm(i);
  if(I->Item[3]->SubItems->Strings[0]!=s) I->Item[3]->SubItems->Strings[0]=s;
  s=BTPrs.Ps[i].CPrt->bw;
  if(I->Item[4]->SubItems->Strings[0]!=s) I->Item[4]->SubItems->Strings[0]=s;
  s=BTPrs.Ps[i].CPrt->br;
  if(I->Item[5]->SubItems->Strings[0]!=s) I->Item[5]->SubItems->Strings[0]=s;
  s=BTPrs.Ps[i].CPrt->eo;
  if(I->Item[6]->SubItems->Strings[0]!=s) I->Item[6]->SubItems->Strings[0]=s;
  s=BTPrs.Ps[i].CPrt->ew;
  if(I->Item[7]->SubItems->Strings[0]!=s) I->Item[7]->SubItems->Strings[0]=s;
  s=BTPrs.Ps[i].CPrt->er;
  if(I->Item[8]->SubItems->Strings[0]!=s) I->Item[8]->SubItems->Strings[0]=s;
  s=BTPrs.Ps[i].CPrt->ec;
  if(I->Item[9]->SubItems->Strings[0]!=s) I->Item[9]->SubItems->Strings[0]=s;
  s=BTPrs.Ps[i].CPrt->lerr;
  if(I->Item[10]->SubItems->Strings[0]!=s) I->Item[10]->SubItems->Strings[0]=s;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::UpdateSensList(void)
{
  AnsiString s;int iix;TListItems* I=SensList->Items;TListItem  *LI;


   //!!!SetVals();//!!!


  // List
  int NS=BTPrs.NumSens();
  if(I->Count!=NS)
  {
    I->Clear();
    for(int i=0;i<NS;i++)
    {
      LI=I->Add();
      LI->SubItems->Add("");LI->SubItems->Add("");
      LI->SubItems->Add("");LI->SubItems->Add("");
      LI->SubItems->Add("");LI->SubItems->Add("");
      LI->SubItems->Add("");LI->SubItems->Add("");
      LI->SubItems->Add("");
    }
  }
  // List Items
  // Тут перебираем все порты все датчики

  for(int i=0,n=0;i<BTPrs.NumPrs;i++) for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++,n++)
  {
    TBTSensor* S=BTPrs.Ps[i].Srs[j];
    s=(s="Датчик ")+(S->N+1);
    if(I->Item[n]->Caption!=s) I->Item[n]->Caption=s;

    iix=SrsState(S,&s);
    if(I->Item[n]->ImageIndex!=iix) I->Item[n]->ImageIndex=iix;

    if((S->dataon)&&(S->sw.fdr)) s.printf("%+.3f",S->XCur/3600.0);else s="*";
    if(I->Item[n]->SubItems->Strings[0]!=s) I->Item[n]->SubItems->Strings[0]=s;

    if((S->dataon)&&(S->sw.fdr)) s.printf("%+.3f",S->YCur/3600.0);else s="*";
    if(I->Item[n]->SubItems->Strings[1]!=s) I->Item[n]->SubItems->Strings[1]=s;

    // Вкладка Датчики
    if(S->Adataon) s.printf("%.2f",sqrt(S->AXMax*S->AXMax+S->AYMax*S->AYMax));else s="*";
    if(I->Item[n]->SubItems->Strings[2]!=s) I->Item[n]->SubItems->Strings[2]=s;
    if(S->Adataon) s.printf("%.2f",sqrt(S->AXRms*S->AXRms+S->AYRms*S->AYRms));else s="*";
    if(I->Item[n]->SubItems->Strings[3]!=s) I->Item[n]->SubItems->Strings[3]=s;


    if((S->dataon)&&(S->sw.ft5dr)) s.printf("%+.2f",S->TCur);else s="*";
    if(I->Item[n]->SubItems->Strings[4]!=s) I->Item[n]->SubItems->Strings[4]=s;

    //!!!if((S->dataon)&&(S->sw.fthdr)) s.printf("%d",S->ThCur);else s="*";
    else s="*";

    if(I->Item[n]->SubItems->Strings[5]!=s) I->Item[n]->SubItems->Strings[5]=s;

    if(S->isInd3_211==false)
    {
        //!!!if(S->dataon) s.printf("%.1f",S->PwCur);else s="*";
         s="*";
    }
    else s=" ";

    if(I->Item[n]->SubItems->Strings[6]!=s) I->Item[n]->SubItems->Strings[6]=s;

    int type;WORD w=GetSensWState(S);
    s.printf("%2d ",w>>12);for(int i=4;i<16;i++) {if(w&(32768>>i)) s+="1";else s+="0";if((i==3)||(i==7)||(i==11)) s+="*";}
    if(I->Item[n]->SubItems->Strings[7]!=s) I->Item[n]->SubItems->Strings[7]=s;
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::UpdateSrs(void)
{
  TListItems* I=SrsList->Items;AnsiString s;static TBTSensor* S;
  int ix=TreeView->Selected->StateIndex;
  // Сервер или порт
  if(ix<=255)
  {
    TSSrs->TabVisible=false;
    BReset->Enabled=false;BProg->Enabled=false;BD3Set->Enabled=false;
    BFIR1->Enabled=false;CBFIR1->Enabled=false;CBFIR1->Checked=false;
    BFIR2->Enabled=false;CBFIR2->Enabled=false;CBFIR2->Checked=false;
    Btostart->Enabled=false;CBtostart->Enabled=false;CBtostart->Checked=false;
    Bto10->Enabled=false;CBto10->Enabled=false;CBto10->Checked=false;
    BIdle->Enabled=false;CBIdle->Enabled=false;CBIdle->Checked=false;
    BTOut->Enabled=false;CBTOut->Enabled=false;CBTOut->Checked=false;
    Bt5av->Enabled=false;CBt5av->Enabled=false;CBt5av->Checked=false;
    BTermo->Enabled=false;CBTermo->Enabled=false;CBTermo->Checked=false;
    BStack->Enabled=false;CBMStack->Enabled=false;CBMStack->Checked=false;
    BMeteo->Enabled=false;CBMeteo->Enabled=false;CBMeteo->Checked=false;
    BStackOn->Enabled=false;BStackOff->Enabled=false;
    CBStack->Enabled=false;CBStack->Checked=false;SetEnAct(NULL);
    BDAdr->Enabled=false;CBDAdr->Enabled=false;CBDAdr->Checked=false;
    BAcmp->Enabled=false;CBAcmp->Enabled=false;CBAcmp->Checked=false;
    BFIR3->Enabled=false;CBFIR3->Enabled=false;CBFIR3->Checked=false;
    BPwr->Enabled=false;CBPwr->Enabled=false;CBPwr->Checked=false;
    Bn50->Enabled=false;BTmax->Enabled=false;
    BAdr->Enabled=false;
    BBSAdr->Enabled=false;
    //BRQAdr->Enabled=false;
    BReset0->Enabled=false;
    BStack0On->Enabled=false;
    BStack0Off->Enabled=false;
    return;
  }
  if(I->Count<=0) return;

//Тут обновляется форма ДАТЧИК

  int i=(ix-1)&0xFF; int j=(ix-1)/256-1;

//Выбрали нужный датчик из списка нужного порта
  S=BTPrs.Ps[i].Srs[j];

  s=S->Name;

//Привели в соответствие имя ветки имени датчика
  if(I->Item[0]->SubItems->Strings[0]!=s) I->Item[0]->SubItems->Strings[0]=s;

//Индикация текущего состояния датчика
  SrsState(S,&s);
  if(I->Item[1]->SubItems->Strings[0]!=s) I->Item[1]->SubItems->Strings[0]=s;

//В градусах не показываем, только в секундах
  if((S->dataon)&&(S->sw.fdr)) s.printf("%+.3f %+.3f (%+.1f %+.1f)",S->XCur/3600.0,S->YCur/3600.0,S->XCur,S->YCur);
  else                         s.printf("* (%+.1f %+.1f)",S->XCur,S->YCur);

  if(I->Item[2]->SubItems->Strings[0]!=s) I->Item[2]->SubItems->Strings[0]=s;

  //if(S->Adataon) s.printf("%.2f %.1f (%.2f|%.2f %.2f|%+.3f) %d:%d (%d) %d",
  //  S->AMaxAbs,S->AMaxAng,sqrt(S->AXRms*S->AXRms+S->AYRms*S->AYRms),S->AXRms,S->AYRms,S->AXYRms,
  //  S->SBuf.res_pn/PACK_SIZE,S->SBuf.nread,S->SBuf.nread*PACK_SIZE,S->SBuf.nsave);


//Ускорения температура термостат ДЛЯ ИН-Д3 отсутствуют

  if (S->isInd3_211==false)
  {
       I->Item[3]->Caption="Ускорения Ax, Ау, мм/с2";
       //I->Item[4]->Caption="Температура T, град.";
       //I->Item[7]->Caption="Слово состояния";
  }
  else
  {
       I->Item[3]->Caption="*";
       I->Item[4]->Caption="*";
       I->Item[7]->Caption="*";
  }

       I->Item[5]->Caption="*";
       I->Item[6]->Caption="*";


  if (S->isInd3_211==false)
  {
          if(S->Adataon) s.printf("%.2f %.1f (%.2f|%.2f %.2f) %d:%d (%d) %d",
            S->AMaxAbs,S->AMaxAng,sqrt(S->AXRms*S->AXRms+S->AYRms*S->AYRms),S->AXRms,S->AYRms,
            S->SBuf.res_pn/PACK_SIZE,S->SBuf.nread,S->SBuf.nread*PACK_SIZE,S->SBuf.nsave);
          else
            s.printf("* %d:%d (%d) %d",
            S->SBuf.res_pn/PACK_SIZE,S->SBuf.nread,S->SBuf.nread*PACK_SIZE,S->SBuf.nsave);
          if(I->Item[3]->SubItems->Strings[0]!=s) I->Item[3]->SubItems->Strings[0]=s;


  if((S->dataon)&&(S->sw.ft5dr)) s.printf("%+.2f",S->TCur);else s="*";
  if(I->Item[4]->SubItems->Strings[0]!=s) I->Item[4]->SubItems->Strings[0]=s;


  if(!S->isMeteo) s="*";if(S->isMeteo&&!S->Wdataon) s.printf("(%d)",S->wstatus);
  if(S->isMeteo&&S->Wdataon) s.printf("%.3f (%.2f) %.3f (%.2f) (%d)",
      //S->WUAver/100.0,S->WUMax/100.0,S->WVAver/100.0,S->WVMax/100.0,S->wstatus);
      S->WUAver/100.0,S->WURms/100.0,S->WVAver/100.0,S->WVRms/100.0,S->wstatus);
  if(I->Item[5]->SubItems->Strings[0]!=s) I->Item[5]->SubItems->Strings[0]=s;


  //!!!if(S->dataon) s.printf("%.1f (%d)",S->PwCur,S->ThCur);else s="*";

  s="*";

  if(I->Item[6]->SubItems->Strings[0]!=s) I->Item[6]->SubItems->Strings[0]=s;
  }
  else
  {
          s="*";      
          if(I->Item[3]->SubItems->Strings[0]!=s) I->Item[3]->SubItems->Strings[0]=s;
          if(I->Item[4]->SubItems->Strings[0]!=s) I->Item[4]->SubItems->Strings[0]=s;
          if(I->Item[5]->SubItems->Strings[0]!=s) I->Item[5]->SubItems->Strings[0]=s;
          if(I->Item[6]->SubItems->Strings[0]!=s) I->Item[6]->SubItems->Strings[0]=s;
  }


  if(S->dataon)
  {

//Затупилслово состояния для ИН-Д3  
    if (S->isInd3_211) s="*.*";
    else
    {
            s="";
            for(int i=0;i<16;i++)
            {
              if(*((WORD*)(&S->sw))&(32768>>i)) s+="1";else s+="0";
              if((i==3)||(i==7)||(i==11)) s+=" ";
            }
            s+=" : ";
            for(int i=0;i<16;i++)
            {
              if(*((WORD*)(&S->md))&(32768>>i)) s+="1";else s+="0";
              if((i==3)||(i==7)||(i==11)) s+=" ";
            }
    }

    BReset->Enabled=true;BProg->Enabled=true;BD3Set->Enabled=true;
    BFIR1->Enabled=true;CBFIR1->Enabled=true;CBFIR1->Checked=!S->md.nofir1;
    BFIR2->Enabled=true;CBFIR2->Enabled=true;CBFIR2->Checked=!S->md.nofir2;
    Btostart->Enabled=true;CBtostart->Enabled=true;CBtostart->Checked=S->md.tostart;
    Bto10->Enabled=true;CBto10->Enabled=true;CBto10->Checked=S->md.to10;
    BIdle->Enabled=true;CBIdle->Enabled=true;CBIdle->Checked=!S->md.noidle;
    BTOut->Enabled=true;CBTOut->Enabled=true;CBTOut->Checked=!S->md.nod3;
    Bt5av->Enabled=true;CBt5av->Enabled=true;CBt5av->Checked=!S->md.not5av;
    BTermo->Enabled=true;CBTermo->Enabled=true;CBTermo->Checked=!S->md.notrm;
    BStack->Enabled=true;CBMStack->Enabled=true;CBMStack->Checked=!S->md.nostack;
    BMeteo->Enabled=true;CBMeteo->Enabled=true;CBMeteo->Checked=!S->md.nometeo;
    BStackOn->Enabled=true;BStackOff->Enabled=true;
    CBStack->Enabled=true;CBStack->Checked=!S->md.nostack;SetEnAct(S);
    BDAdr->Enabled=true;CBDAdr->Enabled=true;CBDAdr->Checked=!S->md.noadrdet;
    BAcmp->Enabled=true;CBAcmp->Enabled=true;CBAcmp->Checked=!S->md.noacmp;
    BFIR3->Enabled=true;CBFIR3->Enabled=true;CBFIR3->Checked=!S->md.nofir3;
    BPwr->Enabled=true;CBPwr->Enabled=true;CBPwr->Checked=!S->md.nopwr;
    Bn50->Enabled=true;BTmax->Enabled=true;
    BAdr->Enabled=true;
    BBSAdr->Enabled=true;
    BRQAdr->Enabled=true;
    BReset0->Enabled=true;
    BStack0On->Enabled=true;
    BStack0Off->Enabled=true;
  }
  else
  {
    s="*";
    BReset->Enabled=false;BProg->Enabled=false;BD3Set->Enabled=false;
    BFIR1->Enabled=false;CBFIR1->Enabled=false;CBFIR1->Checked=false;
    BFIR2->Enabled=false;CBFIR2->Enabled=false;CBFIR2->Checked=false;
    Btostart->Enabled=false;CBtostart->Enabled=false;CBtostart->Checked=false;
    Bto10->Enabled=false;CBto10->Enabled=false;CBto10->Checked=false;
    BIdle->Enabled=false;CBIdle->Enabled=false;CBIdle->Checked=false;
    BTOut->Enabled=false;CBTOut->Enabled=false;CBTOut->Checked=false;
    Bt5av->Enabled=false;CBt5av->Enabled=false;CBt5av->Checked=false;
    BTermo->Enabled=false;CBTermo->Enabled=false;CBTermo->Checked=false;
    BStack->Enabled=false;CBMStack->Enabled=false;CBMStack->Checked=false;
    BMeteo->Enabled=false;CBMeteo->Enabled=false;CBMeteo->Checked=false;
    BStackOn->Enabled=false;BStackOff->Enabled=false;
    CBStack->Enabled=false;CBStack->Checked=false;SetEnAct(S);
    BDAdr->Enabled=false;CBDAdr->Enabled=false;CBDAdr->Checked=false;
    BAcmp->Enabled=false;CBAcmp->Enabled=false;CBAcmp->Checked=false;
    BFIR3->Enabled=false;CBFIR3->Enabled=false;CBFIR3->Checked=false;
    BPwr->Enabled=false;CBPwr->Enabled=false;CBPwr->Checked=false;
    Bn50->Enabled=false;BTmax->Enabled=false;
    BAdr->Enabled=false;
    BBSAdr->Enabled=false;
  }
  if(I->Item[7]->SubItems->Strings[0]!=s) I->Item[7]->SubItems->Strings[0]=s;

  if(S->porton&(S->Tm_Stop>S->Tm_Start))
  {
    s.printf("%.3f|%.8f",S->Tm_Stop-S->Tm_Start,S->DTm_GetAll);
    double tm=S->Tm_fdr;
    if(tm>0.0)
    {
      tm=Now()-tm;if(tm>=1.0/24.0) tm=(1.0-1/60.0/60.0)/24.0;
      s+="|"+FormatDateTime("nn:ss",tm);
    }
  }
  else s="*";
  if(I->Item[8]->SubItems->Strings[0]!=s) I->Item[8]->SubItems->Strings[0]=s;

  if(S->on&&S->porton) s=S->er;else s="*";
  if(I->Item[9]->SubItems->Strings[0]!=s) I->Item[9]->SubItems->Strings[0]=s;

  if(S->on&&S->porton) s=S->ec;else s="*";
  if(I->Item[10]->SubItems->Strings[0]!=s) I->Item[10]->SubItems->Strings[0]=s;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::UpdateStat(void)
{
  AnsiString s,s1;bool srs;static TBTSensor* S;
  int ix=TreeView->Selected->StateIndex;
  if(CBFile->Checked!=CanSave)   CBFile->Checked=CanSave;
  if(ACanSave->Checked!=CanSave) ACanSave->Checked=CanSave;
  if(ix>255)
  {
    S=BTPrs.Ps[(ix-1)&0xFF].Srs[(ix-1)/256-1];
    if(CBStat->Checked) s=S->d3stat.sn;else s="*";if(Esn->Text!=s) Esn->Text=s;
    if(CBStat->Checked) s=S->d3stat.te;else s="*";if(Ete->Text!=s) Ete->Text=s;
    if(CBStat->Checked) s=S->d3stat.re;else s="*";if(Ere->Text!=s) Ere->Text=s;
    if(CBStat->Checked) s=S->d3stat.ce;else s="*";if(Ece->Text!=s) Ece->Text=s;

    if(CBStat->Checked) s=(s=S->res_err.dr)+":"+(s=S->res_err.drz); else s="*";if(Eedr->Text!=s)  Eedr->Text=s;
    if(CBStat->Checked) s=S->res_err.te; else s="*";if(Eete->Text!=s)  Eete->Text=s;
    if(CBStat->Checked) s=S->res_err.re; else s="*";if(Eere->Text!=s)  Eere->Text=s;
    if(CBStat->Checked) s=S->res_err.ce; else s="*";if(Eece->Text!=s)  Eece->Text=s;

    if(CBStat->Checked) s=S->t5stat.sn;else s="*";if(Etsn->Text!=s) Etsn->Text=s;
    if(CBStat->Checked) s=S->t5stat.te;else s="*";if(Ette->Text!=s) Ette->Text=s;
    if(CBStat->Checked) s=S->t5stat.re;else s="*";if(Etre->Text!=s) Etre->Text=s;
    if(CBStat->Checked) s=S->t5stat.ae;else s="*";if(Etae->Text!=s) Etae->Text=s;

    // 1.0.2 isMeteo
    TSWBuf* SWB=&S->SWBuf;
    if(CBStat->Checked&&S->isMeteo) s.printf("%d:%d",SWB->nread,S->mwstat.sn);else s="*";if(EWsn->Text!=s) EWsn->Text=s;
    if(CBStat->Checked&&S->isMeteo) s.printf("%d",S->mwstat.te);else s="*";if(EWte->Text!=s) EWte->Text=s;
    if(CBStat->Checked&&S->isMeteo) s.printf("%d",S->mwstat.ce);else s="*";if(EWce->Text!=s) EWce->Text=s;
    if(CBStat->Checked&&S->isMeteo) s.printf("%d",S->mwstat.se);else s="*";if(EWse->Text!=s) EWse->Text=s;


    s.printf("%+.1f",S->XCur); ELX->Text=s;
    s.printf("%+.1f",S->YCur); ELY->Text=s;

    TSBuf* SB=&S->SBuf;
    s.printf("%d.%d:%d:%d|%d:%d (%d:%d)",SB->nread/SrsBufPSize,SB->nread,SB->nmiss,SB->ecount,
            SB->ncalc,SB->nsave,SB->nmeas,SB->res_pn);
    s+=FormatDateTime(" hh:nn:ss.zzz ",S->Tm_pn);s+="("+(s1=S->pn_Tm)+")";
    if(Ecpn->Text!=s) Ecpn->Text=s;

    BS4I1_D3Packet* BP=NULL;
    if(SB->ncalc>0)
    {
      BP=&S->SBuf.Packet_buf[(SB->ncalc-1)%SrsBufPSize];
      s.printf("%.6f (%.3f)",S->d3r_tm*25e-6,(BP->spCT-BP->stCT)*25e-6);
      if(EdpCT->Text!=s) EdpCT->Text=s;
      double dt=(BP->spCT+BP->tmpCT*65536.0*65536.0)*25.0*1e-6/1000.0/3600.0/24.0;
      DWORD hs=dt*24.0;s=hs;s+=FormatDateTime(":nn:ss.zzz",dt-hs/24.0);
      //s.printf("%.6f",(BP->stCT+BP->tmCT*65536.0*65536.0)*25.0*1e-6);
      s+=FormatDateTime(" (dd hh:nn:ss.zzz)",SB->Time_buf[(SB->ncalc-1)%SrsBufPSize]);
      if(Eptm->Text!=s) Eptm->Text=s;
    }
    else { if(Eptm->Text!="*") Eptm->Text="*";if(EdpCT->Text!="*") EdpCT->Text="*";}

    if(CBStat->Checked&&(BP!=NULL)) s=BP->drz;else s="*";if(Epdrz->Text!=s) Epdrz->Text=s;
    if(CBStat->Checked&&(BP!=NULL)) s=BP->ne;else s="*";if(Epne->Text!=s) Epne->Text=s;

    s.printf("%u|%2d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%X (%d|%d)",S->stp.sys_frq,S->stp.adr,S->stp.d3adr,
                                 S->stp.d3maxadr,S->stp.rb1,S->stp.t5nav,S->stp.t5nerr,
                                 S->stp.t5hmin,S->stp.neadr,S->stp.nte,S->stp.nce,S->stp.nre,S->stp.ndr,
                                 S->stp.ntrm,S->stp.nthrd,S->stp.n50,*(WORD*)&S->stp.md,S->NVMCur,S->NVMSize);
    if(ERStp->Text!=s) ERStp->Text=s;

    int A,ID=0;
    if(CBStat->Checked)
    {
      double dt;int hs;byte* pb=(byte*)&S->UCmd.info;
      switch(S->UCmd.infoix)
      {
        case 0: s=S->UCmd.info;break;
        case 1: s=S->UCmd.info;break;
        case 2: s=S->UCmd.info&0xFFFF;break;
        case 3: s=S->UCmd.info&0xFFFF;break;
        case 4: s=(s=((S->UCmd.info&0xFFFFFF)/65536))+"."+(s=((S->UCmd.info&0xFFFF)/256))+"."+(s=((S->UCmd.info&0xFFFF)%256));break;
        case 5: A=S->UCmd.info&0xFF;s=A;
                for(int i=0;i<D3List.Num;i++) if(D3List.A[i]==A) {ID=D3List.ID[i];break;}
                if(ID>0) s=s+":"+(s=ID);
                break;
        case 6: dt=S->UCmd.info/10.0/3600.0/24.0;
                hs=dt*24.0;s=hs;s+=FormatDateTime(":nn:ss",dt-hs/24.0);
                break;
        case 7: s.printf("%.6f",S->UCmd.info*25e-6);break;
        case 8: s.printf("%.2f",*(float*)&S->UCmd.info);
                break;
        case 9: s=S->UCmd.info&0xFFFF;break;
        //case 10:s.printf("%.1f (%.1f)",S->UCmd.info/1024.0*3.3*6,S->UCmd.info/1024.0*3.3*11);break;  // AN10
        case 10:s.printf("%.1f\t%.1f",S->UCmd.info/1024.0*3.3*6,S->UCmd.info/1024.0*3.3*11);break;  // AN10
        case 11:s=S->UCmd.info;break; // AN11
        case 12:s.printf("%d%d:%d%d:%d%d",pb[3]>>4,pb[3]&0xF,pb[2]>>4,pb[2]&0xF,pb[1]>>4,pb[1]&0xF);break; // RTCC Time
        case 13:s.printf("%d%d.%d%d.%d%d",pb[1]>>4,pb[1]&0xF,pb[2]>>4,pb[2]&0xF,pb[3]>>4,pb[3]&0xF);break; // RTCC Date
        case 14:s.printf("%X",S->UCmd.info);break; // Flash ID
        case 15:s.printf("%X",S->UCmd.info);break; // Read Flash
        case 16:s.printf("%X",S->UCmd.info&0xFF);break; // Flash status
      }
    } else s="*";
    if(EInfo->Text!=s) EInfo->Text=s;
  }
  else
  {
    if(Esn->Text!="*") Esn->Text="*";if(Ete->Text!="*") Ete->Text="*";
    if(Ere->Text!="*") Ere->Text="*";if(Ece->Text!="*") Ece->Text="*";

    if(Eedr->Text!="*")  Eedr->Text="*";
    if(Eete->Text!="*")  Eete->Text="*";
    if(Eere->Text!="*")  Eere->Text="*";
    if(Eece->Text!="*")  Eece->Text="*";

    if(Etsn->Text!="*") Etsn->Text="*";if(Ette->Text!="*") Ette->Text="*";
    if(Etre->Text!="*") Etre->Text="*";if(Etae->Text!="*") Etae->Text="*";

    if(EInfo->Text!="*") EInfo->Text="*";

    if(Ecpn->Text!="*")  Ecpn->Text="*";
    if(ERStp->Text!="*") ERStp->Text="*";
    if(EdpCT->Text!="*") EdpCT->Text="*";

    if(Eptm->Text!="*") Eptm->Text="*";
    if(Epdrz->Text!="*") Epdrz->Text="*";
    if(Epne->Text!="*") Epne->Text="*";
    if(Epr1->Text!="*") Epr1->Text="*";

    if(EWsn->Text!="*") EWsn->Text="*";
    if(EWte->Text!="*") EWte->Text="*";
    if(EWce->Text!="*") EWce->Text="*";
    if(EWse->Text!="*") EWse->Text="*";
  }
}
//---------------------------------------------------------------------------
AnsiString SSrv[100],SPrt[100],SSrs[100];bool CanCopy;
void __fastcall TFMain::UpdateTV(void)
{
  if(TreeView->Selected==NULL) return;
  int ixx=TreeView->Selected->StateIndex;
  int ix=0;AnsiString s;
  int i=(ixx-1)&0xFF;int j=(ixx-1)/256-1;
  if(ixx==0)
  {
    TTreeNodes* I=TVSrv->Items;TTreeNode  *LI,*CLI;
    AnsiString* S=SSrv;
    bool a=(I->Count==0);
    if(a)(LI=I->Add(NULL,"Сервер"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"Коментарий"))->Data=S+ix;S[ix]=BTPrs.Name;ix++;
    if(a)(CLI=I->AddChild(LI,"IP порт"))->Data=S+ix;S[ix]=Server1->Port;ix++;

    if(a)LI->Expanded=true;
    if(a)(LI=I->Add(NULL,"Timers"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"TmUpdateInt"))->Data=S+ix;S[ix]=TmUpdate->Interval;ix++;
    if(a)(CLI=I->AddChild(LI,"TmRun"))->Data=S+ix;S[ix]=TmRun->Interval;ix++;
    if(a)(CLI=I->AddChild(LI,"TmStart"))->Data=S+ix;S[ix]=TmStart->Interval;ix++;
    if(a)(CLI=I->AddChild(LI,"TmSave"))->Data=S+ix;S[ix]=TmSave->Interval;ix++;
    if(a)LI->Expanded=false;
    if(a)(LI=I->Add(NULL,"Pauses"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"PPauseTick"))->Data=S+ix;S[ix]=PPauseTick;ix++;
    if(a)(CLI=I->AddChild(LI,"PReOpen"))->Data=S+ix;S[ix]=PReOpen;ix++;
    if(a)(CLI=I->AddChild(LI,"PClose"))->Data=S+ix;S[ix]=PClose;ix++;
    if(a)(CLI=I->AddChild(LI,"PExit"))->Data=S+ix;S[ix]=PExit;ix++;
    if(a)LI->Expanded=false;

    if(a)(LI=I->Add(NULL,"Sleeps"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"SAdrChange"))->Data=S+ix;S[ix]=SAdrChange;ix++;
    if(a)(CLI=I->AddChild(LI,"SIdle"))->Data=S+ix;S[ix]=SIdle;ix++;
    if(a)(CLI=I->AddChild(LI,"SRError"))->Data=S+ix;S[ix]=SRError;ix++;
    if(a)(CLI=I->AddChild(LI,"SCRCError"))->Data=S+ix;S[ix]=SCRCError;ix++;
    if(a)LI->Expanded=false;

    if(a)(LI=I->Add(NULL,"TimeOuts"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"TORCom"))->Data=S+ix;     S[ix]=TORCom;ix++;
    if(a)(CLI=I->AddChild(LI,"TOWCom"))->Data=S+ix;     S[ix]=TOWCom;ix++;
    if(a)(CLI=I->AddChild(LI,"TORDat"))->Data=S+ix;     S[ix]=TORDat;ix++;
    if(a)(CLI=I->AddChild(LI,"TOWDat"))->Data=S+ix;     S[ix]=TOWDat;ix++;
    if(a)LI->Expanded=false;

    if(a)(LI=I->Add(NULL,"Errors"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"NumRErrSrs"))->Data=S+ix;S[ix]=NumRErrSrs;ix++;
    if(a)(CLI=I->AddChild(LI,"NumCErrSrs"))->Data=S+ix;S[ix]=NumCErrSrs;ix++;
    if(a)LI->Expanded=false;

    if(a)(LI=I->Add(NULL,"Дополнительно"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"Сохранять в файле"))->Data=S+ix;CanSave?S[ix]="Да":S[ix]="Нет";ix++;

    if(a)(CLI=I->AddChild(LI,"Отображать записей"))->Data=S+ix;S[ix]=MEMO_COUNT;ix++;
    if(a)(CLI=I->AddChild(LI,"Очищать записей"))->Data=S+ix;S[ix]=MEMO_DEL;ix++;

    if(a)(CLI=I->AddChild(LI,"Сворачивать в трей при запуске"))->Data=S+ix;fOpenHid?S[ix]="Да":S[ix]="Нет";ix++;

    if(a)(CLI=I->AddChild(LI,"Предупреждать при завершении работы"))->Data=S+ix;!fCanclose?S[ix]="Да":S[ix]="Нет";ix++;


    if(a)(CLI=I->AddChild(LI,"Разрешить запуск копии"))->Data=S+ix;CanCopy?S[ix]="Да":S[ix]="Нет";ix++;
    if(a)(CLI=I->AddChild(LI,"Разрешить настройку"))->Data=S+ix;TSTest->TabVisible?S[ix]="Да":S[ix]="Нет";ix++;
    if(a)(CLI=I->AddChild(LI,"Буфер акселерометра"))->Data=S+ix;
      S[ix]="RAM: "+(s=SrsBufPSize*PACK_SIZE)+" ("+(s=PACK_SIZE)+"|"+(s=SrsBufPSize)+"|2x"+(s=(2*SrsBufPSize*PACK_SIZE/1024))+" kБ) File: "+
            (s=SrsBufPSize*SrsBufToSave*PACK_SIZE)+" ("+(s=SrsBufPSize*PACK_SIZE)+"|"+(s=(SrsBufToSave))+"|2x"+(s=(2*SrsBufPSize*PACK_SIZE*SrsBufToSave/1024))+" kБ)";ix++;
    if(a)LI->Expanded=false;
    if(a)TVSrv->TopItem=I->GetFirstNode();
    if(TVSrv->Visible) TVSrv->Repaint();
    TVSrv->Visible=true;TVPrt->Visible=false;TVSrs->Visible=false;
  }
  if((ixx>0)&&(ixx<=255))
  {
    TTreeNodes* I=TVPrt->Items;TTreeNode  *LI,*CLI;
    AnsiString* S=SPrt;
    bool a=(I->Count==0);
    if(a)(LI=I->Add(NULL,"Порт"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"Коментарий"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Name;ix++;
    if(a)(CLI=I->AddChild(LI,"Включен"))->Data=S+ix;BTPrs.Ps[i].on?S[ix]="Да":S[ix]="Нет";ix++;
    if(a)(CLI=I->AddChild(LI,"Номер"))->Data=S+ix;S[ix]=(s="COM")+(BTPrs.Ps[i].p+1);ix++;
    if(a)(CLI=I->AddChild(LI,"BaudRate"))->Data=S+ix;S[ix]=BTPrs.Ps[i].CPrt->dcb.BaudRate;ix++;
    if(a)LI->Expanded=true;
    if(a)TVPrt->TopItem=I->GetFirstNode();
    if(TVPrt->Visible) TVPrt->Repaint();
    TVSrv->Visible=false;TVPrt->Visible=true;TVSrs->Visible=false;
  }
  if(ixx>255)
  {
    TTreeNodes* I=TVSrs->Items;TTreeNode  *LI,*CLI;
    AnsiString* S=SSrs;
    bool a=(I->Count==0);
    if(a)(LI=I->Add(NULL,"Датчик"))->Data=S+ix;S[ix]="";ix++;
    if(a)(CLI=I->AddChild(LI,"Коментарий"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Srs[j]->Name;ix++;
    if(a)(CLI=I->AddChild(LI,"Опрос"))->Data=S+ix;BTPrs.Ps[i].Srs[j]->on?S[ix]="Да":S[ix]="Нет";ix++;
    if(a)(CLI=I->AddChild(LI,"Порядковый номер"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Srs[j]->N+1;ix++;
    if(a)(CLI=I->AddChild(LI,"Адрес на линии"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Srs[j]->adr;ix++;
    if(a)(CLI=I->AddChild(LI,"Серийный номер"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Srs[j]->SND3;ix++;
    if(a)LI->Expanded=true;
    if(a)(LI=I->Add(NULL,"Юстировка"))->Data=S+ix;S[ix]="";ix++;

    s.printf("%+.3f (%+.1f)",BTPrs.Ps[i].Srs[j]->X0/3600.0,BTPrs.Ps[i].Srs[j]->X0);
    if(a)(CLI=I->AddChild(LI,"Смещение Мх, град. (угл. сек.)"))->Data=S+ix;S[ix]=s;ix++;
    s.printf("%+.3f (%+.1f)",BTPrs.Ps[i].Srs[j]->Y0/3600.0,BTPrs.Ps[i].Srs[j]->Y0);
    if(a)(CLI=I->AddChild(LI,"Смещение Мy, град. (угл. сек.)"))->Data=S+ix;S[ix]=s;ix++;
    s.printf("%+.2f",BTPrs.Ps[i].Srs[j]->T0);

// ИН-Д3
    if (BTPrs.Ps[i].Srs[j]->isInd3_211) s="*";

    if(a)(CLI=I->AddChild(LI,"Смещение T, град."))->Data=S+ix;S[ix]=s;ix++;

    if(a)(CLI=I->AddChild(LI,"Инверсия оси Y"))->Data=S+ix;BTPrs.Ps[i].Srs[j]->InvY?S[ix]="Да":S[ix]="Нет";ix++;
    s.printf("%+.2f",BTPrs.Ps[i].Srs[j]->RotX);
    if(a)(CLI=I->AddChild(LI,"Поворот оси X, град."))->Data=S+ix;S[ix]=s;ix++;

    if(a)(CLI=I->AddChild(LI,"Дата установки"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Srs[j]->SetData;ix++;
    if(a)(CLI=I->AddChild(LI,"Дата последней юстировки"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Srs[j]->AdjData;ix++;
    if(a)(CLI=I->AddChild(LI,"Примечание"))->Data=S+ix;S[ix]=BTPrs.Ps[i].Srs[j]->Note;ix++;
    if(a)LI->Expanded=false;
    if(a)TVSrs->TopItem=I->GetFirstNode();
    if(TVSrs->Visible) TVSrs->Repaint();
    TVSrv->Visible=false;TVPrt->Visible=false;TVSrs->Visible=true;
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::UpdateLog(void)
{
  AnsiString sp,sd,s;int t;
  if(!BTPrs.on) return;
  // Порты
  for(int i=0;i<BTPrs.NumPrs;i++)
  {
    COMState(BTPrs.Ps+i,&s);
    sp=(s="COM")+(BTPrs.Ps[i].p+1);
    DWORD w=BTPrs.GetWState(i);
    if(w!=BTPrs.GetOldWState(i)) switch(w)
    {
      case 0: AddMessage(1,"Сервер: Порт "+sp+" включен");break;
      case 1: AddMessage(3,"Сервер: Ошибка инициализации порта "+sp);break;
      case 2: AddMessage(3,"Сервер: Ошибка записи в порт "+sp);break;
      case 3: AddMessage(0,"Сервер: Порт "+sp+" отключен");break;
    }
    if(w!=0) continue;
    for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++)
    {
      TBTSensor* S=BTPrs.Ps[i].Srs[j];
      SrsState(S,NULL);
      sd=S->N+1;
      if(S->oldSrsState!=S->SrsState) switch(S->SrsState)
      {
        case 0: AddMessage(0,sp+": Датчик "+sd+" отключен");break;
        case 1: AddMessage(0,sp+": Опрос датчика "+sd+" отключен");break;
        case 2: AddMessage(3,sp+": Ошибки CRC датчикa "+sd+"");break;
        case 3: AddMessage(3,sp+": Датчик "+sd+" не отвечает");break;
        case 4: AddMessage(2,sp+": Ожидание ответа датчика "+sd+"");break;
        case 5: AddMessage(1,sp+": Получен ответ датчика "+sd+"");{*(WORD*)&S->oldsw=0x000F;S->oldsw.ftrm=1;} break;
      }
      S->oldSrsState=S->SrsState;
      if(S->SrsState!=5) continue;
      if(*(WORD*)&S->sw==*(WORD*)&S->oldsw) continue;
      sd=((sd="Датчик ")+(S->N+1))+": ";

//Для ИН-Д3 функций не существует

      if (S->isInd3_211==false)
      {
      
      if(S->oldsw.frst!=S->sw.frst)   { S->oldsw.frst=S->sw.frst;  if(!S->sw.frst)  AddMessage(0,sd+"Перезагрузка");}
      if(S->oldsw.ftrm!=S->sw.ftrm)   { S->oldsw.ftrm=S->sw.ftrm;  if(S->sw.ftrm)   AddMessage(0,sd+"Терморегулятор включен");   else AddMessage(0,sd+"Терморегулятор отключен");}
      if(S->oldsw.fdr!=S->sw.fdr)     { S->oldsw.fdr=S->sw.fdr;    if(!S->sw.fdr)   AddMessage(2,sd+"Ожидание ответа ИН-Д3");    else AddMessage(1,sd+"Получен ответ ИН-Д3");}

      if(S->oldsw.ft5dr!=S->sw.ft5dr) { S->oldsw.ft5dr=S->sw.ft5dr;if(!S->sw.ft5dr) AddMessage(2,sd+"Ожидание ответа TMP05");    else AddMessage(1,sd+"Получен ответ TMP05");}
      if(S->oldsw.fthdr!=S->sw.fthdr) { S->oldsw.fthdr=S->sw.fthdr;if(!S->sw.fthdr) AddMessage(2,sd+"Ожидание ответа тахометра");else AddMessage(1,sd+"Получен ответ тахометра");}



      if(S->oldsw.fte!=S->sw.fte) { S->oldsw.fte=S->sw.fte;if(S->sw.fte) AddMessage(3,sd+"ИН-Д3 не отвечает");}
      if(S->oldsw.fce!=S->sw.fce) { S->oldsw.fce=S->sw.fce;if(S->sw.fce) AddMessage(3,sd+"Ошибки CRC ИН-Д3");}
      if(S->oldsw.fre!=S->sw.fre) { S->oldsw.fre=S->sw.fre;if(S->sw.fre) AddMessage(3,sd+"Ошибки диапазона ИН-Д3");}

      if(S->oldsw.ft5te!=S->sw.ft5te) { S->oldsw.ft5te=S->sw.ft5te;if(S->sw.ft5te) AddMessage(3,sd+"TMP05 не отвечает");}
      if(S->oldsw.ft5re!=S->sw.ft5re) { S->oldsw.ft5re=S->sw.ft5re;if(S->sw.ft5re) AddMessage(3,sd+"Ошибки диапазона TMP05");}
      if(S->oldsw.fthre!=S->sw.fthre) { S->oldsw.fthre=S->sw.fthre;if(S->sw.fthre) AddMessage(3,sd+"Вентилятор не работает");    else AddMessage(1,sd+"Вентилятор работает");}
      if(S->oldsw.ftrme!=S->sw.ftrme) { S->oldsw.ftrme=S->sw.ftrme;if(S->sw.ftrme) AddMessage(3,sd+"Терморегулятор не работает");else AddMessage(1,sd+"Терморегулятор работает");}

      if(S->oldsw.fadr!=S->sw.fadr) { S->oldsw.fadr=S->sw.fadr;if(S->sw.fadr) AddMessage(0,sd+"Поиск адреса ИН-Д3");}
      }

    }
  }
  BTPrs.oldwstate=BTPrs.wstate;
}
//---------------------------------------------------------------------------
// !!! Gorizont
//void __fastcall TFMain::UpdateTray(void) {if(Tray->IconIndex!=9) Tray->IconIndex=9;}
//void __fastcall TFMain::UpdateTray(void) {if(Tray->IconIndex!=8) Tray->IconIndex=8;}
//---------------------------------------------------------------------------

