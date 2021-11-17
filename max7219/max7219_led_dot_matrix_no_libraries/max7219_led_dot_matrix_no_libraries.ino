#define DECODE_MODE 9
#define INTENSITY 10
#define SCAN_LIMIT 11
#define SHUTDOWN 12
#define DISPLAY_TEST 15

#define DIN 2
#define CS 3
#define CLK 4

//int DIN = 2;
//int CS = 3;
//int CLK = 4;

// 定义MAX7129内部寄存器地址（十六进制或者十进制）
//byte DECODE_MODE = 0x09;
//byte INTENSITY = 0x0a;
//byte SCAN_LIMIT = 0x0b;
//byte SHUTDOWN = 0x0c;
//byte DISPLAY_TEST = 0x0f;



const unsigned char heart[] = {
  B00000000,
  B01100110,
  B11111111,
  B11111111,
  B11111111,
  B01111110,
  B00111100,
  B00011000
};

//数据写入
void setReg(byte address, byte value){
  digitalWrite(CS, LOW);
  putData(address);
  putData(value);
  digitalWrite(CS, HIGH);
}

//写入字节
void putData(byte data){
  byte i =8;
  byte mask;
  while(i>0){
    mask = 0x01 << (i - 1);
    digitalWrite(CLK, LOW);
    if(data & mask){
      digitalWrite(DIN, HIGH);
      }else{
       digitalWrite(DIN, LOW); 
        };
    digitalWrite(CLK, HIGH);
    --i;
    };
}


void setup() {
  pinMode(CS, OUTPUT);
  pinMode(CLK, OUTPUT);
  pinMode(DIN, OUTPUT);

  //开启显示测试
  setReg(DISPLAY_TEST, 0x01);
  delay(1000);
  //关闭显示测试
  setReg(DISPLAY_TEST, 0x00);
  //关闭BCD译码
  setReg(DECODE_MODE, 0x00);
  //扫描限制
  setReg(SCAN_LIMIT, 0x08);
  //亮度等级（1-15）
  setReg(INTENSITY, 0x00);
  //关闭休眠模式
  setReg(SHUTDOWN, 0x01);

  for(int i=1;i<9;i++){
  setReg(i, heart[i-1]);  
  };
}

void loop() {
  setReg(INTENSITY, 0x0f & 10);
  delay(100);

  setReg(INTENSITY, 0x0f & 0);
  delay(50);
  
  setReg(INTENSITY, 0x0f & 10);
  delay(100);

  setReg(INTENSITY, 0x0f & 0);
  delay(1000);
}
