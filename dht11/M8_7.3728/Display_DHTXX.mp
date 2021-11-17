NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0026   0418 =   1048. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0013  __text_start
       0013  __start
       0032  _exit
       0033  _port_init
       003F  _watchdog_init
       0040  _Delay
       0048  _DelaymS
       005B  _Delay_10us
       009D  _COM
       00E4  _RH
       017A  _Uart_Init
       0185  _Uart_Transmit
       0189  _Uart_Receive
       018D  _init_devices
       0198  _main
       01E8  mod8u
       01EA  div8u
       01EB  xdiv8u
       0200  push_gset5
       0202  push_gset4
       0204  push_gset3
       0206  push_gset2
       0208  push_gset1
       020B  pop_gset1
       020C  pop
       021F  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0060   0014 =     20. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __bss_start
       0060  _ReceiveLowByte
       0062  _ReceiveHighByte
       0064  _U8comdata
       0065  _U8checkdata_temp
       0066  _U8RH_data_L_temp
       0067  _U8RH_data_H_temp
       0068  _U8T_data_L_temp
       0069  _U8T_data_H_temp
       006A  _U8checkdata
       006B  _U8RH_data_L
       006C  _U8RH_data_H
       006D  _U8T_data_L
       006E  _U8T_data_H
       006F  _U8temp
       0070  _U8count
       0071  _k
       0072  _U8FLAG
       0073  _i
       0074  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtAVR.o	[ crtavr.s ]
Display_DHTXX.o	[ Display_DHTXX.c ]
<library>	[ div8u.s, gpush.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x26
data = 0x60
eeprom:1.512

