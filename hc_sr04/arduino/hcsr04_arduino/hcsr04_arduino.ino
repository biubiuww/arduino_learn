//引脚申明
int trigPin = 11;    // 控制信号输入
int echoPin = 12;    // 回响信号输出
long duration, cm, inches;
 
void setup() {
  //串口信号
  Serial.begin (9600);
  //定义输入、输出模式对应的脚位
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}
 
void loop() {
  // 上电后，先将trig置于低电位
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  // trig引脚电位稳定后，给一个10微秒的高电平触发信号
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
 
  pinMode(echoPin, INPUT);
  // duration=回响信号高电平持续时间
  // pulseIn方法测量的时间以微秒为单位
  duration = pulseIn(echoPin, HIGH);
 
  // 测量距离=（时间*音速）/ 2
  cm = (duration*0.034) / 2;  
  inches = (duration*0.0135) / 2;
  
  Serial.print(inches);
  Serial.print("in, ");
  Serial.print(cm);
  Serial.print("cm");
  Serial.println();
  
  delay(1000);
}
