//advanced_calender
//draw calender
//2022/05/30
//1-4-45 Taiyu Honma
int y = (int)random(7);
println(" Sun Mon Tue Wed Thu Fri Sat");
for(int i=0;i<y;i++) print("    ");
//あえて29と33にしています
for(int i=1;i<(int)random(29,33);i++) print("  "+(i<10? " ":"")+i+((i+y)%7==0?"\n":""));
