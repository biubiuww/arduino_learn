	.module Display_DHTXX.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Owner\����\C\���ͻ����԰�\DHT11_7.3728\M8_7.3728\Display_DHTXX.c
	.dbfunc e port_init _port_init fV
	.even
_port_init::
	.dbline -1
	.dbline 69
; //ICC-AVR application builder : 2008-4-28 9:22:37
; // Target : M8
; // Crystal: 8.0000Mhz
; /*************************************************************************
; ����ICC-AVR 
; ���ܣ�������9600 ���ڷ�����ʪ������  
; ���ݸ�ʽ��ʪ��  �¶�  У���   
;           ���紮�ڷ�������   59 00 24 00 53   ��ʪ��Ϊ59 �¶�Ϊ24 У���Ϊ53 
; ��˾��DHT11
; оƬ��M8
; �����ⲿ 7.3728Mhz
; �����ˣ� 
; ����ʱ�䣺09.06.18
; �޸��ˣ�
; �޸�ʱ�䣺
; �޸�ԭ��
; **************************************************** **********************/
; 
; #include <iom8v.h>
; #include <macros.h>
; typedef unsigned char  U8;       /* defined for unsigned 8-bits integer variable 	  �޷���8λ���ͱ���  */
; typedef signed   char  S8;       /* defined for signed 8-bits integer variable		  �з���8λ���ͱ���  */
; typedef unsigned int   U16;      /* defined for unsigned 16-bits integer variable 	  �޷���16λ���ͱ��� */
; typedef signed   int   S16;      /* defined for signed 16-bits integer variable 	  �з���16λ���ͱ��� */
; typedef unsigned long  U32;      /* defined for unsigned 32-bits integer variable 	  �޷���32λ���ͱ��� */
; typedef signed   long  S32;      /* defined for signed 32-bits integer variable 	  �з���32λ���ͱ��� */
; typedef float          F32;      /* single precision floating point variable (32bits) �����ȸ�������32λ���ȣ� */
; typedef double         F64;      /* double precision floating point variable (64bits) ˫���ȸ�������64λ���ȣ� */
; 
; 
; /**************************************************************************
;                     I/O�ռ䶨��
; ***************************************************************************/
; // B0_IN	DDRB &= ~(1 << PB0)		/*��������*/
; // B0_OUT	DDRB |= (1 << PB0)		/*�������*/
; // B0_CLR	PORTB &= ~(1 << PB0)	/*�õ͵�ƽ*/
; // B0_SET	PORTB |= (1 << PB0)		/*�øߵ�ƽ*/
; // B0_R	    PINB & (1 <<PB0)		/*���˵�ƽ*/
; 
;  #define    C4_IN	  DDRC &= ~(1 << PC4)		/*��������*/
;  #define    C4_OUT	  DDRC |= (1 << PC4)		/*�������*/
;  #define    C4_CLR	  PORTC &= ~(1 << PC4)	    /*�õ͵�ƽ*/
;  #define    C4_SET	  PORTC |= (1 << PC4)		/*�øߵ�ƽ*/
;  #define    C4_R	    PINC & (1 <<PC4)		/*���˵�ƽ*/
; 
; /**************************************************************************
;                     ͨѶI/O�ռ䶨��
; ***************************************************************************/
;  #define       COM_IN          C4_IN  
;  #define       COM_OUT         C4_OUT
;  #define       COM_CLR         C4_CLR
;  #define       COM_SET         C4_SET
;  #define       COM_R           C4_R
;  
; /**************************************************************************
;                     ȫ�ֱ���������
; ***************************************************************************/
;       U8       i;
;       U8    U8FLAG,k;
;       U8    U8count,U8temp;
;       U8    U8T_data_H,U8T_data_L,U8RH_data_H,U8RH_data_L,U8checkdata;
;       U8    U8T_data_H_temp,U8T_data_L_temp,U8RH_data_H_temp,U8RH_data_L_temp,U8checkdata_temp;
;       U8    U8comdata;
;       U16   ReceiveHighByte;
;       U16   ReceiveLowByte;
; /**************************************************************************
; ***************************************************************************/
; void port_init(void)
; {
	.dbline 70
;  PORTB = 0x00;
	clr R2
	out 0x18,R2
	.dbline 71
;  DDRB  = 0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 72
;  PORTC = 0x03;                    
	ldi R24,3
	out 0x15,R24
	.dbline 73
;  DDRC  = 0x0C;
	ldi R24,12
	out 0x14,R24
	.dbline 74
;  PORTD = 0x00;
	out 0x12,R2
	.dbline 75
;  DDRD  = 0xF0;
	ldi R24,240
	out 0x11,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e watchdog_init _watchdog_init fV
	.even
_watchdog_init::
	.dbline -1
	.dbline 79
; }
; 
; void watchdog_init(void)
; {
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Delay _Delay fV
;              i -> R16,R17
	.even
_Delay::
	.dbline -1
	.dbline 86
;   //WDR();        //this prevents a timout on enabling
;   //WDTCR = 0x0F; //WATCHDOG ENABLED - dont forget to issue WDRs
; }
; 
; 
; void Delay(unsigned int i)
; {
L4:
	.dbline 87
L5:
	.dbline 87
; 	while(i--);
	movw R2,R16
	subi R16,1
	sbci R17,0
	tst R2
	brne L4
	tst R3
	brne L4
X0:
	.dbline -2
L3:
	.dbline 0 ; func end
	ret
	.dbsym r i 16 i
	.dbend
	.dbfunc e DelaymS _DelaymS fV
;              i -> R20,R21
;            dly -> R16,R17
	.even
_DelaymS::
	rcall push_gset1
	.dbline -1
	.dbline 91
; }
; 
; void DelaymS (U16 dly)                   
; {
	.dbline 93
; 	U16 i;
; 	for ( ; dly>0; dly--)
	rjmp L11
L8:
	.dbline 94
; 	{
	.dbline 95
; 	    WDR();
	wdr
	.dbline 96
	clr R20
	clr R21
	rjmp L15
L12:
	.dbline 96
L13:
	.dbline 96
	subi R20,255  ; offset = 1
	sbci R21,255
L15:
	.dbline 96
	cpi R20,8
	ldi R30,4
	cpc R21,R30
	brlo L12
	.dbline 97
L9:
	.dbline 93
	subi R16,1
	sbci R17,0
L11:
	.dbline 93
	cpi R16,0
	cpc R16,R17
	brne L8
X1:
	.dbline -2
L7:
	rcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r dly 16 i
	.dbend
	.dbfunc e Delay_10us _Delay_10us fV
;              i -> R16
	.even
_Delay_10us::
	.dbline -1
	.dbline 102
; 		for (i=0; i<1032; i++);        
; 	}
; }
; 
; 
;        void  Delay_10us(void)
;       {
	.dbline 104
;         U8 i;                     
;         i++;i++;i++;i++;i++;i++;i++;i++;i++;
	inc R16
	.dbline 104
	inc R16
	.dbline 104
	inc R16
	.dbline 104
	inc R16
	.dbline 104
	inc R16
	.dbline 104
	inc R16
	.dbline 104
	inc R16
	.dbline 104
	inc R16
	.dbline 104
	inc R16
	.dbline 105
; 		i++;i++;i++;i++;i++;i++;i++;i++;i++;
	inc R16
	.dbline 105
	inc R16
	.dbline 105
	inc R16
	.dbline 105
	inc R16
	.dbline 105
	inc R16
	.dbline 105
	inc R16
	.dbline 105
	inc R16
	.dbline 105
	inc R16
	.dbline 105
	inc R16
	.dbline 106
; 		i++;i++;i++;i++;i++;i++;i++;i++;i++;
	inc R16
	.dbline 106
	inc R16
	.dbline 106
	inc R16
	.dbline 106
	inc R16
	.dbline 106
	inc R16
	.dbline 106
	inc R16
	.dbline 106
	inc R16
	.dbline 106
	inc R16
	.dbline 106
	inc R16
	.dbline 107
; 		i++;i++;i++;i++;i++;i++;i++;i++;i++;
	inc R16
	.dbline 107
	inc R16
	.dbline 107
	inc R16
	.dbline 107
	inc R16
	.dbline 107
	inc R16
	.dbline 107
	inc R16
	.dbline 107
	inc R16
	.dbline 107
	inc R16
	.dbline 107
	inc R16
	.dbline 108
; 		i++;i++;i++;i++;i++;i++;i++;i++;i++;
	inc R16
	.dbline 108
	inc R16
	.dbline 108
	inc R16
	.dbline 108
	inc R16
	.dbline 108
	inc R16
	.dbline 108
	inc R16
	.dbline 108
	inc R16
	.dbline 108
	inc R16
	.dbline 108
	inc R16
	.dbline 109
; 		i++;i++;i++;i++;i++;i++;i++;i++;i++;
	inc R16
	.dbline 109
	inc R16
	.dbline 109
	inc R16
	.dbline 109
	inc R16
	.dbline 109
	inc R16
	.dbline 109
	inc R16
	.dbline 109
	inc R16
	.dbline 109
	inc R16
	.dbline 109
	inc R16
	.dbline 110
; 		i++;i++;i++;i++;i++;i++;i++;i++;i++;
	inc R16
	.dbline 110
	inc R16
	.dbline 110
	inc R16
	.dbline 110
	inc R16
	.dbline 110
	inc R16
	.dbline 110
	inc R16
	.dbline 110
	inc R16
	.dbline 110
	inc R16
	.dbline 110
	inc R16
	.dbline 111
; 		i++;i++;
	inc R16
	.dbline 111
	inc R16
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbsym r i 16 c
	.dbend
	.dbfunc e COM _COM fV
;              i -> R20
	.even
_COM::
	rcall push_gset1
	.dbline -1
	.dbline 114
;        }
;         void  COM(void)
;       {
	.dbline 117
;      
; 	        U8 i;
;        for(i=0;i<8;i++)	   
	clr R20
	rjmp L21
L18:
	.dbline 118
; 	    {
	.dbline 120
; 		
; 	   	    U8FLAG=2;
	ldi R24,2
	sts _U8FLAG,R24
L22:
	.dbline 121
L23:
	.dbline 121
; 	   	while((!(COM_R))&&U8FLAG++);
	sbic 0x13,4
	rjmp L25
	lds R2,_U8FLAG
	clr R3
	mov R24,R2
	subi R24,255    ; addi 1
	sts _U8FLAG,R24
	tst R2
	brne L22
L25:
	.dbline 122
; 		 if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L26
	.dbline 122
	rjmp L20
L26:
	.dbline 123
; 			Delay_10us();
	rcall _Delay_10us
	.dbline 124
; 			Delay_10us();
	rcall _Delay_10us
	.dbline 125
; 		    Delay_10us();
	rcall _Delay_10us
	.dbline 126
; 			Delay_10us();
	rcall _Delay_10us
	.dbline 127
; 	  		U8temp=0;
	clr R2
	sts _U8temp,R2
	.dbline 128
; 	     if(COM_R)U8temp=1;
	sbis 0x13,4
	rjmp L28
	.dbline 128
	ldi R24,1
	sts _U8temp,R24
L28:
	.dbline 129
; 		    U8FLAG=2;
	ldi R24,2
	sts _U8FLAG,R24
L30:
	.dbline 130
L31:
	.dbline 130
; 		   while((COM_R)&&U8FLAG++);
	sbis 0x13,4
	rjmp L33
	lds R2,_U8FLAG
	clr R3
	mov R24,R2
	subi R24,255    ; addi 1
	sts _U8FLAG,R24
	tst R2
	brne L30
L33:
	.dbline 132
; 	   	//��ʱ������forѭ��		  
; 	   	 if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L34
	.dbline 132
	rjmp L20
L34:
	.dbline 137
	lds R2,_U8comdata
	lsl R2
	sts _U8comdata,R2
	.dbline 138
	lds R2,_U8temp
	lds R3,_U8comdata
	or R3,R2
	sts _U8comdata,R3
	.dbline 139
L19:
	.dbline 117
	inc R20
L21:
	.dbline 117
	cpi R20,8
	brsh X2
	rjmp L18
X2:
L20:
	.dbline -2
L17:
	rcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
	.dbfunc e RH _RH fV
	.even
_RH::
	.dbline -1
	.dbline 157
; 	   	//�ж�����λ��0����1	 
; 	   	   
; 		// ����ߵ�ƽ�߹�Ԥ��0�ߵ�ƽֵ������λΪ 1 
; 	   	 
; 		   U8comdata<<=1;
; 	   	   U8comdata|=U8temp;        //0
; 	     }//rof
; 	   
; 	}
; 
; 	//--------------------------------
; 	//-----ʪ�ȶ�ȡ�ӳ��� ------------
; 	//--------------------------------
; 	//----���±�����Ϊȫ�ֱ���--------
; 	//----�¶ȸ�8λ== U8T_data_H------
; 	//----�¶ȵ�8λ== U8T_data_L------
; 	//----ʪ�ȸ�8λ== U8RH_data_H-----
; 	//----ʪ�ȵ�8λ== U8RH_data_L-----
; 	//----У�� 8λ == U8checkdata-----
; 	//----��������ӳ�������----------
; 	//---- Delay();, Delay_10us();,COM(); 
; 	//--------------------------------
; 
; 	void RH(void)
; 	{
	.dbline 160
; 	 
; 	  //��������18ms 
;        COM_OUT;
	sbi 0x14,4
	.dbline 161
;        COM_CLR;
	cbi 0x15,4
	.dbline 162
; 	   DelaymS(18);
	ldi R16,18
	ldi R17,0
	rcall _DelaymS
	.dbline 163
; 	   COM_IN;
	cbi 0x14,4
	.dbline 164
; 	   COM_SET;
	sbi 0x15,4
	.dbline 167
; 	  
; 	 //������������������ ������ʱ20us
; 	   Delay_10us();
	rcall _Delay_10us
	.dbline 168
; 	   Delay_10us();
	rcall _Delay_10us
	.dbline 169
; 	   Delay_10us();
	rcall _Delay_10us
	.dbline 170
; 	   Delay_10us();
	rcall _Delay_10us
	.dbline 176
; 	 //������Ϊ���� �жϴӻ���Ӧ�ź� 
; 	 //P2_0=1;
; 	 
; 	 //�жϴӻ��Ƿ��е͵�ƽ��Ӧ�ź� �粻��Ӧ����������Ӧ����������	  
; 	  // if(!P2_0)		 //T !	 
; 	   if(COM_R)U8FLAG=1;
	sbis 0x13,4
	rjmp L40
	.dbline 176
	ldi R24,1
	sts _U8FLAG,R24
	rjmp L40
L39:
	.dbline 178
; 	   while(!(COM_R))		 
; 	   {
	.dbline 179
; 	   U8FLAG=2;
	ldi R24,2
	sts _U8FLAG,R24
L42:
	.dbline 182
L43:
	.dbline 182
; 	 //�жϴӻ��Ƿ񷢳� 80us �ĵ͵�ƽ��Ӧ�ź��Ƿ����	 
; 	   //while((!P2_0)&&U8FLAG++);
; 	   while((!(COM_R))&&U8FLAG++);
	sbic 0x13,4
	rjmp L45
	lds R2,_U8FLAG
	clr R3
	mov R24,R2
	subi R24,255    ; addi 1
	sts _U8FLAG,R24
	tst R2
	brne L42
L45:
	.dbline 183
; 	   if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L46
	.dbline 183
	rjmp L41
L46:
	.dbline 184
; 	   U8FLAG=2;
	ldi R24,2
	sts _U8FLAG,R24
L48:
	.dbline 187
L49:
	.dbline 187
; 	 //�жϴӻ��Ƿ񷢳� 80us �ĸߵ�ƽ���緢����������ݽ���״̬
; 	 //while((P2_0)&&U8FLAG++);
; 	   while((COM_R)&&U8FLAG++);
	sbis 0x13,4
	rjmp L51
	lds R2,_U8FLAG
	clr R3
	mov R24,R2
	subi R24,255    ; addi 1
	sts _U8FLAG,R24
	tst R2
	brne L48
L51:
	.dbline 188
; 	   if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L52
	.dbline 188
	rjmp L41
L52:
	.dbline 190
; 	 //���ݽ���״̬		 
; 	   COM();
	rcall _COM
	.dbline 191
; 	   if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L54
	.dbline 191
	rjmp L41
L54:
	.dbline 192
; 	   U8T_data_H_temp=U8comdata;
	lds R2,_U8comdata
	sts _U8T_data_H_temp,R2
	.dbline 193
; 	   COM();
	rcall _COM
	.dbline 194
; 	   if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L56
	.dbline 194
	rjmp L41
L56:
	.dbline 195
; 	   U8T_data_L_temp=U8comdata; 
	lds R2,_U8comdata
	sts _U8T_data_L_temp,R2
	.dbline 196
; 	   COM();
	rcall _COM
	.dbline 197
; 	   if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L58
	.dbline 197
	rjmp L41
L58:
	.dbline 198
; 	   U8RH_data_H_temp=U8comdata;
	lds R2,_U8comdata
	sts _U8RH_data_H_temp,R2
	.dbline 199
; 	   COM();
	rcall _COM
	.dbline 200
; 	   if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L60
	.dbline 200
	rjmp L41
L60:
	.dbline 201
; 	   U8RH_data_L_temp=U8comdata;
	lds R2,_U8comdata
	sts _U8RH_data_L_temp,R2
	.dbline 202
; 	   COM();
	rcall _COM
	.dbline 203
; 	   if(U8FLAG==1)break;
	lds R24,_U8FLAG
	cpi R24,1
	brne L62
	.dbline 203
	rjmp L41
L62:
	.dbline 204
	lds R2,_U8comdata
	sts _U8checkdata_temp,R2
	.dbline 205
	rjmp L41
L40:
	.dbline 177
	sbis 0x13,4
	rjmp L39
L41:
	.dbline 208
; 	   U8checkdata_temp=U8comdata;
; 	   break;
; 	    }//while
; 	   //P2_0=1;
; 	   COM_IN;
	cbi 0x14,4
	.dbline 209
; 	   COM_SET;
	sbi 0x15,4
	.dbline 212
; 	 //����У�� 
; 	 
; 	   U8temp=(U8T_data_H_temp+U8T_data_L_temp+U8RH_data_H_temp+U8RH_data_L_temp);
	lds R2,_U8T_data_L_temp
	lds R3,_U8T_data_H_temp
	add R3,R2
	lds R2,_U8RH_data_H_temp
	add R3,R2
	lds R2,_U8RH_data_L_temp
	add R3,R2
	sts _U8temp,R3
	.dbline 213
; 	   if(U8temp==U8checkdata_temp)
	lds R2,_U8checkdata_temp
	cp R3,R2
	brne L64
	.dbline 214
; 	   {
	.dbline 215
; 	   	  U8RH_data_H=U8T_data_H_temp;
	lds R2,_U8T_data_H_temp
	sts _U8RH_data_H,R2
	.dbline 216
; 	   	  U8RH_data_L=U8T_data_L_temp;
	lds R2,_U8T_data_L_temp
	sts _U8RH_data_L,R2
	.dbline 217
; 	   	  U8T_data_H=U8RH_data_H_temp;
	lds R2,_U8RH_data_H_temp
	sts _U8T_data_H,R2
	.dbline 218
; 	   	  U8T_data_L=U8RH_data_L_temp;
	lds R2,_U8RH_data_L_temp
	sts _U8T_data_L,R2
	.dbline 219
; 	   	  U8checkdata=U8checkdata_temp;
	lds R2,_U8checkdata_temp
	sts _U8checkdata,R2
	.dbline 220
; 	   }//fi
L64:
	.dbline 223
; 	  
; 	  
; 	   COM_IN;
	cbi 0x14,4
	.dbline 224
; 	   COM_SET;
	sbi 0x15,4
	.dbline -2
L36:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Uart_Init _Uart_Init fV
	.even
_Uart_Init::
	.dbline -1
	.dbline 235
; 
; 	}
; 	
; /*
; ���ڳ�ʼ������
; ϵͳƵ�ʣ�2MHz
; ֹͣλ��1
; �����ʣ�9600
; ���ݳ��ȣ�8
; */
; void Uart_Init(void) {
	.dbline 236
; 	UCSRA = 0x02;		/*2����					 */
	ldi R24,2
	out 0xb,R24
	.dbline 237
; 	UCSRB = 0x18;		/*������պͷ���*/
	ldi R24,24
	out 0xa,R24
	.dbline 238
; 	UCSRC = 0x06;		/*8λ����				 */
	ldi R24,6
	out 0x20,R24
	.dbline 239
; 	UBRRH = 0x00;
	clr R2
	out 0x20,R2
	.dbline 241
; 	//UBRRL = 47;		/*9600		3.6864M      */  
; 	UBRRL = 95;		    /*9600	    7.3728M      */ 
	ldi R24,95
	out 0x9,R24
	.dbline -2
L66:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Uart_Transmit _Uart_Transmit fV
;              i -> R16
	.even
_Uart_Transmit::
	.dbline -1
	.dbline 248
; }
; 
; /*
; �����ݷ���
; ��ѯ��ʽ����
; */
; void Uart_Transmit(unsigned char i) {
L68:
	.dbline 251
L69:
	.dbline 251
; 
; 	/* �ȴ����ͻ�����Ϊ��*/
; 	while (!(UCSRA & (1<<UDRE)));
	sbis 0xb,5
	rjmp L68
	.dbline 253
; 	/* �����ݷ��뻺��������������*/
; 	UDR = i;
	out 0xc,R16
	.dbline -2
L67:
	.dbline 0 ; func end
	ret
	.dbsym r i 16 c
	.dbend
	.dbfunc e Uart_Receive _Uart_Receive fc
	.even
_Uart_Receive::
	.dbline -1
	.dbline 260
; }
; 
; /*
; �����ݽ���
; ��ѯ��ʽ����
; */
; unsigned char Uart_Receive( void ) {
L72:
	.dbline 263
L73:
	.dbline 263
; 
; 	/* �ȴ���������*/
; 	while (!(UCSRA & (1<<RXC)));
	sbis 0xb,7
	rjmp L72
	.dbline 266
; 	/* �ӻ������л�ȡ����������*/
; 	// Uart_Transmit(UDR);
; 	return UDR;
	in R16,0xc
	.dbline -2
L71:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e init_devices _init_devices fV
;              i -> <dead>
	.even
_init_devices::
	.dbline -1
	.dbline 270
; }
; 
; void init_devices(void) 
; {
	.dbline 272
; unsigned char i;
; 		   CLI();                     
	cli
	.dbline 273
;      port_init();
	rcall _port_init
	.dbline 274
;  watchdog_init();
	rcall _watchdog_init
	.dbline 275
;     Uart_Init();
	rcall _Uart_Init
	.dbline 276
;     MCUCR = 0x03;
	ldi R24,3
	out 0x35,R24
	.dbline 277
;     GICR  = 0x00;                //���ⲿ�ж�0
	clr R2
	out 0x3b,R2
	.dbline 278
;     TIMSK = 0x00;                //�ض�ʱ��1�ж�
	out 0x39,R2
	.dbline 279
;            SEI();                //re-enable interrupts
	sei
	.dbline -2
L75:
	.dbline 0 ; func end
	ret
	.dbsym l i 1 c
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 295
;                            
; }	
; /**************************************************************************
; 
; 
; 
;                             ������
; 							
; 							
; 							
; 							
; **************************************************************************/
; 
; 
;  void main(void)
; {
	.dbline 297
; 
;  init_devices() ;
	rcall _init_devices
	.dbline 298
;  COM_IN;
	cbi 0x14,4
	.dbline 299
;  COM_SET;
	sbi 0x15,4
	rjmp L78
L77:
	.dbline 302
;  
;  while(1)
;  {
	.dbline 305
;  
;  //��DHT11   
;   RH();
	rcall _RH
	.dbline 313
;   
;   //��DHT11��ʮ����������ת����10����  
;   //��ʽ  ʪ��  �¶�  У���   
;   //���紮�ڷ�������   59 00 24 00 53   ��ʪ��Ϊ59 �¶�Ϊ24 У���Ϊ53 
;   
;   
;   
;   U8temp=U8RH_data_H/10;
	ldi R17,10
	lds R16,_U8RH_data_H
	rcall div8u
	sts _U8temp,R16
	.dbline 314
;   U8temp<<=4;
	mov R24,R16
	andi R24,#0x0F
	swap R24
	sts _U8temp,R24
	.dbline 315
;   U8temp|=U8RH_data_H%10;
	ldi R17,10
	lds R16,_U8RH_data_H
	rcall mod8u
	lds R2,_U8temp
	or R2,R16
	sts _U8temp,R2
	.dbline 316
;   U8RH_data_H=U8temp;
	sts _U8RH_data_H,R2
	.dbline 317
;   Uart_Transmit(U8RH_data_H); 
	mov R16,R2
	rcall _Uart_Transmit
	.dbline 318
;   Uart_Transmit(U8RH_data_L);
	lds R16,_U8RH_data_L
	rcall _Uart_Transmit
	.dbline 320
;   
;   U8temp=U8T_data_H/10;
	ldi R17,10
	lds R16,_U8T_data_H
	rcall div8u
	sts _U8temp,R16
	.dbline 321
;   U8temp<<=4;
	mov R24,R16
	andi R24,#0x0F
	swap R24
	sts _U8temp,R24
	.dbline 322
;   U8temp|=U8T_data_H%10;
	ldi R17,10
	lds R16,_U8T_data_H
	rcall mod8u
	lds R2,_U8temp
	or R2,R16
	sts _U8temp,R2
	.dbline 323
;   U8T_data_H=U8temp;
	sts _U8T_data_H,R2
	.dbline 324
;   Uart_Transmit(U8T_data_H);  
	mov R16,R2
	rcall _Uart_Transmit
	.dbline 325
;   Uart_Transmit(U8T_data_L); 
	lds R16,_U8T_data_L
	rcall _Uart_Transmit
	.dbline 328
;   
; 
;   Uart_Transmit(U8checkdata); 
	lds R16,_U8checkdata
	rcall _Uart_Transmit
	.dbline 330
;   //��ʱ2S
;   for(U8temp=0;U8temp<200;U8temp++)
	clr R2
	sts _U8temp,R2
	rjmp L83
L80:
	.dbline 331
	.dbline 332
	ldi R16,10
	ldi R17,0
	rcall _DelaymS
	.dbline 334
L81:
	.dbline 330
	lds R24,_U8temp
	subi R24,255    ; addi 1
	sts _U8temp,R24
L83:
	.dbline 330
	lds R24,_U8temp
	cpi R24,200
	brlo L80
	.dbline 336
L78:
	.dbline 301
	rjmp L77
X3:
	.dbline -2
L76:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile C:\DOCUME~1\Owner\����\C\���ͻ����԰�\DHT11_7.3728\M8_7.3728\Display_DHTXX.c
_ReceiveLowByte::
	.blkb 2
	.dbsym e ReceiveLowByte _ReceiveLowByte i
_ReceiveHighByte::
	.blkb 2
	.dbsym e ReceiveHighByte _ReceiveHighByte i
_U8comdata::
	.blkb 1
	.dbsym e U8comdata _U8comdata c
_U8checkdata_temp::
	.blkb 1
	.dbsym e U8checkdata_temp _U8checkdata_temp c
_U8RH_data_L_temp::
	.blkb 1
	.dbsym e U8RH_data_L_temp _U8RH_data_L_temp c
_U8RH_data_H_temp::
	.blkb 1
	.dbsym e U8RH_data_H_temp _U8RH_data_H_temp c
_U8T_data_L_temp::
	.blkb 1
	.dbsym e U8T_data_L_temp _U8T_data_L_temp c
_U8T_data_H_temp::
	.blkb 1
	.dbsym e U8T_data_H_temp _U8T_data_H_temp c
_U8checkdata::
	.blkb 1
	.dbsym e U8checkdata _U8checkdata c
_U8RH_data_L::
	.blkb 1
	.dbsym e U8RH_data_L _U8RH_data_L c
_U8RH_data_H::
	.blkb 1
	.dbsym e U8RH_data_H _U8RH_data_H c
_U8T_data_L::
	.blkb 1
	.dbsym e U8T_data_L _U8T_data_L c
_U8T_data_H::
	.blkb 1
	.dbsym e U8T_data_H _U8T_data_H c
_U8temp::
	.blkb 1
	.dbsym e U8temp _U8temp c
_U8count::
	.blkb 1
	.dbsym e U8count _U8count c
_k::
	.blkb 1
	.dbsym e k _k c
_U8FLAG::
	.blkb 1
	.dbsym e U8FLAG _U8FLAG c
_i::
	.blkb 1
	.dbsym e i _i c
