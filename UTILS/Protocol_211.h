//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdint.h>

#ifndef Protocol_211H
#define Protocol_211H
//---------------------------------------------------------------------------
#endif

//----------------------����������� ����� ������-----------------------------

//��� ���������� ������� � �������

typedef enum {

cMEAS_VAL=0x01,        //��������� ����������
cMEAS_VER=0x0E,        //������ ����������
cACK_ERR=0xFF,         //��������� �� ������

cGET_BAUD=0x11,        //��������� ��������������� ������
cGET_NAME=0x13,        //��������� ��� ����������
cGET_ZOFF=0x15,        //��������� �������� ����
cGET_SVER=0x1A,        //��������� ����� �������� ��
cGET_SERN=0x1B,        //��������� ��������� ����� ����������
cGET_TACT=0x1C,        //��������� ����� ������ ����������
cGET_PERD=0x1E,        //��������� ������ ����������

} ind3_common_request_type;



//����� ������ ����������
typedef enum {
        averaging_tacts_1 = 0x00,
	averaging_tacts_2 = 0x01,
	averaging_tacts_4 = 0x02,
	averaging_tacts_8 = 0x03,
	averaging_tacts_16= 0x04,
	averaging_tacts_32= 0x05
} ind3_averaging_tacts;

//������ ����������
typedef enum {
        averaging_period_10  = 0x00,
	averaging_period_20  = 0x01,
	averaging_period_50  = 0x02,
	averaging_period_100 = 0x03
} ind3_averaging_period;



//�������� ������ �� ��� �����
typedef enum {

        baud_1200  =  0x01,
	baud_2400  =  0x02,
	baud_4800  =  0x03,
	baud_9600  =  0x04,
	baud_19200 =  0x05,
	baud_38400 =  0x06,
	baud_57600 =  0x07,
	baud_115200=  0x08

} ind3_baudrate;



//	0x10 - �� ��������� ����������� ����� ����������� ������ ����������.
//	0x11 - �� ��������� ����������� ����� ������ �������� ����������.
//	0x12 - �� ��������� ����������� ����� ����������� ������ � ������ �������� ����-������.


//���� ������ �������� �� �������
typedef enum {

CHSUM_MEAS_MEM_ERR = 0x10,
CHSUM_ADJS_MEM_ERR = 0x11,
CHSUM_PROG_MEM_ERR = 0x12,

} ind3_sensor_err;

//������� ��������� ����

typedef enum {

ANGLE_SECONDS=0,
ANGLE_MINUTES=1

} angle_units;


//����� �������

typedef struct  {

unsigned char   sensor_addr;
char            sensor_vers[6];

double          angle_x;
double          angle_y;
angle_units     units_x;
angle_units     units_y;
ind3_baudrate   baud_rate;
char            sensor_name[16];
double           zoffset_x;
double           zoffset_y;
angle_units     units_zoffset_x;
angle_units     units_zoffset_y;
unsigned short  soft_version;
unsigned int    sensor_serial;

ind3_sensor_err last_err;

unsigned char   averaging_tacts;
unsigned char   averaging_period;

int             timeout_period;           //������� � �������������
bool            timeout_alarm;            //������� ����-���� ��� ������


} ind3_sensor;


//------------------������ ��-�3------------------------------------------------

/*
���������� ������(�����) ������� ��-�3
*/

class TIND3sensor
{
private:

//����������� ����� �������
ind3_sensor   SensorIND3;

protected:

public:

  __fastcall TIND3sensor();
  __fastcall ~TIND3sensor();

//--------------��������� �������� ��������� ���������2.11----------------------

//��������� ������ ������� �����
  void SetAddr(unsigned char addr);

//��������� ������ ����������
  void SetSensVer(char* version);

//��������� ��������� ���������
  void SetAngleX(double angle);
  void SetAngleY(double angle);

//��������� ������� ����
  void SetUnitsX(angle_units unit);
  void SetUnitsY(angle_units unit);

//��������� ��� ������
  void SetSensLastErr(ind3_sensor_err err);

//��������� �������� ������
  void SetSensBaudRate(ind3_baudrate baud);

//��������� ���������� �������� ������ ��
  void SetSensSoftVer(unsigned int version);

//��������� ��������� �������� ��� �������
  void SetSensName(char* name, int len);

//��������� ���������� �������� �������� ����
  void SetAngleOffsetX(double angle);
  void SetAngleOffsetY(double angle);

//��������� ���������� �������� ������ �������� ����
  void SetUnitsOffsetX(angle_units unit);
  void SetUnitsOffsetY(angle_units unit);

//��������� ��������� �����
  void SetSensSerial(unsigned int serial);

//��������� ����� ������ ����������
  void SetSensAveragingTacts(unsigned char tacts);

//��������� ������ ����������
  void SetSensAveragingPeriod(unsigned char period);

//���������� ������� �  �������������
//  void SetSensTimeOutPeriod(int period);

//���������� ���� ������� ��������
//  void SetSensTimeOutAlarm(bool timeout_alarm);


//----------------------������ ������ �� ������ ������� �� ������� ������� �����������--------------------

public:

//��������� ������� �  �������������
//  int GetSensTimeOutPeriod(void);

//��������� ���� ������� ��������
//  bool GetSensTimeOutAlarm(void);


//�������� ����
  double GetSensAngleX(void);
  double GetSensAngleY(void);

//�������� �������� �������� �����
  int   GetSensUnitsX(void);
  int   GetSensUnitsY(void);

//�������� ������ ����������
  char*  GetSensMeterVersion(void);

//��� ������ ��� ������� ������ ����������
  ind3_sensor_err  GetSensLastErr(void);

//�������� �������� ������
  int              GetSensBaudRate(void);

//�������� ��� ����������
  char*            GetSensName(void);

//�������� ����� ���������� (����� - �� ������� ����� �� ������ ������� ����� ����)
  unsigned char GetSensAddr(void);

//�������� �������� ����
  double GetSensZeroOffsetX(void);
  double GetSensZeroOffsetY(void);

//�������� �������� �������� ����
  int   GetSensZeroOffsetUnitsX(void);
  int   GetSensZeroOffsetUnitsY(void);

//�������� ����� �������� �� ����������
  unsigned short GetSensSoftVer(void);

//�������� ��������� ����� ����������
  unsigned int GetSensSerialNumber(void);

//�������� ����� ������ ����������
  ind3_averaging_tacts GetSensAveragingTacts(void);

//�������� ������ ����������
  ind3_averaging_period GetSensAveragingPeriod(void);


};


//-------------------������ ��������� �������� � ������-------------------------

class TIND3sensor_ptr
{
private:

protected:

public:
   TIND3sensor_ptr();
  ~TIND3sensor_ptr();

   TIND3sensor* sensor;
   TIND3sensor_ptr* next;

};

//-------------------------������ ��������--------------------------------------
class TIND3SensorsList
{
private:

        int SensorExist(unsigned char addr);
        TIND3sensor_ptr* top;
        TIND3sensor_ptr* bottom;

protected:

public:
        TIND3SensorsList();
        ~TIND3SensorsList();

        void Clear();
        int             AddIND3Sensor(unsigned char addr);
        TIND3sensor*    GetIND3Sensor(unsigned char addr);

};
//------------------------------------------------------------------------------


#define PACKET_START 0x7E       //����������� �������
#define PACKET_END   0x7E       //����������� �������
#define ESCAPE_BYTE  0x7D       //escape ����
#define CODE7D_BYTE  0x5D       //0x7D ��� ����
#define CODE7E_BYTE  0x5E       //0x7E ��� ����

#define PACKETBUF_LEN 1024
#define REQUESTBUFLEN 64

//�������� � ������ �� ������ �������� ������
#define DATAOFFSET 4

typedef enum {

MAIN_PR_211=0x9B,     //�������� ��������� 2.11
ADDN_PR_211=0x9C,     //����������������������� 2.11
PACK_PR_210=0x9A      //����������������������� 2.10

} protocol_211_id;


typedef enum {

MEAS_VAL=0x01,        //��������� ����������
MEAS_VER=0x0E,        //������ ����������
PACK_ERR=0xFF         //��������� �� ������

} main_packet_211_id;

typedef enum {

GET_BAUD=0x01,        //��������� ��������������� ������
SET_BAUD=0x02,        //���������� ������� �������� ������
GET_NAME=0x03,        //��������� ��� ����������
SET_NAME=0x04,        //���������� ��� ����������
GET_ZOFF=0x05,        //��������� �������� ����
SET_ZOFF=0x06,        //���������� �������� ����
SET_ADDR=0x09,        //���������� ����� �����
GET_SVER=0x0A,        //��������� ����� �������� ��
GET_SERN=0x0B,        //��������� ��������� ���������������
GET_TACT=0x0C,        //��������� ����� ������ ����������
SET_TACT=0x0D,        //���������� ����� ������ ����������
GET_PERD=0x0E,        //��������� ������ ����������
SET_PERD=0x0F         //���������� ������ ����������


} addn_packet_211_id;

typedef enum {

MEAS_VAL10=0x01,      //��������� ����������
MEAS_PNG10=0x03       //���� ���������

} addn_packet_210_id;

class TProtocol_211 {

 public:

TProtocol_211(void);
~TProtocol_211(void);

 public:

           TIND3sensor*                 sensor_IND3;                      //����������� ����� ������� ��-�3 �������� ������������ ����� �������
           ind3_common_request_type     request_TYPE;                     //��� ������� ��� ��������� ������ �������

private:

           int CheckSumCalculate();

//           unsigned char*       bufRX;                  //��������� �� ����� ������
//           unsigned char*       bufTX;                  //�������� �� ����� ��������

           unsigned char        packetBUF[PACKETBUF_LEN];         //��������� ����� ��������� ������
           int                  packetLEN;                        //����� ������

           unsigned char        sensorADDR;                       //��������������� ������� ��������

           int ChceckSumCheck(void);
           int ChceckSumCalculate(void);

//������� ��������� ������� �� ����� � �������� ������ � ����� �������

           int AcceptSensorMeasVal(void);   //�����   MEAS_VAL=0x01,        //��������� ����������
           int AcceptSensorMeasVer(void);
           int AcceptSensorLastErr(void);
           int AcceptSensorBaudRate(void);
           int AcceptSensorSoftVer(void);
           int AcceptSensorName(void);
           void AcceptSensorAveragingTacts(void);
           void AcceptSensorAveragingPeriod(void);
           int AcceptSensorZeroOffset(void);
           int AcceptSensorSerialNumber(void);

//������������ �������� � �������
private:

        void ClearRequestBuf(void);
        void RequestMainMeterPacket(unsigned char addr, main_packet_211_id packet, unsigned char* buf, int* len);
        void RequestAddnMeterPacket(unsigned char addr, addn_packet_211_id packet, unsigned char* buf, int* len);

public:

           TIND3SensorsList*    sensorsList;                      //������ ������������ ��������

public:

//����� � ������ ������ � �������� �������
        TIND3sensor* GetIND3Sensor(unsigned char addr);

public:

//frame - ��� ���� ������������ �������� ���������� �����

//���������� ESCAPE ����������������� ��� ��������
 int EscapeBytesEncode(unsigned char* buf, int* len, int frame);

//������������� ESCAPE ������������������ �� ������
 int EscapeBytesDecode(unsigned char* buf, int* len, int frame);

/////////////////////////////////////////////////////////////////////////////////////////
//----------������� ����������� ��������� ��� ����� � ���������� ��������---------------

public:

//��������� �� ������� ��� ����������������� ������� ��������� (��������� � ���������� �������, ���������� �� ��������� ��������� ������)
        void(*accept_data_func)(void);

//������ �������� ��-�3 ��������� ������������� ��� �������� ���������� ������ ��������� 2.11

//������� ���������� ������� � ������ �� ������
        int AddIND3Sensor(unsigned char addr);

//��������� ��������� ������ �� ������� (��������� �� ����� � �������� ������� � ����� ������)
        int  packet_proc(unsigned char* buf, int len);

//////////////////////������ ������ �� ������ �������////////////////////////////

//��������� ��������� ��������� �� ������ ������� ���������� ��������
int ReadIND3SensorMeasureResult(unsigned char addr, double* angle_X, double* &angle_Y, unsigned char* units_X, unsigned char* units_Y);

//��������� ������ ���������� �� ������ ������� ���������� ��������
int ReadIND3SensorMeterVerion(unsigned char addr, char* version);

//��������� �������� ������ �� ������ ������� ���������� ��������
int ReadIND3SensorBaudRate(unsigned char addr, int* baud);

//��������� ��� ���������� �� ������ ������� ���������� ��������
int ReadIND3SensorMeterName(unsigned char addr, char* name);

//��������� �������� ���� �� ������ ������� ���������� ��������
int ReadIND3SensorZeroOffset(unsigned char addr, double* angle_X, double* &angle_Y, unsigned char* units_X, unsigned char* units_Y);

//��������� ����� �������� �� �� ������ ������� ���������� ��������
int ReadIND3SensorSoftVersion(unsigned char addr, unsigned short* ver);


//��������� ��������� ����� ���������� �� ������ ������� ���������� ��������
int ReadIND3SensorSerialNumber(unsigned char addr, unsigned int* serial);

//��������� ���������� ������ ���������� �� ������ ������� ���������� ��������
int ReadIND3SensorAveragingTacts(unsigned char addr, int* tacts);

//��������� ������ ���������� �� ������ ������� ���������� ��������
int ReadIND3SensorAveragingPeriod(unsigned char addr, int* period);


//��������� ���� �����
int ReadIND3SensorLastErr(unsigned char addr, unsigned char* err);

//////////////////������������ ������ ������� � ������� �������/////////////////


//� ���� ����� ���������� ��������� ����� ������� � ����������
        unsigned char    request_packetBUF[REQUESTBUFLEN];
//����������� ������� � ����������
        int              request_packetLEN;

//------------------�������� �������� 2.11-------------------------------------

//��������� ��������� ��������� (�������������� ����� ���������� � buf ����� ���� len)

void RequestMeasureResult(unsigned char addr, unsigned char* buf, int* len);

//��������� ������ ����������
void RequestMeterVerion(unsigned char addr, unsigned char* buf, int* len);

//------------------������������� �������� 2.11--------------------------------

//��������� �������� ������
void RequestSensorBaudRate(unsigned char addr, unsigned char* buf, int* len);

//��������� ��� ����������
void RequestSensorMeterName(unsigned char addr, unsigned char* buf, int* len);

//��������� �������� ����
void RequestSensorZeroOffset(unsigned char addr, unsigned char* buf, int* len);

//��������� ����� �������� ��
void RequestSensorSoftVersion(unsigned char addr, unsigned char* buf, int* len);

//��������� ��������� ����� ����������
void RequestSensorMeterSerialNumber(unsigned char addr, unsigned char* buf, int* len);

//��������� ���������� ������ ����������
void RequestSensorAveragingTacts(unsigned char addr, unsigned char* buf, int* len);

//��������� ������ ����������
void RequestSensorAveragingPeriod(unsigned char addr, unsigned char* buf, int* len);

//////////������������ ������ ��������� ���������� � ������� �������////////////

//���������� �������� ������
void SetSensorBaudRate(unsigned char addr, ind3_baudrate baud, unsigned char* buf, int* len);

//���������� ��� ����������  ������������ � ������� ������ ������� 16 �������� �������� ������ ������������� �����
void SetSensorName(unsigned char addr, char* name, unsigned char* buf, int* len);

//���������� �������� ����
void SetsensorZeroOffset(unsigned char addr, double angle_X, double angle_Y, angle_units units_X, angle_units units_Y, unsigned char* buf, int* len);

//���������� ����� �����
void SetSensorNewAddress(unsigned char addr, unsigned char newaddr, unsigned char* buf, int* len);

//���������� ���������� ������ ����������
void SetSensorAveragingTacts(unsigned char addr, ind3_averaging_tacts tacts, unsigned char* buf, int* len);

//���������� ������ ����������
void SetSensorAveragingPeriod(unsigned char addr, ind3_averaging_period period, unsigned char* buf, int* len);

};



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


