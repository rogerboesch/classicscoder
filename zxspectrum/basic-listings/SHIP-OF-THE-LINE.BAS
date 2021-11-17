
  10 REM Ship of the Line - 1982
  20 REM Richard Shepherd Softw.
  30 REM

  50 POKE 23609,100
  55 BORDER 5: PAPER 1: INK 7
  75 LET m=100: LET v=0
  85 LET wa=30: LET am=10: LET ra=10
  99 GO SUB 2000

 100 REM Game loop
 101 LET wa=wa-1
 102 IF wa<0 THEN GO TO 1500
 103 GO SUB 2090
 105 LET a=INT (RND*20)+1
 110 LET gun=a*10
 115 LET r=INT gun/5
 120 LET s=INT a/4
 130 IF s=0 THEN LET s=1
 132 GO TO 3000
 
 150 PRINT "You engage a fleet of "; INT s;" ships"
 155 PRINT "Total power of ";gun;" guns"
 160 PRINT "You have ";: FLASH 1: PRINT m;: FLASH 0: PRINT " men and ";: FLASH 1: PRINT am;: FLASH 0: PRINT " tons"
 161 PRINT "of ammunition": FLASH 1
 168 PRINT "What are your orders,";r$;"?": FLASH 0
 169 GO SUB 9000: GO SUB 8000
 170 INPUT a$
 172 IF a$="run" THEN GO TO 3700
 174 IF a$="save" THEN SAVE "ship"CODE 23552,10000: CLS : GO TO 150
 176 GO SUB 8200: GO SUB 9700: GO TO 1000

 180 REM The battle continues
 185 CLS 
 190 PRINT "     ";: INVERSE 1: PRINT "The battle continues": INVERSE 0
 195 PAUSE 50: GO TO 160
 
 200 REM Engage in battle
 210 IF INT s>1 THEN GO TO 150
 220 PRINT "You engage a ship of ";gun;" guns"
 230 GO TO 160
 
 500 REM The enemy surrenders
 501 CLS : FLASH 1
 504 PRINT "The enemy surrenders"
 505 PRINT "Press any key to continue": GO SUB 9600
 506 PAUSE 0: CLS : FLASH 0
 510 LET v=v+s
 520 GO TO 101
 
1000 LET r=r-INT (RND*ra)
1010 IF r<=0 THEN GO TO 500
1015 LET m=m-INT (RND*m/10)
1016 IF m<=ra*2 THEN GO TO 1100
1017 LET am=am-(INT (RND*ra))/10
1018 LET am=INT (am*10): LET am=am/10
1019 IF am<=0 THEN GO TO 1200
1020 GO TO 180

1100 CLS : FLASH 1
1105 PRINT "You have insufficient men to    continue"
1106 GO TO 1210

1200 CLS : FLASH 1
1202 PRINT "You have run out of ammunition"
1205 PRINT "You are forced to surrender"

1210 PRINT "Press any key for another game"
1225 PAUSE 0: FLASH 0
1230 CLS : RUN

1500 REM No food: game lost
1501 CLS : FLASH 1
1510 PRINT "You have run out of food and    water"
1520 PRINT "Your crew mutiny and you are    murdered"
1530 PRINT AT 21,0;"Press any key for another game"
1542 PAUSE 0: FLASH 0
1550 CLS : RUN

2000 IF ra=10 THEN LET r$="Lieutenant": LET m=100
2010 IF ra=10 THEN LET s$="a frigate"
2020 IF ra=20 THEN LET r$="Captain"
2030 IF ra=20 THEN LET s$="a ship of the line"
2035 IF ra=20 THEN LET m=200
2040 IF ra=30 THEN LET r$="Commodore"
2050 IF ra=30 THEN LET s$="a small fleet of ships"
2055 IF ra=30 THEN LET m=400
2057 IF ra=40 THEN LET r$="Admiral"
2060 IF ra=40 THEN LET s$="The Mediterranean Fleet"
2080 IF ra=40 THEN LET m=800
2085 RETURN 

2090 REM Summary
2095 CLS 
2100 PRINT AT 2,2;"You hold the rank of"
2105 PRINT TAB 2;r$;" in the Navy."
2106 PRINT TAB 2;"You are in command of"
2107 PRINT TAB 2;s$
2108 PRINT TAB 2;"with a crew of ";: FLASH 1: PRINT m: FLASH 0
2109 PRINT TAB 2;"You have food and water for"
2110 PRINT TAB 2;"";: FLASH 1: PRINT wa;: FLASH 0: PRINT " days"
2111 PRINT TAB 2;"You have ";: FLASH 1: PRINT am;: FLASH 0: PRINT " tons of"
2112 PRINT TAB 2;"ammunition"
2113 GO SUB 8000
2114 FLASH 1
2115 PRINT AT 21,2;"Press any key to continue"
2117 PAUSE 0: FLASH 0: CLS 
2119 IF RND>.5 THEN GO SUB 6000
2220 RETURN 

3000 CLS 
3005 IF INT (RND*10)>5 THEN GO TO 3100
3010 IF INT s>1 THEN GO TO 3050
3020 PRINT "The lookout reports a ship in   sight"
3030 GO TO 3055
3050 PRINT "The lookout reports several     ships in sight"
3055 FLASH 1: PRINT "What are your orders,";r$;"?": FLASH 0
3056 GO SUB 9000
3060 INPUT a$
3070 CLS 
3080 IF a$="fight" OR a$="engage" OR a$="attack" THEN GO TO 200
3090 GO TO 3500

3100 PRINT "The lookout reports no ships in sight"
3103 FLASH 1: LET s=0
3105 PRINT "What are your orders,";r$;"?"
3106 FLASH 0: GO SUB 9000
3107 INPUT a$
3110 IF a$="port" THEN GO TO 5000
3111 IF INT (RND*10)>5 THEN GO SUB 6000
3115 GO TO 100

3500 IF INT (RND*ra)>ra/2 THEN GO TO 3700
3510 PRINT "Fortunately,the enemy has not   seen you"
3512 FLASH 1
3515 PRINT "Press any key to continue"
3517 PAUSE 0: FLASH 0: CLS 
3520 GO TO 100

3700 CLS 
3702 PRINT "The enemy is pursuing you"
3705 FLASH 1
3710 PRINT "What are your orders,";r$;"?"
3715 INPUT a$
3716 FLASH 0
3721 LET wa=wa-1
3725 IF a$="fight" OR a$="attack" OR a$="engage" THEN GO TO 135
3730 IF INT (RND*ra)>ra/2 THEN GO TO 3800
3731 LET wa=wa-1
3732 CLS 
3735 PRINT "The enemy still pursues you"
3736 IF INT (RND*ra)>ra/2 THEN GO TO 3750
3740 FLASH 1: GO TO 3710
3750 PRINT "The enemy has caught you"
3760 GO TO 200

3800 PRINT "The enemy has lost you"
3801 FLASH 1
3805 PRINT "Press any key to continue"
3810 PAUSE 0: FLASH 0: GO TO 100

5000 CLS 
5010 PRINT "You have decided to return to   port"
5020 GO SUB 6000
5030 IF INT (RND*10)>5 THEN GO TO 105
5035 CLS 
5040 PRINT "You have reached port"
5050 PRINT "All stores and crew will be     replenished"
5060 IF ra/2<v AND wa<20 THEN GO TO 5500
5070 GO TO 5530

5500 LET ra=ra+10
5510 IF ra=50 THEN GO TO 5700
5517 PAPER 2: FLASH 1
5520 PRINT "You have won promotion"
5523 FLASH 0: PAPER 1: INK 7
5524 GO SUB 9600
5530 GO SUB 2000: LET wa=30
5540 LET am=ra
5550 PRINT "You are ordered to return to seaimmediately, ";r$
5555 FLASH 1
5560 PRINT "Press any key to continue"
5580 PAUSE 0: FLASH 0: CLS 
5590 GO TO 100

5700 GO SUB 8700
5702 FLASH 1
5703 PAPER 7: INK 0
5710 PRINT AT 10,0;"Congratulations,First Sea Lord."
5715 PRINT "You have won the game"
5717 FLASH 0: GO SUB 9600
5720 PRINT AT 21,0;"Press any key for another game"
5740 PAUSE 0: CLS : RUN 
6000 LET b=INT (RND*9)+1
6010 GO TO 6000+b*100


6100 LET x=INT (RND*10)+1
6105 PRINT "Your ship is becalmed for": PRINT x;" days"
6110 LET wa=wa-x
6114 IF wa<=0 THEN PAUSE 100: GO TO 1500
6120 GO TO 7000

6200 LET x=INT (RND*10)+1
6210 PRINT "Your ship is caught in thick fogfor ";x;" days"
6220 LET wa=wa-x
6224 IF wa<=0 THEN PAUSE 100: GO TO 1500
6230 GO TO 7000

6300 LET x=INT (m/10)+1
6310 PRINT "A mutiny breaks out and you     lose ";x;" men"
6315 LET m=m-x
6316 IF m<=ra*2 THEN PAUSE 100: GO TO 1100
6320 GO TO 7000

6400 LET x=INT (m/10)+1
6415 PRINT "An attack of yellow fever breaksout and you lose ";x;" men"
6420 LET m=m-x
6422 IF m<=ra*2 THEN PAUSE 100: GO TO 1100
6430 GO TO 7000

6500 LET x=INT (am/10): IF x=0 THEN GO TO 6000
6510 PRINT "Part of your powder is found to be wet.You lose ";x;" tons of": PRINT "ammunition"
6520 LET am=am-x
6522 IF am<=0 THEN PAUSE 100: GO TO 1200
6530 GO TO 7000

6600 LET x=INT (RND*10)+1
6610 PRINT "Your ship requires running      repairs.This costs you ";x;" days"
6620 LET wa=wa-x
6622 IF wa<=0 THEN PAUSE 100: GO TO 1500
6630 GO TO 7000

6700 LET x=INT (wa/10)+1
6710 PRINT "You find that part of your wateris unfit for human consumption. This wastes ";x;" days of water."
6715 LET wa=wa-x
6716 IF wa<=0 THEN PAUSE 100: GO TO 1500
6720 GO TO 7000

6800 LET x=INT (m/10)+1
6810 PRINT "Your crew are affected by       sunstroke.You lose ";x;" men"
6815 LET m=m-x
6816 IF m<=ra*2 THEN PAUSE 100: GO TO 1100
6820 GO TO 7000

6900 LET x=INT (am/10): IF x=0 THEN GO TO 6000
6910 PRINT "In a practice shoot,you lose": PRINT x;" tons of ammunition"
6920 LET am=am-x
6921 IF am<=0 THEN PAUSE 100: GO TO 1200
6930 GO TO 7000


7000 FLASH 1
7005 PRINT "Press any key to continue"
7006 BEEP .5,5: BEEP .75,1
7020 PAUSE 0: FLASH 0: CLS 
7030 RETURN 


8000 REM Draw ship
8009 INK 0
8010 PRINT AT 19,10;" ";CHR$ 135;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 139
8015 INK 6
8020 PRINT AT 18,10;CHR$ 135;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 139
8025 OVER 1
8030 PRINT AT 18,10;"   ooooo"
8031 OVER 0
8035 INK 0
8040 PRINT AT 17,10;"____________"
8050 PRINT AT 17,10;"       ";CHR$ 135;CHR$ 143;CHR$ 143;CHR$ 143;CHR$ 143
8060 INK 0: PLOT 80,32
8070 DRAW -15,8
8080 PLOT 100,32
8090 DRAW 0,40
8100 PLOT 130,32
8110 DRAW 0,40
8130 INK 7: RETURN 


8200 REM Ship guns firing
8207 INK 6
8208 OVER 1
8209 PAPER 2
8210 PRINT AT 18,13;"*****"
8215 OVER 0
8220 BEEP .5,0: PAUSE 5: BEEP .5,0
8250 PAPER 1: INK 7
8260 PAUSE 50: RETURN 
8700 CLS 
8705 FOR n=0 TO 703
8710 LET a=INT (RND*6)+1
8720 PAPER a
8730 PRINT " ";
8740 NEXT n
8750 RETURN 


9000 REM Draw sea
9004 INK 5
9005 PLOT 0,72: DRAW 255,0,-.1
9020 FOR n=1 TO 20
9030 LET aa=INT (RND*200)
9040 LET bb=INT (RND*70)
9050 LET cc=INT (RND*50)
9055 PLOT aa,bb: DRAW cc,0
9060 NEXT n
9061 IF s>0 THEN GO SUB 9100
9066 INK 7: PAPER 1
9070 RETURN 

9100 LET aa=INT (RND*10)
9101 IF s<1 THEN LET s=1
9103 FOR n=1 TO s
9105 INK 0
9107 OVER 1
9201 PRINT AT 12,aa+n*4;"!!"
9202 OVER 0: NEXT n
9203 RETURN 
9600 LET cot=0
9601 FOR n=1 TO 50 STEP 10
9610 BEEP .1,10+n
9615 NEXT n
9616 LET cot=cot+1
9617 IF cot<5 THEN GO TO 9601
9620 RETURN 

9700 INK 2
9705 FOR n=1 TO s
9706 OVER 1
9710 PRINT AT 12,aa+n*4;"*"
9711 BEEP 1,10
9720 NEXT n
9725 OVER 0
9730 INK 7: PAPER 1
9740 PAUSE 50: RETURN 
