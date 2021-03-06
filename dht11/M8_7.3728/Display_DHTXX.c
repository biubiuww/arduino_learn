//ICC-AVR application builder : 2008-4-28 9:22:37
// Target : M8
// Crystal: 8.0000Mhz
/*************************************************************************
程序：ICC-AVR 
功能：波特率9600 串口发送温湿度数据  
数据格式：湿度  温度  校验和   
          例如串口发送数据   59 00 24 00 53   则湿度为59 温度为24 校验和为53 
公司：DHT11
芯片：M8
晶振：外部 7.3728Mhz
创建人： 
创建时间：09.06.18
修改人：
修改时间：
修改原因：
**************************************************** **********************/

#include <iom8v.h>
#include <macros.h>
typedef unsigned char  U8;       /* defined for unsigned 8-bits integer variable 	  无符号8位整型变量  */
typedef signed   char  S8;       /* defined for signed 8-bits integer variable		  有符号8位整型变量  */
typedef unsigned int   U16;      /* defined for unsigned 16-bits integer variable 	  无符号16位整型变量 */
typedef signed   int   S16;      /* defined for signed 16-bits integer variable 	  有符号16位整型变量 */
typedef unsigned long  U32;      /* defined for unsigned 32-bits integer variable 	  无符号32位整型变量 */
typedef signed   long  S32;      /* defined for signed 32-bits integer variable 	  有符号32位整型变量 */
typedef float          F32;      /* single precision floating point variable (32bits) 单精度浮点数（32位长度） */
typedef double         F64;      /* double precision floating point variable (64bits) 双精度浮点数（64位长度） */


/**************************************************************************
                    I/O空间定义
***************************************************************************/
// B0_IN	DDRB &= ~(1 << PB0)		/*设置输入*/
// B0_OUT	DDRB |= (1 << PB0)		/*设置输出*/
// B0_CLR	PORTB &= ~(1 << PB0)	/*置低电平*/
// B0_SET	PORTB |= (1 << PB0)		/*置高电平*/
// B0_R	    PINB & (1 <<PB0)		/*读了电平*/

 #define    C4_IN	  DDRC &= ~(1 << PC4)		/*设置输入*/
 #define    C4_OUT	  DDRC |= (1 << PC4)		/*设置输出*/
 #define    C4_CLR	  PORTC &= ~(1 << PC4)	    /*置低电平*/
 #define    C4_SET	  PORTC |= (1 << PC4)		/*置高电平*/
 #define    C4_R	    PINC & (1 <<PC4)		/*读了电平*/

/**************************************************************************
                    通讯I/O空间定义
***************************************************************************/
 #define       COM_IN          C4_IN  
 #define       COM_OUT         C4_OUT
 #define       COM_CLR         C4_CLR
 #define       COM_SET         C4_SET
 #define       COM_R           C4_R
 
/**************************************************************************
                    全局变量定义区
***************************************************************************/
      U8       i;
      U8    U8FLAG,k;
      U8    U8count,U8temp;
      U8    U8T_data_H,U8T_data_L,U8RH_data_H,U8RH_data_L,U8checkdata;
      U8    U8T_data_H_temp,U8T_data_L_temp,U8RH_data_H_temp,U8RH_data_L_temp,U8checkdata_temp;
      U8    U8comdata;
      U16   ReceiveHighByte;
      U16   ReceiveLowByte;
/**************************************************************************
***************************************************************************/
void port_init(void)
{
 PORTB = 0x00;
 DDRB  = 0xFF;
 PORTC = 0x03;                    
 DDRC  = 0x0C;
 PORTD = 0x00;
 DDRD  = 0xF0;
}

void watchdog_init(void)
{
  //WDR();        //this prevents a timout on enabling
  //WDTCR = 0x0F; //WATCHDOG ENABLED - dont forget to issue WDRs
}


void Delay(unsigned int i)
{
	while(i--);
}

void DelaymS (U16 dly)                   
{
	U16 i;
	for ( ; dly>0; dly--)
	{
	    WDR();
		for (i=0; i<1032; i++);        
	}
}


       void  Delay_10us(void)
      {
        U8 i;                     
        i++;i++;i++;i++;i++;i++;i++;i++;i++;
		i++;i++;i++;i++;i++;i++;i++;i++;i++;
		i++;i++;i++;i++;i++;i++;i++;i++;i++;
		i++;i++;i++;i++;i++;i++;i++;i++;i++;
		i++;i++;i++;i++;i++;i++;i++;i++;i++;
		i++;i++;i++;i++;i++;i++;i++;i++;i++;
		i++;i++;i++;i++;i++;i++;i++;i++;i++;
		i++;i++;
       }
        void  COM(void)
      {
     
	        U8 i;
       for(i=0;i<8;i++)	   
	    {
		
	   	    U8FLAG=2;
	   	while((!(COM_R))&&U8FLAG++);
		 if(U8FLAG==1)break;
			Delay_10us();
			Delay_10us();
		    Delay_10us();
			Delay_10us();
	  		U8temp=0;
	     if(COM_R)U8temp=1;
		    U8FLAG=2;
		   while((COM_R)&&U8FLAG++);
	   	//超时则跳出for循环		  
	   	 if(U8FLAG==1)break;
	   	//判断数据位是0还是1	 
	   	   
		// 如果高电平高过预定0高电平值则数据位为 1 
	   	 
		   U8comdata<<=1;
	   	   U8comdata|=U8temp;        //0
	     }//rof
	   
	}

	//--------------------------------
	//-----湿度读取子程序 ------------
	//--------------------------------
	//----以下变量均为全局变量--------
	//----温度高8位== U8T_data_H------
	//----温度低8位== U8T_data_L------
	//----湿度高8位== U8RH_data_H-----
	//----湿度低8位== U8RH_data_L-----
	//----校验 8位 == U8checkdata-----
	//----调用相关子程序如下----------
	//---- Delay();, Delay_10us();,COM(); 
	//--------------------------------

	void RH(void)
	{
	 
	  //主机拉低18ms 
       COM_OUT;
       COM_CLR;
	   DelaymS(18);
	   COM_IN;
	   COM_SET;
	  
	 //总线由上拉电阻拉高 主机延时20us
	   Delay_10us();
	   Delay_10us();
	   Delay_10us();
	   Delay_10us();
	 //主机设为输入 判断从机响应信号 
	 //P2_0=1;
	 
	 //判断从机是否有低电平响应信号 如不响应则跳出，响应则向下运行	  
	  // if(!P2_0)		 //T !	 
	   if(COM_R)U8FLAG=1;
	   while(!(COM_R))		 
	   {
	   U8FLAG=2;
	 //判断从机是否发出 80us 的低电平响应信号是否结束	 
	   //while((!P2_0)&&U8FLAG++);
	   while((!(COM_R))&&U8FLAG++);
	   if(U8FLAG==1)break;
	   U8FLAG=2;
	 //判断从机是否发出 80us 的高电平，如发出则进入数据接收状态
	 //while((P2_0)&&U8FLAG++);
	   while((COM_R)&&U8FLAG++);
	   if(U8FLAG==1)break;
	 //数据接收状态		 
	   COM();
	   if(U8FLAG==1)break;
	   U8T_data_H_temp=U8comdata;
	   COM();
	   if(U8FLAG==1)break;
	   U8T_data_L_temp=U8comdata; 
	   COM();
	   if(U8FLAG==1)break;
	   U8RH_data_H_temp=U8comdata;
	   COM();
	   if(U8FLAG==1)break;
	   U8RH_data_L_temp=U8comdata;
	   COM();
	   if(U8FLAG==1)break;
	   U8checkdata_temp=U8comdata;
	   break;
	    }//while
	   //P2_0=1;
	   COM_IN;
	   COM_SET;
	 //数据校验 
	 
	   U8temp=(U8T_data_H_temp+U8T_data_L_temp+U8RH_data_H_temp+U8RH_data_L_temp);
	   if(U8temp==U8checkdata_temp)
	   {
	   	  U8RH_data_H=U8T_data_H_temp;
	   	  U8RH_data_L=U8T_data_L_temp;
	   	  U8T_data_H=U8RH_data_H_temp;
	   	  U8T_data_L=U8RH_data_L_temp;
	   	  U8checkdata=U8checkdata_temp;
	   }//fi
	  
	  
	   COM_IN;
	   COM_SET;

	}
	
/*
串口初始化函数
系统频率：2MHz
停止位：1
波特率：9600
数据长度：8
*/
void Uart_Init(void) {
	UCSRA = 0x02;		/*2倍速					 */
	UCSRB = 0x18;		/*允许接收和发送*/
	UCSRC = 0x06;		/*8位数据				 */
	UBRRH = 0x00;
	//UBRRL = 47;		/*9600		3.6864M      */  
	UBRRL = 95;		    /*9600	    7.3728M      */ 
}

/*
串数据发送
查询方式发送
*/
void Uart_Transmit(unsigned char i) {

	/* 等待发送缓冲器为空*/
	while (!(UCSRA & (1<<UDRE)));
	/* 将数据放入缓冲器，发送数据*/
	UDR = i;
}

/*
串数据接收
查询方式接收
*/
unsigned char Uart_Receive( void ) {

	/* 等待接收数据*/
	while (!(UCSRA & (1<<RXC)));
	/* 从缓冲器中获取并返回数据*/
	// Uart_Transmit(UDR);
	return UDR;
}

void init_devices(void) 
{
unsigned char i;
		   CLI();                     
     port_init();
 watchdog_init();
    Uart_Init();
    MCUCR = 0x03;
    GICR  = 0x00;                //关外部中断0
    TIMSK = 0x00;                //关定时器1中断
           SEI();                //re-enable interrupts
                           
}	
/**************************************************************************



                            主函数
							
							
							
							
**************************************************************************/


 void main(void)
{

 init_devices() ;
 COM_IN;
 COM_SET;
 
 while(1)
 {
 
 //读DHT11   
  RH();
  
  //把DHT11的十六进制数据转换成10进制  
  //格式  湿度  温度  校验和   
  //例如串口发送数据   59 00 24 00 53   则湿度为59 温度为24 校验和为53 
  
  
  
  U8temp=U8RH_data_H/10;
  U8temp<<=4;
  U8temp|=U8RH_data_H%10;
  U8RH_data_H=U8temp;
  Uart_Transmit(U8RH_data_H); 
  Uart_Transmit(U8RH_data_L);
  
  U8temp=U8T_data_H/10;
  U8temp<<=4;
  U8temp|=U8T_data_H%10;
  U8T_data_H=U8temp;
  Uart_Transmit(U8T_data_H);  
  Uart_Transmit(U8T_data_L); 
  

  Uart_Transmit(U8checkdata); 
  //延时2S
  for(U8temp=0;U8temp<200;U8temp++)
  {
  DelaymS(10);
 
  }//rof
  
 }
 
}




 






 
 
 
