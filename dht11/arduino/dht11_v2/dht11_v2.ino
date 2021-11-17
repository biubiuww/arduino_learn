#include <dht.h>  // 引入dht库
#define dhtPin 8  // 定义DHT11 DATA脚

dht DHT;      // 建立DHT对象

void setup() {
  Serial.begin(9600);
}

void loop() {
  int readData = DHT.read11(dhtPin);

  float TEMP = DHT.temperature;  // 读取温度值
  float HUMI = DHT.humidity;   // 读取湿度值

  Serial.print("Temperature = ");
  Serial.print(TEMP);
  Serial.print("°C | ");
  Serial.print((TEMP*9.0)/5.0+32.0); // 华氏度转换
  Serial.println("°F ");
  Serial.print("Humidity = ");
  Serial.print(HUMI);
  Serial.println("% ");
  Serial.println("");

  delay(2000); // 延迟等待下次读取数据
}
