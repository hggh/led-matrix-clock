EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L usbc-connector:USB-C_Connector P1
U 1 1 61A6F7DA
P 1250 2400
F 0 "P1" H 1357 3667 50  0000 C CNN
F 1 "USB-C_Connector" H 1357 3576 50  0000 C CNN
F 2 "usbc-connector:USB-C Connector" H 1400 2400 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1400 2400 50  0001 C CNN
	1    1250 2400
	1    0    0    -1  
$EndComp
NoConn ~ 950  4000
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 61A70E15
P 3000 2000
F 0 "J1" H 2972 1882 50  0000 R CNN
F 1 "5V" H 2972 1973 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 3000 2000 50  0001 C CNN
F 3 "~" H 3000 2000 50  0001 C CNN
	1    3000 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1250 4000 1450 4000
Wire Wire Line
	2800 4000 2800 2400
Connection ~ 1450 4000
Wire Wire Line
	1450 4000 2800 4000
Wire Wire Line
	1850 1600 1850 1700
Wire Wire Line
	1850 1700 2800 1700
Wire Wire Line
	2800 1700 2800 1900
Connection ~ 1850 1700
$Comp
L Device:R R2
U 1 1 61A71E6F
P 2500 2050
F 0 "R2" H 2570 2096 50  0000 L CNN
F 1 "5k1" H 2570 2005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2430 2050 50  0001 C CNN
F 3 "~" H 2500 2050 50  0001 C CNN
	1    2500 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61A72784
P 2250 2250
F 0 "R1" H 2320 2296 50  0000 L CNN
F 1 "5k1" H 2320 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 2250 50  0001 C CNN
F 3 "~" H 2250 2250 50  0001 C CNN
	1    2250 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1900 1850 1900
Wire Wire Line
	1850 2100 2250 2100
Wire Wire Line
	2500 2200 2800 2200
Connection ~ 2800 2200
Wire Wire Line
	2800 2200 2800 2000
Wire Wire Line
	2250 2400 2800 2400
Connection ~ 2800 2400
Wire Wire Line
	2800 2400 2800 2200
Text Label 2100 1900 0    50   ~ 0
CC1
Text Label 2100 2100 0    50   ~ 0
CC2
Text Label 2150 1700 0    50   ~ 0
VBUS
Text Label 2100 4000 0    50   ~ 0
GND
$Comp
L Mechanical:MountingHole H1
U 1 1 61A748BA
P 3550 800
F 0 "H1" H 3650 846 50  0000 L CNN
F 1 "MountingHole" H 3650 755 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 3550 800 50  0001 C CNN
F 3 "~" H 3550 800 50  0001 C CNN
	1    3550 800 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 61A78E63
P 3550 1200
F 0 "H3" H 3650 1246 50  0000 L CNN
F 1 "MountingHole" H 3650 1155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 3550 1200 50  0001 C CNN
F 3 "~" H 3550 1200 50  0001 C CNN
	1    3550 1200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
