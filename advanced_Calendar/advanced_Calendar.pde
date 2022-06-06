//advanced_Calendar
//draw calendar
//2022/05/30
//1-4-45 Taiyu Honma
for(int y=-(int)random(7),i=y;i<28+random(4);print(i==y?" Sun Mon Tue Wed Thu Fri Sat\n":"  "+(i<1?"  ":(i<10?" ":"")+i+((i-y)%7==0?"\n":""))),i++);
