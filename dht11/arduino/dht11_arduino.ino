//代码参考：https://github.com/adidax/dht11
//讲解视频：https://www.bilibili.com/video/BV1Lb4y1h7CM

int DHT_PIN = 8;
int TEMP, HUMI;
void readSensor(int pin){
  uint8_t bits[5];
  uint8_t count = 7;
  uint8_t index = 0;
  //填充0，避免接收过程出现问题
  for(int i=0;i<5;i++){
    bits[i] = 0;
  }
  //发送起始信号
  pinMode(pin,OUTPUT);
  digitalWrite(pin, LOW);
  delay(20);
  digitalWrite(pin,HIGH);
  delayMicroseconds(40);
  pinMode(pin,INPUT);
  //等待响应信号
  unsigned int loopCnt = 10000;
  while(digitalRead(pin) == LOW)
    if(loopCnt-- == 0) return Serial.println("ERROR: timeout ");
  loopCnt = 10000;
  while(digitalRead(pin)== HIGH)
    if(loopCnt-- ==0) return Serial.println("ERROR: timeout ");
  //数据接收开始
  for(int i=0; i<40;i++){
    loopCnt = 10000;
    while(digitalRead(pin) == LOW)
      if(loopCnt-- ==0) return Serial.println("ERROR: timeout ");

    unsigned long t = micros();
    while(digitalRead(pin) == HIGH)
      if(loopCnt-- ==0) return Serial.println("ERROR: timeout ");
      
    if(micros() -t > 40) bits[index] |= (1 << count);
    if(count == 0){
      count = 7;
      index++;
      }
    else count--;
    }
  if(bits[0] + bits[2] == bits[4]){
    HUMI = bits[0];
    TEMP = bits[2];
    }
  else Serial.println("ERROR: data check failed");
}

void setup() {
  Serial.begin(9600);
  delay(1000);
  Serial.println("Serial begin....");
}

void loop() {
  readSensor(DHT_PIN);
  Serial.print("Temperature : ");
  Serial.print(TEMP);
  Serial.print(" °C ");
  Serial.print("  /  ");
  Serial.print("Humidity: ");
  Serial.print(HUMI);
  Serial.println("%");

  delay(2000);
}