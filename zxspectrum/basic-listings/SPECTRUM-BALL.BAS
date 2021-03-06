10 REM AMIGA BALL ON ZX SPECTRUM - HAPPY COMPUTER 86/08
20 GO TO 8000
50 LET H=COS W*SIN (K*P): LET Y=SIN W
60 LET X=H*CW-Y*SW : LET Y=H*SW+Y*CW
70 LET X=N+XD+M+M*X-PEEK 23677 : LET Y=YD-M+M*Y-PEEK 23678
80 RETURN

100 FOR N=0 TO 7
110 LET V=N/4 : GO SUB 700
120 FOR K=-3.6 TO 3.6 STEP .05
130 FOR F=-4 TO 3
140 LET U=INT (K+V) + F
150 IF U=2*INT (U/2) THEN LET W=F*P : PLOT 0,0 : GO SUB 50 : PLOT X,Y : LET W=W+P : GO SUB 50 : DRAW X,Y : DRAW -X,-Y

160 NEXT F : NEXT K
170 POKE VARIABLEN,N : RANDOMIZE USR SPEICHERN : NEXT N

190 BEEP 2,9 :  SAVE "NAME" CODE 47104, 16700
200 RANDOMIZE USR HAUPT:  STOP
700 RANDOMIZE USR SCREEN
710 LET XD=20 : LET YD=156
720 GO SUB 800: INVERSE 1
730 LET XD=2 : LET YD=156
740 GO SUB 800 : INVERSE 0
750 RETURN
800 FOR R=-M TO M
810 LET KR=SQR (M*M-R*R)
820 PLOT XD+M+N+R,YD-M+KR
830 DRAW 0,-2*KR : NEXT R
840 RETURN
8000 CLEAR 47100 : LET M=50 : LET P=-PI/20 : LET SW=SIN P : LET CW=COS P: LET P=PI/8
8010 FOR R=-1 TO 1 STEP 2/60
8020 POKE 63774+R*30,63*R*R
8030 NEXT R
8100 LET ZEILENRECHNUNG=63488
8110 DATA 95,230,7,87,123,31,31,31,230,24,246,64,178,87,123,23,23,230,224,95,201
8120 LET VARIABLEN=63509
8130 DATA 0,12,8,5,65,50,70,114
8140 REM ADDR. DES BILDES
8150 DATA 58,21,248,7,7,7,198,184,103,46,0,201
8160 LET SPEICHERN=63529
8170 DATA 205,29,248,6,128,197,120,61,205,0,248,235,1,16,0,237,176,235,193,16,240,201
8180 LET HOLEN=63551
8190 DATA 205,29,248,6,127,197,58,23,248,128,61,205,0,248,58,22,248,131,95,1,16,0,237,176,193,16,234,201
8200 LET SCREEN=63579
8210 DATA 17,1,64,33,0,64,54,128,1,255,23,237,176,201
8220 LET PLOTHOL=63593
8230 DATA 58,125,92,245,230,7,50,21,248,241,203,63,203,63,203,63,50,22,248,58,126,92,50,23,248,195,63,248
8240 LET HAUPT=63621
8250 DATA 205,91,248,175,50,24,248,50,125,92,50,25,248,38,249,58,25,248,111,126,50,126,92,58,125,92,254,0,40,3,205,105,248,58,25,248,60,254
8260 DATA 60,32,1,175,50,25,248,58,125,92,95,58,24,248,254,0,40,2,29,29,28,123,230,127,50,125,92,32,7,58,24,248,47,50,24,248,58,8,92,254,32,200,33,26,248,254
8270 DATA 54,32,2,52,52,254,55,32,2,53,53,203,190,175,50,8,92,126,70,16,254,61,32,250,24,159
8500 RESTORE : LET SUM=26230
8510 FOR R=63488 TO 63730
8520 READ A : POKE R,A
8530 LET SUM=SUM-A : NEXT R
8540 IF NOT SUM THEN GO TO 100
8550 PRINT "DATA FEHLER!"