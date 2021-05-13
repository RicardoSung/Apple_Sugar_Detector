EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
L ricardo:TCD1304DG_8Z,AW_ IC1
U 1 1 6096A352
P 11250 4300
F 0 "IC1" H 11850 4565 50  0000 C CNN
F 1 "TCD1304DG_8Z,AW_" H 11850 4474 50  0000 C CNN
F 2 "ricardo:DIP1016W62P254L4160H372Q22N" H 12300 4400 50  0001 L CNN
F 3 "http://www.spectralproducts.com/pdf/TCD1304.pdf" H 12300 4300 50  0001 L CNN
F 4 "Image Sensors & Color Sensors CCD Linear Sensor 3648 8x20 54mm" H 12300 4200 50  0001 L CNN "Description"
F 5 "3.72" H 12300 4100 50  0001 L CNN "Height"
F 6 "Toshiba" H 12300 4000 50  0001 L CNN "Manufacturer_Name"
F 7 "TCD1304DG(8Z,AW)" H 12300 3900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "757-TCD1304DG8ZAW" H 12300 3800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Toshiba/TCD1304DG8ZAW?qs=OLJpxlzHOSRVMcyirxbASw%3D%3D" H 12300 3700 50  0001 L CNN "Mouser Price/Stock"
F 10 "TCD1304DG(8Z,AW)" H 12300 3600 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/tcd1304dg-8zaw/toshiba" H 12300 3500 50  0001 L CNN "Arrow Price/Stock"
	1    11250 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 4800 11150 4800
Wire Wire Line
	11150 4800 11150 4900
Wire Wire Line
	11150 4900 11250 4900
Wire Wire Line
	11250 5000 11150 5000
Wire Wire Line
	11150 5000 11150 4900
Connection ~ 11150 4900
Wire Wire Line
	11250 5100 11150 5100
Wire Wire Line
	11150 5100 11150 5000
Connection ~ 11150 5000
Wire Wire Line
	11250 5200 11150 5200
Wire Wire Line
	11150 5200 11150 5100
Connection ~ 11150 5100
Wire Wire Line
	11250 5300 11150 5300
Wire Wire Line
	11150 5300 11150 5200
Connection ~ 11150 5200
Wire Wire Line
	12450 4300 12550 4300
Wire Wire Line
	12550 4300 12550 4500
Wire Wire Line
	12550 4500 12450 4500
Wire Wire Line
	12450 4600 12550 4600
Wire Wire Line
	12550 4600 12550 4500
Connection ~ 12550 4500
Wire Wire Line
	12450 4700 12550 4700
Wire Wire Line
	12550 4700 12550 4600
Connection ~ 12550 4600
Wire Wire Line
	12450 4800 12550 4800
Wire Wire Line
	12550 4800 12550 4700
Connection ~ 12550 4700
Wire Wire Line
	12450 4900 12550 4900
Wire Wire Line
	12550 4900 12550 4800
Connection ~ 12550 4800
Wire Wire Line
	12450 5000 12550 5000
Wire Wire Line
	12550 5000 12550 4900
Connection ~ 12550 4900
Wire Wire Line
	12450 5100 12550 5100
Wire Wire Line
	12550 5100 12550 5000
Connection ~ 12550 5000
Wire Wire Line
	12450 5200 12550 5200
Wire Wire Line
	12550 5200 12550 5100
Connection ~ 12550 5100
Wire Wire Line
	12450 5300 12550 5300
Wire Wire Line
	12550 5300 12550 5200
Connection ~ 12550 5200
Wire Wire Line
	11150 5300 11150 5500
Wire Wire Line
	11150 5500 12550 5500
Wire Wire Line
	12550 5500 12550 5300
Connection ~ 11150 5300
Connection ~ 12550 5300
Wire Wire Line
	12550 5500 12550 5800
Connection ~ 12550 5500
$Comp
L power:GND #PWR0101
U 1 1 60970151
P 12550 5800
F 0 "#PWR0101" H 12550 5550 50  0001 C CNN
F 1 "GND" H 12555 5627 50  0000 C CNN
F 2 "" H 12550 5800 50  0001 C CNN
F 3 "" H 12550 5800 50  0001 C CNN
	1    12550 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 4300 11150 4300
Wire Wire Line
	11150 4300 11150 4400
Wire Wire Line
	11150 4400 11250 4400
Wire Wire Line
	11150 4300 11150 3850
Connection ~ 11150 4300
$Comp
L lc_Cap:0603_100nF__104_10%_50V C1
U 1 1 60973EDB
P 11450 3850
F 0 "C1" H 11800 4097 50  0000 C CNN
F 1 "0603_100nF__104_10%_50V" H 11499 4080 50  0001 L BNN
F 2 "lc_lib:0603_C" H 11449 3570 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 11449 3670 50  0001 L BNN
F 4 "贴片电容" H 11450 3850 50  0001 C CNN "description"
F 5 "供应商链接" H 11449 3470 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 11449 3370 50  0001 L BNN "Package"
F 7 "LC" H 11449 3270 50  0001 L BNN "Supplier"
F 8 "C14663" H 11449 3170 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 11449 3070 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" H 11800 4006 50  0000 C CNN "Comment"
	1    11450 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11650 3850 11150 3850
Connection ~ 11150 3850
Wire Wire Line
	11150 3850 11150 3550
Wire Wire Line
	11950 3850 12550 3850
Wire Wire Line
	12550 3850 12550 4300
Connection ~ 12550 4300
Wire Wire Line
	12450 4400 12850 4400
$Comp
L lc_RES:0603_150Ω__1500_1% R1
U 1 1 60977411
P 13050 4400
F 0 "R1" H 13050 4607 50  0000 C CNN
F 1 "0603_150Ω__1500_1%" H 12900 4590 50  0001 L BNN
F 2 "lc_lib:0603_R" H 12850 4160 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_23535.html" H 12850 4260 50  0001 L BNN
F 4 "贴片电阻" H 13050 4400 50  0001 C CNN "description"
F 5 "供应商链接" H 12850 4060 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 12850 3960 50  0001 L BNN "Package"
F 7 "LC" H 12850 3860 50  0001 L BNN "Supplier"
F 8 "C22808" H 12850 3760 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 12850 3660 50  0001 L BNN "Notepad"
F 10 "150Ω (1500) ±1%" H 13050 4516 50  0000 C CNN "Comment"
	1    13050 4400
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0603_150Ω__1500_1% R2
U 1 1 60978B81
P 13650 4900
F 0 "R2" V 13604 4970 50  0000 L CNN
F 1 "0603_150Ω__1500_1%" H 13500 5090 50  0001 L BNN
F 2 "lc_lib:0603_R" H 13450 4660 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_23535.html" H 13450 4760 50  0001 L BNN
F 4 "贴片电阻" H 13650 4900 50  0001 C CNN "description"
F 5 "供应商链接" H 13450 4560 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 13450 4460 50  0001 L BNN "Package"
F 7 "LC" H 13450 4360 50  0001 L BNN "Supplier"
F 8 "C22808" H 13450 4260 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 13450 4160 50  0001 L BNN "Notepad"
F 10 "150Ω (1500) ±1%" V 13695 4970 50  0000 L CNN "Comment"
	1    13650 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	13650 5100 13650 5200
Wire Wire Line
	13650 5200 12550 5200
Wire Wire Line
	13250 4400 13350 4400
Wire Wire Line
	13650 4200 13650 3600
Wire Wire Line
	13650 3600 13400 3600
$Comp
L ricardo:TC7WH14FU U1
U 1 1 6097E246
P 10000 4550
F 0 "U1" H 10000 4925 50  0000 C CNN
F 1 "TC7WH14FU" H 10000 4834 50  0000 C CNN
F 2 "ricardo:SOP65P640X120-8N" H 10050 4850 50  0001 C CNN
F 3 "" H 10050 4850 50  0001 C CNN
	1    10000 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 4500 11250 4500
Wire Wire Line
	10300 4700 11250 4700
Wire Wire Line
	9700 4500 9600 4500
Wire Wire Line
	9600 4500 9600 4800
Wire Wire Line
	9600 4800 10850 4800
Wire Wire Line
	10850 4800 10850 4600
Wire Wire Line
	10850 4600 11250 4600
Wire Wire Line
	10300 4400 10850 4400
Wire Wire Line
	10850 4400 10850 3850
Wire Wire Line
	10850 3850 11150 3850
Wire Wire Line
	9700 4700 9500 4700
$Comp
L power:GND #PWR0103
U 1 1 60985428
P 9500 4700
F 0 "#PWR0103" H 9500 4450 50  0001 C CNN
F 1 "GND" V 9505 4572 50  0000 R CNN
F 2 "" H 9500 4700 50  0001 C CNN
F 3 "" H 9500 4700 50  0001 C CNN
	1    9500 4700
	0    1    1    0   
$EndComp
$Comp
L ricardo:AP7332-3333W6-7 PS1
U 1 1 60986E3A
P 6550 3800
F 0 "PS1" H 7100 4065 50  0000 C CNN
F 1 "AP7332-3333W6-7" H 7100 3974 50  0000 C CNN
F 2 "ricardo:SOT95P275X110-6N" H 7500 3900 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/8228871P" H 7500 3800 50  0001 L CNN
F 4 "DiodesZetex AP7332-3333W6-7, Dual LDO Voltage Regulator, 300mA, 3.3 V +/-2%, 2  6 Vin, 6-Pin SOT-26" H 7500 3700 50  0001 L CNN "Description"
F 5 "1.1" H 7500 3600 50  0001 L CNN "Height"
F 6 "Diodes Inc." H 7500 3500 50  0001 L CNN "Manufacturer_Name"
F 7 "AP7332-3333W6-7" H 7500 3400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "621-AP7332-3333W6-7" H 7500 3300 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=621-AP7332-3333W6-7" H 7500 3200 50  0001 L CNN "Mouser Price/Stock"
F 10 "AP7332-3333W6-7" H 7500 3100 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/ap7332-3333w6-7/diodes-incorporated" H 7500 3000 50  0001 L CNN "Arrow Price/Stock"
	1    6550 3800
	1    0    0    -1  
$EndComp
Text Label 11150 3550 3    50   ~ 0
3v3_1
Wire Wire Line
	7650 3800 7750 3800
Wire Wire Line
	6550 3800 6450 3800
Text Label 8000 3800 2    50   ~ 0
3v3_2
Text Label 6150 3800 0    50   ~ 0
3v3_1
Wire Wire Line
	6550 3900 6350 3900
$Comp
L power:GND #PWR0102
U 1 1 609906BD
P 6350 3900
F 0 "#PWR0102" H 6350 3650 50  0001 C CNN
F 1 "GND" V 6355 3772 50  0000 R CNN
F 2 "" H 6350 3900 50  0001 C CNN
F 3 "" H 6350 3900 50  0001 C CNN
	1    6350 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 3900 7750 3900
$Comp
L power:VCC #PWR0104
U 1 1 60991E52
P 8150 3900
F 0 "#PWR0104" H 8150 3750 50  0001 C CNN
F 1 "VCC" V 8165 4028 50  0000 L CNN
F 2 "" H 8150 3900 50  0001 C CNN
F 3 "" H 8150 3900 50  0001 C CNN
	1    8150 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 4000 6450 4000
Wire Wire Line
	6450 4000 6450 4150
Wire Wire Line
	6450 4150 7750 4150
Wire Wire Line
	7750 4150 7750 4000
Wire Wire Line
	7750 4000 7650 4000
Wire Wire Line
	7750 4000 7750 3900
Connection ~ 7750 4000
Connection ~ 7750 3900
Wire Wire Line
	7750 3900 7950 3900
$Comp
L lc_Cap:0603_1uF__105_10%_50V C4
U 1 1 609ADD7A
P 7950 3750
F 0 "C4" V 8254 3860 50  0000 L CNN
F 1 "0603_1uF__105_10%_50V" H 7999 3980 50  0001 L BNN
F 2 "lc_lib:0603_C" H 7949 3470 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_16531.html" H 7949 3570 50  0001 L BNN
F 4 "贴片电容" H 7950 3750 50  0001 C CNN "description"
F 5 "供应商链接" H 7949 3370 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 7949 3270 50  0001 L BNN "Package"
F 7 "LC" H 7949 3170 50  0001 L BNN "Supplier"
F 8 "C15849" H 7949 3070 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 7949 2970 50  0001 L BNN "Notepad"
F 10 "1uF (105) 10% 50V" V 8345 3860 50  0000 L CNN "Comment"
	1    7950 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 3900 7950 3950
Connection ~ 7950 3900
Wire Wire Line
	7950 3900 8150 3900
Wire Wire Line
	7950 4250 7950 4400
$Comp
L power:GND #PWR0105
U 1 1 609B2B59
P 7950 4400
F 0 "#PWR0105" H 7950 4150 50  0001 C CNN
F 1 "GND" H 7955 4227 50  0000 C CNN
F 2 "" H 7950 4400 50  0001 C CNN
F 3 "" H 7950 4400 50  0001 C CNN
	1    7950 4400
	1    0    0    -1  
$EndComp
$Comp
L lc_Cap:0603_1uF__105_10%_50V C3
U 1 1 609B2CC9
P 7750 3250
F 0 "C3" V 8054 3360 50  0000 L CNN
F 1 "0603_1uF__105_10%_50V" H 7799 3480 50  0001 L BNN
F 2 "lc_lib:0603_C" H 7749 2970 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_16531.html" H 7749 3070 50  0001 L BNN
F 4 "贴片电容" H 7750 3250 50  0001 C CNN "description"
F 5 "供应商链接" H 7749 2870 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 7749 2770 50  0001 L BNN "Package"
F 7 "LC" H 7749 2670 50  0001 L BNN "Supplier"
F 8 "C15849" H 7749 2570 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 7749 2470 50  0001 L BNN "Notepad"
F 10 "1uF (105) 10% 50V" V 8145 3360 50  0000 L CNN "Comment"
	1    7750 3250
	0    1    1    0   
$EndComp
$Comp
L lc_Cap:0603_1uF__105_10%_50V C2
U 1 1 609B3AE2
P 6450 3250
F 0 "C2" V 6754 3360 50  0000 L CNN
F 1 "0603_1uF__105_10%_50V" H 6499 3480 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6449 2970 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_16531.html" H 6449 3070 50  0001 L BNN
F 4 "贴片电容" H 6450 3250 50  0001 C CNN "description"
F 5 "供应商链接" H 6449 2870 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6449 2770 50  0001 L BNN "Package"
F 7 "LC" H 6449 2670 50  0001 L BNN "Supplier"
F 8 "C15849" H 6449 2570 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6449 2470 50  0001 L BNN "Notepad"
F 10 "1uF (105) 10% 50V" V 6845 3360 50  0000 L CNN "Comment"
	1    6450 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 3750 6450 3800
Connection ~ 6450 3800
Wire Wire Line
	6450 3800 6150 3800
Wire Wire Line
	7750 3750 7750 3800
Connection ~ 7750 3800
Wire Wire Line
	7750 3800 8000 3800
Wire Wire Line
	6450 3450 6450 3400
Wire Wire Line
	6450 3400 7100 3400
Wire Wire Line
	7750 3400 7750 3450
Wire Wire Line
	7100 3400 7100 3300
Connection ~ 7100 3400
Wire Wire Line
	7100 3400 7750 3400
$Comp
L power:GND #PWR0106
U 1 1 609BC0BB
P 7100 3300
F 0 "#PWR0106" H 7100 3050 50  0001 C CNN
F 1 "GND" H 7105 3127 50  0000 C CNN
F 2 "" H 7100 3300 50  0001 C CNN
F 3 "" H 7100 3300 50  0001 C CNN
	1    7100 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	8000 5250 8000 5150
Wire Wire Line
	8000 5150 8100 5150
Wire Wire Line
	8500 5150 8500 5250
Wire Wire Line
	8400 5250 8400 5150
Connection ~ 8400 5150
Wire Wire Line
	8400 5150 8500 5150
Wire Wire Line
	8300 5250 8300 5150
Connection ~ 8300 5150
Wire Wire Line
	8300 5150 8400 5150
Wire Wire Line
	8200 5250 8200 5150
Connection ~ 8200 5150
Wire Wire Line
	8200 5150 8250 5150
Wire Wire Line
	8100 5250 8100 5150
Connection ~ 8100 5150
Wire Wire Line
	8100 5150 8200 5150
Connection ~ 8250 5150
Wire Wire Line
	8250 5150 8300 5150
Wire Wire Line
	8250 4850 8250 5150
Text Label 8250 4850 3    50   ~ 0
3v3_2
Wire Wire Line
	8100 8850 8100 8950
Wire Wire Line
	8100 8950 8200 8950
Wire Wire Line
	8300 8950 8300 8850
Wire Wire Line
	8200 8850 8200 8950
Connection ~ 8200 8950
Wire Wire Line
	8200 8950 8300 8950
Wire Wire Line
	8200 8950 8200 9150
$Comp
L power:GND #PWR0107
U 1 1 609E10D3
P 8200 9150
F 0 "#PWR0107" H 8200 8900 50  0001 C CNN
F 1 "GND" H 8205 8977 50  0000 C CNN
F 2 "" H 8200 9150 50  0001 C CNN
F 3 "" H 8200 9150 50  0001 C CNN
	1    8200 9150
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0603_2.2KΩ__2201_1% R23
U 1 1 609E81D9
P 13200 3600
F 0 "R23" H 13200 3807 50  0000 C CNN
F 1 "0603_2.2KΩ__2201_1%" H 13050 3790 50  0001 L BNN
F 2 "lc_lib:0603_R" H 13000 3360 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_4597.html" H 13000 3460 50  0001 L BNN
F 4 "贴片电阻" H 13200 3600 50  0001 C CNN "description"
F 5 "供应商链接" H 13000 3260 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 13000 3160 50  0001 L BNN "Package"
F 7 "LC" H 13000 3060 50  0001 L BNN "Supplier"
F 8 "C4190" H 13000 2960 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 13000 2860 50  0001 L BNN "Notepad"
F 10 "2.2KΩ (2201) ±1%" H 13200 3716 50  0000 C CNN "Comment"
	1    13200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 3600 12650 3600
Text Label 12650 3600 0    50   ~ 0
3v3_1
Wire Wire Line
	13650 3600 13650 3200
Connection ~ 13650 3600
$Comp
L lc_Cap:0603_100nF__104_10%_50V C12
U 1 1 609F0C75
P 6400 5850
F 0 "C12" H 6750 6097 50  0000 C CNN
F 1 "0603_100nF__104_10%_50V" H 6449 6080 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6399 5570 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 6399 5670 50  0001 L BNN
F 4 "贴片电容" H 6400 5850 50  0001 C CNN "description"
F 5 "供应商链接" H 6399 5470 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6399 5370 50  0001 L BNN "Package"
F 7 "LC" H 6399 5270 50  0001 L BNN "Supplier"
F 8 "C14663" H 6399 5170 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6399 5070 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" H 6750 6006 50  0000 C CNN "Comment"
	1    6400 5850
	1    0    0    -1  
$EndComp
$Comp
L lc_Cap:0603_100nF__104_10%_50V C15
U 1 1 609F20C7
P 6800 5950
F 0 "C15" H 7150 6197 50  0000 C CNN
F 1 "0603_100nF__104_10%_50V" H 6849 6180 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6799 5670 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 6799 5770 50  0001 L BNN
F 4 "贴片电容" H 6800 5950 50  0001 C CNN "description"
F 5 "供应商链接" H 6799 5570 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6799 5470 50  0001 L BNN "Package"
F 7 "LC" H 6799 5370 50  0001 L BNN "Supplier"
F 8 "C14663" H 6799 5270 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6799 5170 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" H 7150 6106 50  0000 C CNN "Comment"
	1    6800 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5850 7500 5850
Wire Wire Line
	7500 5950 7300 5950
Wire Wire Line
	7000 5950 6500 5950
Wire Wire Line
	6500 5950 6500 5900
Wire Wire Line
	6500 5850 6600 5850
Wire Wire Line
	6500 5900 6350 5900
Connection ~ 6500 5900
Wire Wire Line
	6500 5900 6500 5850
$Comp
L power:GND #PWR0108
U 1 1 60A0141F
P 6350 5900
F 0 "#PWR0108" H 6350 5650 50  0001 C CNN
F 1 "GND" V 6355 5772 50  0000 R CNN
F 2 "" H 6350 5900 50  0001 C CNN
F 3 "" H 6350 5900 50  0001 C CNN
	1    6350 5900
	0    1    1    0   
$EndComp
$Comp
L lc_CrystalOscillator:SMD-5032_2P_8MHz_20ppm_20pF Y1
U 1 1 60A0231E
P 6800 7150
F 0 "Y1" V 7296 7050 50  0000 R CNN
F 1 "SMD-5032_2P_8MHz_20ppm_20pF" H 6849 7370 50  0001 L BNN
F 2 "lc_lib:SMD-5032_2P" H 6799 6880 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_117214.html" H 6799 6980 50  0001 L BNN
F 4 "贴片晶振" H 6800 7150 50  0001 C CNN "description"
F 5 "供应商链接" H 6799 6780 50  0001 L BNN "ComponentLink1Description"
F 6 "SMD-5032_2P" H 6799 6680 50  0001 L BNN "Package"
F 7 "LC" H 6799 6580 50  0001 L BNN "Supplier"
F 8 "C115962" H 6799 6480 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6799 6380 50  0001 L BNN "Notepad"
F 10 "8MHz ±20ppm 20pF" H 7600 7300 50  0000 R CNN "Comment"
	1    6800 7150
	0    -1   -1   0   
$EndComp
$Comp
L lc_Cap:0603_20pF__200_5%_50V C8
U 1 1 60A097A2
P 6000 6400
F 0 "C8" H 6350 6647 50  0000 C CNN
F 1 "0603_20pF__200_5%_50V" H 6049 6630 50  0001 L BNN
F 2 "lc_lib:0603_C" H 5999 6120 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_2000.html" H 5999 6220 50  0001 L BNN
F 4 "贴片电容" H 6000 6400 50  0001 C CNN "description"
F 5 "供应商链接" H 5999 6020 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 5999 5920 50  0001 L BNN "Package"
F 7 "LC" H 5999 5820 50  0001 L BNN "Supplier"
F 8 "C1648" H 5999 5720 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 5999 5620 50  0001 L BNN "Notepad"
F 10 "20pF (200) 5% 50V" H 6350 6556 50  0000 C CNN "Comment"
	1    6000 6400
	1    0    0    -1  
$EndComp
$Comp
L lc_Cap:0603_20pF__200_5%_50V C9
U 1 1 60A0A48F
P 6000 7000
F 0 "C9" H 6350 7247 50  0000 C CNN
F 1 "0603_20pF__200_5%_50V" H 6049 7230 50  0001 L BNN
F 2 "lc_lib:0603_C" H 5999 6720 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_2000.html" H 5999 6820 50  0001 L BNN
F 4 "贴片电容" H 6000 7000 50  0001 C CNN "description"
F 5 "供应商链接" H 5999 6620 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 5999 6520 50  0001 L BNN "Package"
F 7 "LC" H 5999 6420 50  0001 L BNN "Supplier"
F 8 "C1648" H 5999 6320 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 5999 6220 50  0001 L BNN "Notepad"
F 10 "20pF (200) 5% 50V" H 6350 7156 50  0000 C CNN "Comment"
	1    6000 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6400 6800 6400
Wire Wire Line
	6800 6400 6800 6450
Wire Wire Line
	6500 7000 6800 7000
Wire Wire Line
	6800 7000 6800 6950
Wire Wire Line
	6200 6400 6150 6400
Wire Wire Line
	6150 6400 6150 6700
Wire Wire Line
	6150 7000 6200 7000
Wire Wire Line
	6800 7000 7100 7000
Wire Wire Line
	7100 7000 7100 6750
Connection ~ 6800 7000
Wire Wire Line
	6800 6400 7100 6400
Wire Wire Line
	7100 6400 7100 6650
Connection ~ 6800 6400
Wire Wire Line
	6150 6700 6000 6700
Connection ~ 6150 6700
Wire Wire Line
	6150 6700 6150 7000
$Comp
L power:GND #PWR0109
U 1 1 60A2664D
P 6000 6700
F 0 "#PWR0109" H 6000 6450 50  0001 C CNN
F 1 "GND" V 6005 6572 50  0000 R CNN
F 2 "" H 6000 6700 50  0001 C CNN
F 3 "" H 6000 6700 50  0001 C CNN
	1    6000 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 6750 7500 6750
Wire Wire Line
	7100 6650 7500 6650
$Comp
L MCU_ST_STM32F4:STM32F405RGTx U2
U 1 1 609C16CD
P 8200 7050
F 0 "U2" H 8200 5161 50  0000 C CNN
F 1 "STM32F405RGTx" H 8200 5070 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 7600 5350 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 8200 7050 50  0001 C CNN
	1    8200 7050
	1    0    0    -1  
$EndComp
$Comp
L lc_Cap:0603_1uF__105_10%_50V C14
U 1 1 60A36CE7
P 7250 8050
F 0 "C14" V 7500 8050 50  0000 L CNN
F 1 "0603_1uF__105_10%_50V" H 7299 8280 50  0001 L BNN
F 2 "lc_lib:0603_C" H 7249 7770 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_16531.html" H 7249 7870 50  0001 L BNN
F 4 "贴片电容" H 7250 8050 50  0001 C CNN "description"
F 5 "供应商链接" H 7249 7670 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 7249 7570 50  0001 L BNN "Package"
F 7 "LC" H 7249 7470 50  0001 L BNN "Supplier"
F 8 "C15849" H 7249 7370 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 7249 7270 50  0001 L BNN "Notepad"
F 10 "1uF (105) 10% 50V" V 7645 8160 50  0001 L CNN "Comment"
	1    7250 8050
	0    1    1    0   
$EndComp
$Comp
L lc_Cap:0603_100nF__104_10%_50V C13
U 1 1 60A3888D
P 7050 8050
F 0 "C13" V 7300 8050 50  0000 L CNN
F 1 "0603_100nF__104_10%_50V" H 7099 8280 50  0001 L BNN
F 2 "lc_lib:0603_C" H 7049 7770 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 7049 7870 50  0001 L BNN
F 4 "贴片电容" H 7050 8050 50  0001 C CNN "description"
F 5 "供应商链接" H 7049 7670 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 7049 7570 50  0001 L BNN "Package"
F 7 "LC" H 7049 7470 50  0001 L BNN "Supplier"
F 8 "C14663" H 7049 7370 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 7049 7270 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" V 7445 8160 50  0001 L CNN "Comment"
	1    7050 8050
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 8250 7050 8200
Wire Wire Line
	7050 8200 7250 8200
Wire Wire Line
	7250 8200 7250 8250
Wire Wire Line
	7050 8550 7050 8600
Wire Wire Line
	7050 8600 7250 8600
Wire Wire Line
	7250 8600 7250 8550
$Comp
L lc_Cap:0603_100nF__104_10%_50V C11
U 1 1 60A59626
P 6850 8050
F 0 "C11" V 7100 8050 50  0000 L CNN
F 1 "0603_100nF__104_10%_50V" H 6899 8280 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6849 7770 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 6849 7870 50  0001 L BNN
F 4 "贴片电容" H 6850 8050 50  0001 C CNN "description"
F 5 "供应商链接" H 6849 7670 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6849 7570 50  0001 L BNN "Package"
F 7 "LC" H 6849 7470 50  0001 L BNN "Supplier"
F 8 "C14663" H 6849 7370 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6849 7270 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" V 7245 8160 50  0001 L CNN "Comment"
	1    6850 8050
	0    1    1    0   
$EndComp
$Comp
L lc_Cap:0603_100nF__104_10%_50V C10
U 1 1 60A5A3D5
P 6650 8050
F 0 "C10" V 6900 8050 50  0000 L CNN
F 1 "0603_100nF__104_10%_50V" H 6699 8280 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6649 7770 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 6649 7870 50  0001 L BNN
F 4 "贴片电容" H 6650 8050 50  0001 C CNN "description"
F 5 "供应商链接" H 6649 7670 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6649 7570 50  0001 L BNN "Package"
F 7 "LC" H 6649 7470 50  0001 L BNN "Supplier"
F 8 "C14663" H 6649 7370 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6649 7270 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" V 7045 8160 50  0001 L CNN "Comment"
	1    6650 8050
	0    1    1    0   
$EndComp
$Comp
L lc_Cap:0603_100nF__104_10%_50V C7
U 1 1 60A5AA12
P 6450 8050
F 0 "C7" V 6700 8050 50  0000 L CNN
F 1 "0603_100nF__104_10%_50V" H 6499 8280 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6449 7770 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 6449 7870 50  0001 L BNN
F 4 "贴片电容" H 6450 8050 50  0001 C CNN "description"
F 5 "供应商链接" H 6449 7670 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6449 7570 50  0001 L BNN "Package"
F 7 "LC" H 6449 7470 50  0001 L BNN "Supplier"
F 8 "C14663" H 6449 7370 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6449 7270 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" V 6845 8160 50  0001 L CNN "Comment"
	1    6450 8050
	0    1    1    0   
$EndComp
$Comp
L lc_Cap:0603_100nF__104_10%_50V C6
U 1 1 60A5AF05
P 6250 8050
F 0 "C6" V 6500 8050 50  0000 L CNN
F 1 "0603_100nF__104_10%_50V" H 6299 8280 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6249 7770 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 6249 7870 50  0001 L BNN
F 4 "贴片电容" H 6250 8050 50  0001 C CNN "description"
F 5 "供应商链接" H 6249 7670 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6249 7570 50  0001 L BNN "Package"
F 7 "LC" H 6249 7470 50  0001 L BNN "Supplier"
F 8 "C14663" H 6249 7370 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6249 7270 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" V 6645 8160 50  0001 L CNN "Comment"
	1    6250 8050
	0    1    1    0   
$EndComp
$Comp
L lc_Cap:0603_100nF__104_10%_50V C5
U 1 1 60A5B4EA
P 6050 8050
F 0 "C5" V 6300 8050 50  0000 L CNN
F 1 "0603_100nF__104_10%_50V" H 6099 8280 50  0001 L BNN
F 2 "lc_lib:0603_C" H 6049 7770 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_15331.html" H 6049 7870 50  0001 L BNN
F 4 "贴片电容" H 6050 8050 50  0001 C CNN "description"
F 5 "供应商链接" H 6049 7670 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6049 7570 50  0001 L BNN "Package"
F 7 "LC" H 6049 7470 50  0001 L BNN "Supplier"
F 8 "C14663" H 6049 7370 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6049 7270 50  0001 L BNN "Notepad"
F 10 "100nF (104) 10% 50V" V 6445 8160 50  0001 L CNN "Comment"
	1    6050 8050
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 8250 6050 8200
Wire Wire Line
	6050 8200 6250 8200
Connection ~ 7050 8200
Wire Wire Line
	6850 8250 6850 8200
Connection ~ 6850 8200
Wire Wire Line
	6850 8200 7050 8200
Wire Wire Line
	6650 8250 6650 8200
Connection ~ 6650 8200
Wire Wire Line
	6650 8200 6850 8200
Wire Wire Line
	6450 8250 6450 8200
Connection ~ 6450 8200
Wire Wire Line
	6450 8200 6650 8200
Wire Wire Line
	6250 8250 6250 8200
Connection ~ 6250 8200
Wire Wire Line
	6250 8200 6450 8200
Wire Wire Line
	6050 8550 6050 8600
Wire Wire Line
	6050 8600 6250 8600
Connection ~ 7050 8600
Wire Wire Line
	6850 8550 6850 8600
Connection ~ 6850 8600
Wire Wire Line
	6850 8600 7050 8600
Wire Wire Line
	6650 8550 6650 8600
Connection ~ 6650 8600
Wire Wire Line
	6650 8600 6850 8600
Wire Wire Line
	6450 8550 6450 8600
Connection ~ 6450 8600
Wire Wire Line
	6450 8600 6650 8600
Wire Wire Line
	6250 8550 6250 8600
Connection ~ 6250 8600
Wire Wire Line
	6250 8600 6450 8600
Wire Wire Line
	6650 8600 6650 8700
$Comp
L power:GND #PWR0110
U 1 1 60AA435D
P 6650 8700
F 0 "#PWR0110" H 6650 8450 50  0001 C CNN
F 1 "GND" H 6655 8527 50  0000 C CNN
F 2 "" H 6650 8700 50  0001 C CNN
F 3 "" H 6650 8700 50  0001 C CNN
	1    6650 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 8200 6650 7950
Text Label 6650 7950 3    50   ~ 0
3v3_2
Wire Wire Line
	7500 5650 6950 5650
Wire Wire Line
	6950 5650 6950 5450
$Comp
L power:GND #PWR0111
U 1 1 60ABF1FD
P 6950 4850
F 0 "#PWR0111" H 6950 4600 50  0001 C CNN
F 1 "GND" H 6955 4677 50  0000 C CNN
F 2 "" H 6950 4850 50  0001 C CNN
F 3 "" H 6950 4850 50  0001 C CNN
	1    6950 4850
	-1   0    0    1   
$EndComp
$Comp
L lc_RES:0603_10KΩ__1002_1% R5
U 1 1 60AC7CC4
P 7450 5200
F 0 "R5" V 7404 5270 50  0000 L CNN
F 1 "0603_10KΩ__1002_1%" H 7300 5390 50  0001 L BNN
F 2 "lc_lib:0603_R" H 7250 4960 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_26547.html" H 7250 5060 50  0001 L BNN
F 4 "贴片电阻" H 7450 5200 50  0001 C CNN "description"
F 5 "供应商链接" H 7250 4860 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 7250 4760 50  0001 L BNN "Package"
F 7 "LC" H 7250 4660 50  0001 L BNN "Supplier"
F 8 "C25804" H 7250 4560 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 7250 4460 50  0001 L BNN "Notepad"
F 10 "10KΩ (1002) ±1%" H 7100 5100 50  0000 L CNN "Comment"
	1    7450 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 4850 6950 4950
$Comp
L lc_RES:0603_10KΩ__1002_1% R3
U 1 1 60AD0713
P 6950 5250
F 0 "R3" V 6904 5320 50  0000 L CNN
F 1 "0603_10KΩ__1002_1%" H 6800 5440 50  0001 L BNN
F 2 "lc_lib:0603_R" H 6750 5010 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_26547.html" H 6750 5110 50  0001 L BNN
F 4 "贴片电阻" H 6950 5250 50  0001 C CNN "description"
F 5 "供应商链接" H 6750 4910 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 6750 4810 50  0001 L BNN "Package"
F 7 "LC" H 6750 4710 50  0001 L BNN "Supplier"
F 8 "C25804" H 6750 4610 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 6750 4510 50  0001 L BNN "Notepad"
F 10 "10KΩ (1002) ±1%" H 6600 5150 50  0000 L CNN "Comment"
	1    6950 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 5450 7450 5450
Wire Wire Line
	7450 4750 7450 5000
Text Label 7450 4750 3    50   ~ 0
3v3_2
Wire Wire Line
	7450 5450 7450 5400
Connection ~ 7450 5450
$Comp
L lc_RES:0402_1.2KΩ__1201_1% R4
U 1 1 60B0AC04
P 7200 5200
F 0 "R4" V 7154 5270 50  0000 L CNN
F 1 "0402_1.2KΩ__1201_1%" H 7050 5390 50  0001 L BNN
F 2 "lc_lib:0402_R" H 7000 4960 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_26605.html" H 7000 5060 50  0001 L BNN
F 4 "贴片电阻" H 7200 5200 50  0001 C CNN "description"
F 5 "供应商链接" H 7000 4860 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 7000 4760 50  0001 L BNN "Package"
F 7 "LC" H 7000 4660 50  0001 L BNN "Supplier"
F 8 "C25862" H 7000 4560 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 7000 4460 50  0001 L BNN "Notepad"
F 10 "free" H 7150 5200 50  0000 L CNN "Comment"
	1    7200 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 5450 7200 5400
Wire Wire Line
	7200 5450 7450 5450
Wire Wire Line
	7200 5000 7200 4950
Wire Wire Line
	7200 4950 6950 4950
Connection ~ 6950 4950
Wire Wire Line
	6950 4950 6950 5050
Text Label 13650 3200 3    50   ~ 0
ADC_in
$Comp
L lc_RES:0402_0Ω__0R0_1% R6
U 1 1 60993C84
P 9450 5450
F 0 "R6" H 9450 5450 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 5640 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 5210 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 5310 50  0001 L BNN
F 4 "贴片电阻" H 9450 5450 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5110 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5010 50  0001 L BNN "Package"
F 7 "LC" H 9250 4910 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 4810 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 4710 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 5566 50  0001 C CNN "Comment"
	1    9450 5450
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R7
U 1 1 6099628F
P 9450 5550
F 0 "R7" H 9450 5550 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 5740 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 5310 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 5410 50  0001 L BNN
F 4 "贴片电阻" H 9450 5550 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5210 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5110 50  0001 L BNN "Package"
F 7 "LC" H 9250 5010 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 4910 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 4810 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 5666 50  0001 C CNN "Comment"
	1    9450 5550
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R8
U 1 1 60996824
P 9450 5650
F 0 "R8" H 9450 5650 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 5840 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 5410 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 5510 50  0001 L BNN
F 4 "贴片电阻" H 9450 5650 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5310 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5210 50  0001 L BNN "Package"
F 7 "LC" H 9250 5110 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5010 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 4910 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 5766 50  0001 C CNN "Comment"
	1    9450 5650
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R9
U 1 1 60996C15
P 9450 5750
F 0 "R9" H 9450 5750 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 5940 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 5510 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 5610 50  0001 L BNN
F 4 "贴片电阻" H 9450 5750 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5410 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5310 50  0001 L BNN "Package"
F 7 "LC" H 9250 5210 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5110 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 5010 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 5866 50  0001 C CNN "Comment"
	1    9450 5750
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R10
U 1 1 6099711E
P 9450 5850
F 0 "R10" H 9450 5850 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 6040 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 5610 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 5710 50  0001 L BNN
F 4 "贴片电阻" H 9450 5850 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5510 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5410 50  0001 L BNN "Package"
F 7 "LC" H 9250 5310 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5210 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 5110 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 5966 50  0001 C CNN "Comment"
	1    9450 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5450 8900 5450
Wire Wire Line
	8900 5550 9250 5550
Wire Wire Line
	9250 5650 8900 5650
Wire Wire Line
	8900 5750 9250 5750
Wire Wire Line
	9250 5850 8900 5850
Wire Wire Line
	9650 5450 9800 5450
Wire Wire Line
	9800 5450 9800 5550
Wire Wire Line
	9800 5550 9650 5550
Wire Wire Line
	9650 5650 9800 5650
Wire Wire Line
	9800 5650 9800 5550
Connection ~ 9800 5550
Wire Wire Line
	9650 5750 9800 5750
Wire Wire Line
	9800 5750 9800 5650
Connection ~ 9800 5650
Wire Wire Line
	9650 5850 9800 5850
Wire Wire Line
	9800 5850 9800 5750
Connection ~ 9800 5750
Wire Wire Line
	9800 5650 10250 5650
Text Label 10250 5650 2    50   ~ 0
ADC_in
$Comp
L lc_RES:0402_0Ω__0R0_1% R21
U 1 1 609F4502
P 9450 8150
F 0 "R21" H 9450 8150 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 8340 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 7910 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 8010 50  0001 L BNN
F 4 "贴片电阻" H 9450 8150 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 7810 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 7710 50  0001 L BNN "Package"
F 7 "LC" H 9250 7610 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 7510 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 7410 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 8266 50  0001 C CNN "Comment"
	1    9450 8150
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R22
U 1 1 609F73EB
P 9450 8250
F 0 "R22" H 9450 8250 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 8440 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 8010 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 8110 50  0001 L BNN
F 4 "贴片电阻" H 9450 8250 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 7910 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 7810 50  0001 L BNN "Package"
F 7 "LC" H 9250 7710 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 7610 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 7510 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 8366 50  0001 C CNN "Comment"
	1    9450 8250
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R20
U 1 1 609F7710
P 9450 7450
F 0 "R20" H 9450 7450 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 7640 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 7210 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 7310 50  0001 L BNN
F 4 "贴片电阻" H 9450 7450 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 7110 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 7010 50  0001 L BNN "Package"
F 7 "LC" H 9250 6910 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 6810 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 6710 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 7566 50  0001 C CNN "Comment"
	1    9450 7450
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R17
U 1 1 609F95D9
P 9450 6950
F 0 "R17" H 9450 6950 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 7140 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 6710 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 6810 50  0001 L BNN
F 4 "贴片电阻" H 9450 6950 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 6610 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 6510 50  0001 L BNN "Package"
F 7 "LC" H 9250 6410 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 6310 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 6210 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 7066 50  0001 C CNN "Comment"
	1    9450 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 6950 8900 6950
Wire Wire Line
	8900 7450 9250 7450
Wire Wire Line
	9250 8150 8900 8150
Wire Wire Line
	8900 8250 9250 8250
Wire Wire Line
	9650 6950 9800 6950
Wire Wire Line
	9800 6950 9800 7450
Wire Wire Line
	9800 7450 9650 7450
Wire Wire Line
	9650 8250 9800 8250
Wire Wire Line
	9800 8250 9800 8150
Connection ~ 9800 7450
Wire Wire Line
	9650 8150 9800 8150
Connection ~ 9800 8150
Wire Wire Line
	9800 8150 9800 7450
Wire Wire Line
	13650 4600 13650 4700
Wire Wire Line
	10300 4600 10650 4600
Text Label 10650 4600 2    50   ~ 0
M
Text Label 10100 7450 2    50   ~ 0
M
Wire Wire Line
	9800 7450 10100 7450
$Comp
L lc_RES:0402_0Ω__0R0_1% R13
U 1 1 60A727D4
P 9450 6250
F 0 "R13" H 9450 6250 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 6440 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 6010 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 6110 50  0001 L BNN
F 4 "贴片电阻" H 9450 6250 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5910 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5810 50  0001 L BNN "Package"
F 7 "LC" H 9250 5710 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5610 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 5510 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 6366 50  0001 C CNN "Comment"
	1    9450 6250
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R14
U 1 1 60A741DD
P 9450 6350
F 0 "R14" H 9450 6350 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 6540 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 6110 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 6210 50  0001 L BNN
F 4 "贴片电阻" H 9450 6350 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 6010 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5910 50  0001 L BNN "Package"
F 7 "LC" H 9250 5810 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5710 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 5610 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 6466 50  0001 C CNN "Comment"
	1    9450 6350
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R15
U 1 1 60A748C2
P 9450 6450
F 0 "R15" H 9450 6450 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 6640 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 6210 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 6310 50  0001 L BNN
F 4 "贴片电阻" H 9450 6450 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 6110 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 6010 50  0001 L BNN "Package"
F 7 "LC" H 9250 5910 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5810 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 5710 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 6566 50  0001 C CNN "Comment"
	1    9450 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 6250 8900 6250
Wire Wire Line
	8900 6350 9250 6350
Wire Wire Line
	9250 6450 8900 6450
Wire Wire Line
	9650 6250 9800 6250
Wire Wire Line
	9800 6250 9800 6350
Wire Wire Line
	9800 6350 9650 6350
Wire Wire Line
	9650 6450 9800 6450
Wire Wire Line
	9800 6450 9800 6350
Connection ~ 9800 6350
Connection ~ 9800 6450
Wire Wire Line
	9700 4400 9250 4400
Text Label 9250 4400 0    50   ~ 0
ICG
Wire Wire Line
	9800 6450 10250 6450
Text Label 10250 6450 2    50   ~ 0
ICG
Wire Wire Line
	9700 4600 9250 4600
Text Label 9250 4600 0    50   ~ 0
SH
$Comp
L lc_RES:0402_0Ω__0R0_1% R11
U 1 1 60AEE01F
P 9450 6050
F 0 "R11" H 9450 6050 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 6240 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 5810 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 5910 50  0001 L BNN
F 4 "贴片电阻" H 9450 6050 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5710 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5610 50  0001 L BNN "Package"
F 7 "LC" H 9250 5510 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5410 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 5310 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 6166 50  0001 C CNN "Comment"
	1    9450 6050
	1    0    0    1   
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R12
U 1 1 60AF1310
P 9450 6150
F 0 "R12" H 9450 6150 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 6340 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 5910 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 6010 50  0001 L BNN
F 4 "贴片电阻" H 9450 6150 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 5810 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 5710 50  0001 L BNN "Package"
F 7 "LC" H 9250 5610 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 5510 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 5410 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 6266 50  0001 C CNN "Comment"
	1    9450 6150
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R18
U 1 1 60AF1721
P 9450 7150
F 0 "R18" H 9450 7150 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 7340 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 6910 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 7010 50  0001 L BNN
F 4 "贴片电阻" H 9450 7150 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 6810 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 6710 50  0001 L BNN "Package"
F 7 "LC" H 9250 6610 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 6510 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 6410 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 7266 50  0001 C CNN "Comment"
	1    9450 7150
	1    0    0    -1  
$EndComp
$Comp
L lc_RES:0402_0Ω__0R0_1% R19
U 1 1 60AF2CAE
P 9450 7250
F 0 "R19" H 9450 7250 50  0000 C CNN
F 1 "0402_0Ω__0R0_1%" H 9300 7440 50  0001 L BNN
F 2 "lc_lib:0402_R" H 9250 7010 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_17853.html" H 9250 7110 50  0001 L BNN
F 4 "贴片电阻" H 9450 7250 50  0001 C CNN "description"
F 5 "供应商链接" H 9250 6910 50  0001 L BNN "ComponentLink1Description"
F 6 "0402" H 9250 6810 50  0001 L BNN "Package"
F 7 "LC" H 9250 6710 50  0001 L BNN "Supplier"
F 8 "C17168" H 9250 6610 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 9250 6510 50  0001 L BNN "Notepad"
F 10 "0Ω (0R0) ±1%" H 9450 7366 50  0001 C CNN "Comment"
	1    9450 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 6050 8900 6050
Wire Wire Line
	8900 6150 9250 6150
Wire Wire Line
	9250 7150 8900 7150
Wire Wire Line
	9250 7250 8900 7250
Wire Wire Line
	9650 6050 9700 6050
Wire Wire Line
	9700 6050 9700 6150
Wire Wire Line
	9700 6150 9650 6150
Wire Wire Line
	9650 7150 9700 7150
Wire Wire Line
	9700 7150 9700 7250
Wire Wire Line
	9700 7250 9650 7250
Wire Wire Line
	9700 7150 9700 6150
Connection ~ 9700 7150
Connection ~ 9700 6150
Wire Wire Line
	9700 6150 10250 6150
Text Label 10250 6150 2    50   ~ 0
SH
$Comp
L ricardo:type-c-31-m-12 U3
U 1 1 60B72E52
P 12300 7350
F 0 "U3" H 12400 6777 50  0000 C CNN
F 1 "type-c-31-m-12" H 12400 6686 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 12250 7800 50  0001 C CNN
F 3 "" H 12250 7800 50  0001 C CNN
	1    12300 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	11850 7000 11700 7000
Wire Wire Line
	11700 7000 11700 7800
Wire Wire Line
	11700 7800 11850 7800
Wire Wire Line
	12950 7800 13100 7800
Wire Wire Line
	13100 7000 12950 7000
Wire Wire Line
	11700 7000 11700 6800
Wire Wire Line
	11700 6800 12400 6800
Wire Wire Line
	13100 6800 13100 7000
Connection ~ 11700 7000
Connection ~ 13100 7000
Wire Wire Line
	12400 6850 12400 6800
Connection ~ 12400 6800
Wire Wire Line
	12400 6800 13100 6800
Wire Wire Line
	12400 6800 12400 6650
$Comp
L power:GND #PWR0112
U 1 1 60C2491C
P 12400 6650
F 0 "#PWR0112" H 12400 6400 50  0001 C CNN
F 1 "GND" H 12405 6477 50  0000 C CNN
F 2 "" H 12400 6650 50  0001 C CNN
F 3 "" H 12400 6650 50  0001 C CNN
	1    12400 6650
	-1   0    0    1   
$EndComp
Wire Wire Line
	11850 7150 11650 7150
Wire Wire Line
	11650 7150 11650 7650
Wire Wire Line
	11650 7650 11850 7650
Wire Wire Line
	12950 7150 13150 7150
Wire Wire Line
	13150 7150 13150 7650
Wire Wire Line
	12950 7650 13150 7650
Wire Wire Line
	13100 7000 13100 7800
Wire Wire Line
	11650 7650 11650 7950
Wire Wire Line
	11650 7950 12400 7950
Wire Wire Line
	13150 7950 13150 7650
Connection ~ 11650 7650
Connection ~ 13150 7650
Wire Wire Line
	12400 7950 12400 8150
Connection ~ 12400 7950
Wire Wire Line
	12400 7950 13150 7950
$Comp
L power:VCC #PWR0113
U 1 1 60C7C050
P 12400 8150
F 0 "#PWR0113" H 12400 8000 50  0001 C CNN
F 1 "VCC" H 12415 8323 50  0000 C CNN
F 2 "" H 12400 8150 50  0001 C CNN
F 3 "" H 12400 8150 50  0001 C CNN
	1    12400 8150
	-1   0    0    1   
$EndComp
Wire Wire Line
	11850 7350 11600 7350
Wire Wire Line
	11600 7350 11600 8400
Wire Wire Line
	11600 8400 12600 8400
Wire Wire Line
	13200 8400 13200 7450
Wire Wire Line
	13200 7450 12950 7450
Wire Wire Line
	11850 7450 11550 7450
Wire Wire Line
	11550 7450 11550 8450
Wire Wire Line
	11550 8450 12000 8450
Wire Wire Line
	13250 8450 13250 7350
Wire Wire Line
	13250 7350 12950 7350
Wire Wire Line
	12000 8450 12000 8650
Connection ~ 12000 8450
Wire Wire Line
	12000 8450 13250 8450
Wire Wire Line
	12600 8400 12600 8650
Connection ~ 12600 8400
Wire Wire Line
	12600 8400 13200 8400
Wire Wire Line
	12950 7550 13450 7550
Wire Wire Line
	11850 7250 11300 7250
$Comp
L lc_RES:0603_5.1KΩ__5101_1% R24
U 1 1 60CF6EBD
P 13650 7550
F 0 "R24" H 13650 7757 50  0000 C CNN
F 1 "0603_5.1KΩ__5101_1%" H 13500 7740 50  0001 L BNN
F 2 "lc_lib:0603_R" H 13450 7310 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_23913.html" H 13450 7410 50  0001 L BNN
F 4 "贴片电阻" H 13650 7550 50  0001 C CNN "description"
F 5 "供应商链接" H 13450 7210 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 13450 7110 50  0001 L BNN "Package"
F 7 "LC" H 13450 7010 50  0001 L BNN "Supplier"
F 8 "C23186" H 13450 6910 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 13450 6810 50  0001 L BNN "Notepad"
F 10 "5.1KΩ (5101) ±1%" H 13650 7666 50  0000 C CNN "Comment"
	1    13650 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 60D16EFF
P 13950 7550
F 0 "#PWR0114" H 13950 7300 50  0001 C CNN
F 1 "GND" V 13955 7422 50  0000 R CNN
F 2 "" H 13950 7550 50  0001 C CNN
F 3 "" H 13950 7550 50  0001 C CNN
	1    13950 7550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	13850 7550 13950 7550
$Comp
L lc_RES:0603_5.1KΩ__5101_1% R16
U 1 1 60D2C887
P 11100 7250
F 0 "R16" H 11100 7457 50  0000 C CNN
F 1 "0603_5.1KΩ__5101_1%" H 10950 7440 50  0001 L BNN
F 2 "lc_lib:0603_R" H 10900 7010 50  0001 L BNN
F 3 "http://www.szlcsc.com/product/details_23913.html" H 10900 7110 50  0001 L BNN
F 4 "贴片电阻" H 11100 7250 50  0001 C CNN "description"
F 5 "供应商链接" H 10900 6910 50  0001 L BNN "ComponentLink1Description"
F 6 "0603" H 10900 6810 50  0001 L BNN "Package"
F 7 "LC" H 10900 6710 50  0001 L BNN "Supplier"
F 8 "C23186" H 10900 6610 50  0001 L BNN "SuppliersPartNumber"
F 9 "" H 10900 6510 50  0001 L BNN "Notepad"
F 10 "5.1KΩ (5101) ±1%" H 11100 7366 50  0000 C CNN "Comment"
	1    11100 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 60D2D5F5
P 10800 7250
F 0 "#PWR0115" H 10800 7000 50  0001 C CNN
F 1 "GND" V 10805 7122 50  0000 R CNN
F 2 "" H 10800 7250 50  0001 C CNN
F 3 "" H 10800 7250 50  0001 C CNN
	1    10800 7250
	0    1    1    0   
$EndComp
Wire Wire Line
	10900 7250 10800 7250
Text Label 12600 8650 2    50   ~ 0
DP
Text Label 12000 8650 2    50   ~ 0
DM
Wire Wire Line
	8900 6650 9350 6650
Text Label 9350 6650 2    50   ~ 0
DP
Wire Wire Line
	8900 6550 9350 6550
Text Label 9350 6550 2    50   ~ 0
DM
$Comp
L ricardo:2SA1015_SMD U4
U 1 1 60D99307
P 13600 4400
F 0 "U4" H 13741 4354 50  0000 L CNN
F 1 "2SA1015_SMD" H 13741 4445 50  0000 L CNN
F 2 "lc_lib:SOT-23(SOT-23-3)" H 13950 5100 50  0001 C CNN
F 3 "" H 13950 5100 50  0001 C CNN
	1    13600 4400
	1    0    0    1   
$EndComp
$EndSCHEMATC
