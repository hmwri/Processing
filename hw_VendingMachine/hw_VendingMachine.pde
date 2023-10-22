//hm_VendingMachine
//calc charge of vending machine 
//2022/10/10
//1-4-45 Taiyu Honma

void setup(){
  VendingMachine vm = new VendingMachine(5,5,5);
  vm.insert(0,1,1);
  vm.buy(130);
  vm.insert(0,0,2);
  vm.buy(110);
  vm.insert(0,0,2);
  vm.buy(140);
  
  vm = new VendingMachine(9,8,7);
  vm.insert(0,0,2);
  vm.buy(110);
    vm.insert(0,0,2);
  vm.buy(120);
    vm.insert(0,0,2);
  vm.buy(130);
  vm.insert(2,0,2);
  vm.buy(180);
  
  vm = new VendingMachine(100,0,0);
  vm.insert(0,0,2);
  vm.buy(110);
  
    vm = new VendingMachine(100,0,0);
  vm.insert(0,0,2);
  vm.buy(200);
  
  
}

void draw(){
}
