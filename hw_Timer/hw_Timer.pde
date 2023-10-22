//hm_Timer
//write timer with timer core class
//2022/10/10
//1-4-45 Taiyu Honma
ArrayList<TimerCore> timers = new ArrayList<TimerCore>();

void setup()
{
  size(800, 800);

  timers.add(new CircleTimer(100, 100));
  timers.add(new VerticalTimer(300, 100));
    timers.add(new CircleTimer(100, 200));
  timers.add(new VerticalTimer(300, 400));
    timers.add(new CircleTimer(100, 300));
  timers.add(new VerticalTimer(300, 600));
}

void draw() {
  background(255);
  for (TimerCore timer : timers) {
    timer.display();
  }
}

void mousePressed()
{
  for (TimerCore timer : timers) {
    timer.click(mouseX, mouseY);
  }
}
