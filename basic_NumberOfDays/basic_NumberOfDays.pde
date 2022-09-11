//basic_NumberOfDays
//calc number of days
//2022/07/04
//1-4-45 Taiyu Honma
void setup(){
  for(int i = 1;i <= 12;i++){
    println("2022/"+i+" 日数"+getNumberOfDays(2022,i));
  }
  
  println("2020/2 日数"+getNumberOfDays(2020,2));
  println("100/2 日数"+getNumberOfDays(4,2));
  println("400/2 日数"+getNumberOfDays(400,2));
}
int getNumberOfDays(int year,int month){
  switch(month) {
    case 2:
      if((year%4==0 && year%100 !=0) || year%400 == 0){
        return 29;
      }
      return 28;
    case 4:
    case 6:
    case 9:
    case 11:
      return 30;
    default:
      return 31;
  }
}
