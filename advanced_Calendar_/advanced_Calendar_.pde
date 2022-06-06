//advanced_Calendar
//draw calendar
//2022/05/30
//1-4-45 Taiyu Honma
float r=-random(70);
for(int y=int(r/10),i=y;i<28-r%4;print(i==y?" Sun Mon Tue Wed Thu Fri Sat\n":"  "+(i<1?"  ":(i<10?" ":"")+i+((i-y)%7==0?"\n":""))),i++);
