#include "string.h"
#include "Unit1.h"
#include "Unit_AND3Tune.h"

AnsiString sSensorSelected("");
                                                                                             
//---------------------------------------------------------------------------
void __fastcall TFMain::PortsMenuPopup(TObject *Sender)
{
  AnsiString s;
  if(TreeView->Selected!=NULL) TreeView->Selected=TreeView->Selected;

  MPortOn->Visible=false;MPortDel->Visible=false;MPortAdd->Visible=false;
  MSensOn->Visible=false;MSensDel->Visible=false;MSensAdd->Visible=false;

  if(TreeView->Focused()) if(TreeView->Selected!=NULL)
  {
    int ix=TreeView->Selected->StateIndex;
    // Сервер
    if(ix==0)
    {
        MPortAdd->Visible=true;
        MSetup->Enabled=true;
        MSetup->Caption="Настройка конфигурации системы мониторинга [Система]";
    }

    // Порт
    if((ix>=1)&&(ix<=255))
    {
        MSetup->Enabled=true;
        MSetup->Caption="Настройка конфигурации системы мониторинга [Порт]";

      MPortOn->Visible=true;MPortDel->Visible=true;MPortDel->Enabled=true;
      MPortDel->Enabled=!BTPrs.Ps[ix-1].on;
      s="COM";s+=(BTPrs.Ps[ix-1].p+1);
      MPortOn->Enabled=true;
//      MPortOn->Caption=(BTPrs.Ps[ix-1].on)?("Отключить порт "+s):("Подключить порт "+s);

     MPortOn->Caption=(BTPrs.Ps[ix-1].on)?("Отключить опрос "+s):("Включить опрос "+s);


//!!!
      MPortDel->Caption="Удалить порт "+s;

       AnsiString spar;

      /*
      if (BTPrs.Ps[ix-1].CPrt->Protocol211!=NULL)
      {
              MPortDel->Caption="Настройка датчиков ИН-Д3 на линии "+s;
              if (BTPrs.Ps[ix-1].on) MPortDel->Enabled=true;
              else  MPortDel->Enabled=false;

      }
       else
      {
              MPortDel->Caption="Настройка датчиков АН-Д3 на линии "+s;

              spar.printf("Сканирование и настройка датчиков АН-Д3 [%s]",s);

//              this->MMenu_and3->Caption=spar;

//              MPortDel->Enabled=false;
              MPortDel->Enabled=true;
      }
       */

      MSensAdd->Visible=true;

      //!!!for(int i=0;i<MaxNumSrs;i++) MSensAdd->Items[i]->Enabled=true;

      int n=0;
      //for(int i=0;i<BTPrs.NumPrs;i++)
        //for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++,n++)
            //MSensAdd->Items[BTPrs.Ps[i].Srs[j]->N]->Enabled=false;

      //!!!MSensAdd->Enabled=(n<MaxNumSrs)&&(!BTPrs.Ps[ix-1].on);
      MSensAdd->Enabled=true;


    }
    // Датчик
    if(ix>256)
    {

      MSetup->Enabled=true;
      MSetup->Caption="Настройка конфигурации системы мониторинга [Датчик]";

      MSensOn->Visible=true;MSensDel->Visible=true;MSensDel->Enabled=true;
      int j=(ix-1)/256-1;int i=(ix-1)&0xFF;
      s="ДАТЧИК № ";s+=(BTPrs.Ps[i].Srs[j]->N+1);

      MSensOn->Enabled=true;
      //MSensOn->Caption=(BTPrs.Ps[i].Srs[j]->on)?("Отключить "+s):("Подключить "+s);
      MSensOn->Caption=(BTPrs.Ps[i].Srs[j]->on)?("Выключить опрос "+s):("Включить опрос "+s);

      MSensDel->Caption="Удалить "+s;
      sSensorSelected=s;
      //!!!MSensDel->Enabled=!BTPrs.Ps[i].on;

    }
  }
  MPortAdd->Enabled=(BTPrs.NumPrs<MaxPrsSel)&&(BTPrs.NumPrs<MaxNumPrs);

  /*
  for(int i=0;i<MaxPrsSel;i++)
  {
    if(i<16) MPortAdd->Items[i]->Enabled=true;
    else     MPortAdd->Items[16]->Items[i-16]->Enabled=true;
  }

  for(int i=0;i<BTPrs.NumPrs;i++)
  {
    int ix=BTPrs.Ps[i].p;
    if(ix<16) MPortAdd->Items[ix]->Enabled=false;
    else      MPortAdd->Items[16]->Items[ix-16]->Enabled=false;
  }
  */

  if(!TSTest->TabVisible)
  {
         MPortDel->Enabled=true;
         MPortAdd->Enabled=true;

//!!!    MPortOn->Enabled=false;
//!!!    MPortDel->Enabled=false;
//!!!    MPortAdd->Enabled=false;
//!!!    MSensOn->Enabled=false;
//!!!    MSensDel->Enabled=false;


//    MSensDel->Enabled=true;

//!!!    MSensAdd->Enabled=false;
//!!!    MSetup->Enabled=false;
  }

//  IND3Tune(TreeView->Selected);

}
//---------------------------------------------------------------------------
void __fastcall TFMain::MPortOnClick(TObject *Sender)
{
   int ix=TreeView->Selected->StateIndex;
   if(BTPrs.Ps[ix-1].on) { BTPrs.Stop(ix-1);}
   else                  { BTPrs.Run(ix-1);}
}
//---------------------------------------------------------------------------
void __fastcall TFMain::MPortDelClick(TObject *Sender)
{

 this->SysConfMaster.PortDelete(nPortSelected);

//  IND3Tune(TreeView->Selected);

/*//!!!
  int ix=TreeView->Selected->StateIndex;
  BTPrs.Ps[ix-1].NumPSrs=0;BTPrs.Delete(ix-1);
  TreeView->Items->Delete(TreeView->Selected);
*/

 return;

}
//---------------------------------------------------------------------------
void __fastcall TFMain::MSensOnClick(TObject *Sender)
{
  int ix=TreeView->Selected->StateIndex;
  int j=(ix-1)/256-1;int i=(ix-1)&0xFF;
  BTPrs.Ps[i].Srs[j]->on=!BTPrs.Ps[i].Srs[j]->on;
  if(BTPrs.Ps[i].Srs[j]->on) {BTPrs.Ps[i].Srs[j]->er=0;BTPrs.Ps[i].Srs[j]->ec=0;}
  BTPrs.Ps[i].Srs[j]->Tm_Start=BTPrs.Ps[i].Srs[j]->Tm_Stop=CoreTime();
  BTPrs.Ps[i].Srs[j]->dataon=false;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::MSensDelClick(TObject *Sender)
{

  int ix=TreeView->Selected->StateIndex;
  int j=(ix-1)/256-1;int i=(ix-1)&0xFF;
  BTPrs.Ps[i].Srs[j]->on=false;
  BTPrs.Ps[i].Srs[j]->SBuf.InitBuf(false);

  char msg[1024];
  sprintf(msg,"Вы действительно хотите удалить из системы %s?",sSensorSelected);

  if (MessageBox(NULL,msg,"ВНИМАНИЕ!",1)!=IDOK) return;

  this->SysConfMaster.SensorDelete(i+1,j+1);

  for(int k=j;k<(BTPrs.Ps[i].NumPSrs-1);k++) BTPrs.Ps[i].Srs[k]=BTPrs.Ps[i].Srs[k+1];BTPrs.Ps[i].NumPSrs--;
  TreeView->Items->Delete(TreeView->Selected);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::MSrsClick(TObject *Sender)
{
  AnsiString s;
  for(int N=0;N<MaxNumSrs;N++)
  {
    if((MSensAdd->Items[N])==Sender)
    {
      int i=(TreeView->Selected->StateIndex-1)&0xFF;
      int NSrs=BTPrs.Ps[i].NumPSrs;
      BTPrs.Ps[i].Srs[NSrs]=BTSrs+N;BTPrs.Ps[i].NumPSrs++;
      BTPrs.Ps[i].Srs[NSrs]->SBuf.InitBuf(true);
      BTPrs.Ps[i].Srs[NSrs]->Name=(s="Датчик ")+(N+1);
      BTPrs.Ps[i].Srs[NSrs]->on=false;
      BTPrs.Ps[i].Srs[NSrs]->Tm_Start=BTPrs.Ps[i].Srs[NSrs]->Tm_Stop=CoreTime();
      BTPrs.Ps[i].Srs[NSrs]->er=0;BTPrs.Ps[i].Srs[NSrs]->ec=0;
      BTPrs.Ps[i].Srs[NSrs]->N=N;
      BTPrs.Ps[i].Srs[NSrs]->porton=BTPrs.Ps[i].on;
      BTPrs.Ps[i].Srs[NSrs]->dataon=false;
      TreeView->Items->AddChild(TreeView->Selected,"");
      TreeView->Selected->Expanded=true;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::MCOMClick(TObject *Sender)
{
//!!!
/*
  int i;
  for(i=0;i<MaxPrsSel;i++)
  {
    if(i<16) { if(MPortAdd->Items[i]==Sender) break;}
    else     { if(MPortAdd->Items[16]->Items[i-16]==Sender) break;}
  }
  BTPrs.Add(i);
  TreeView->Items->AddChild(TreeView->Items->GetFirstNode(),"");
  TreeView->Items->GetFirstNode()->Expanded=true;
*/

}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

// ИН-Д3

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------


void TFMain::IND3Tune(TTreeNode*  node)
{

   AnsiString tname("");
   AnsiString port_name("");
   AnsiString sens_name("");
   TCOMPort* com_port=NULL;
   int threadnum=-1;

   tname=node->Text;

  if (strstr(tname.c_str(),"COM"))
  {
//Если это порт то имя датчика неизвестно
                port_name=tname;
  }
  else
  {

//Если это датчик достаем имя порта из родителя
                  port_name=node->Parent->Text;
                  sens_name=tname;
   }

 //Ищем порт в общем списке
                  AnsiString lport_name("");
                  if (port_name!="")
                  {
                           for (int i=0; i<BTPrs.NumPrs; i++)
                          {
                                lport_name.printf("COM%d",BTPrs.Ps[i].p+1);
                                if (lport_name==port_name)
                                {
                                    com_port=BTPrs.Ps[i].CPrt;
                                    threadnum=i;
                                    break;
                                }
                          }
                  }


/*
Поиск датчика в списке подереву пока не прозрачен
//Ищем датчик в общем списке
                  if (sens_name!="")
                  {
                          for (int i=0; i<16; i++)
                          {
                                ind3_sensor=&BTSrs[i];

                                if (BTSrs[i].Name==sens_name)
                                {
                                    ind3_sensor=&BTSrs[i];
                                    break;
                                }
                          }
                  }
*/

                if (com_port!=NULL)
                {
                    if (com_port->h==INVALID_HANDLE_VALUE)
                    {
                        ShowMessage("Для запуска данного сервиса СОМ-порт должен быть включен в опрос и открыт!");
                        return;
                    }


                     AnsiString smsg;
                     smsg.printf("Мониторинг для линии [%s] будет остановлен! Хотите продолжить?",lport_name);

                     if (MessageBox(NULL,smsg.c_str(),"ВНИМАНИЕ!",1)!=IDOK)
                     {
                          return;
                     }

                     if (com_port->Protocol211==NULL)
                     {


                             if (BTPrs.Ps[threadnum].CThr)
                             {
                                BTPrs.Ps[threadnum].CThr->ServiceMode=true;
                                Form_AND3_Tune->ThrServiceMode=&BTPrs.Ps[threadnum].CThr->ServiceMode;
                             }

                         Form_AND3_Tune->ComServiceMode=&com_port->ServiceMode;
                         com_port->ServiceMode=true;



                        Form_AND3_Tune->ComPort=com_port;
                        Form_AND3_Tune->Start();
                        ::Sleep(100);
                        Form_AND3_Tune->ShowModal();

                     }
                     else
                     {

                             if (BTPrs.Ps[threadnum].CThr)
                             {
                                BTPrs.Ps[threadnum].CThr->ServiceMode=true;
                                Form_IND3_Tune->tServiceMode=&BTPrs.Ps[threadnum].CThr->ServiceMode;
                             }
                             Form_IND3_Tune->pServiceMode=&com_port->ServiceMode;
                             com_port->ServiceMode=true;

                             Form_IND3_Tune->ComPort=com_port;
                             Form_IND3_Tune->StartTuningTimer();
                             ::Sleep(100);
                             Form_IND3_Tune->ShowModal();
                     }

               }

}
