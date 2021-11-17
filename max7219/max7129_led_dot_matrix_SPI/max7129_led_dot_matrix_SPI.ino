#include <SPI.h>
#define DIN 11
#define CS 3
#define CLK 13
//定义MAX7219内部地址（十六进制或者十进制）
#define DECODE_MODE 9
#define INTENSITY 10
#define SCAN_LIMIT 11
#define SHUTDOWN 12
#define DISPLAY_TEST 15

SPISettings settingsA(1000000, MSBFIRST,SPI_MODE0);

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

void sendData(uint8_t address, uint8_t value){
  digitalWrite(CS, LOW);
  SPI.transfer(address);
  SPI.transfer(value);
  digitalWrite(CS, HIGH);
}

void setup() {
  pinMode(CS, OUTPUT);
  pinMode(DIN, OUTPUT);
  pinMode(CLK, OUTPUT);
  SPI.beginTransaction(settingsA);
  SPI.begin();  

  sendData(DISPLAY_TEST, 0x01);
  delay(2000);
  sendData(DISPLAY_TEST, 0x00);
  sendData(DECODE_MODE, 0x00);
  sendData(INTENSITY, 0x00);
  sendData(SCAN_LIMIT, 0x08);
  delay(2000);
  sendData(SHUTDOWN, 0x01);
  clear();
  delay(1000);
  
}

void clear(){
  for(int i=1;i<=8;i++){
    sendData(i,0);
    }
  }
void loop() {
  for(int i=1;i<9;i++){
    sendData(i, heart[i-1]);
    };

  sendData(INTENSITY, 0x0f & 10);
  delay(100);

  sendData(INTENSITY, 0x0f & 0);
  delay(50);
  
  sendData(INTENSITY, 0x0f & 10);
  delay(100);

  sendData(INTENSITY, 0x0f & 0);
  delay(1000);
}
