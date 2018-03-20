int minutes;
int seconds;
float tSize;
boolean go;
int startime;



void setup() {
  //size(600, 500);
  fullScreen();
  minutes = 4;
  seconds = 0;
  tSize = width/2.2;
  textSize(tSize);
  textAlign(CENTER);
  fill(255, 0, 0);
  background(#12132E);
  text(minutes+":0"+seconds, width/2, height/2+tSize/2.5);
  go = false;
}

void draw() {

  if (hasFinished()) {
    startime = millis();
    if (go) {
      seconds--;
      updateNumbers();
      display();
    }
  }
}

void display() {
  background(#12132E);
  if (seconds < 10) text(minutes+":0"+seconds, width/2, height/2+tSize/2.5);
  else text(minutes+":"+seconds, width/2, height/2+tSize/2.5);
}

boolean hasFinished() {
  return millis() - startime > 1000;
}

void updateNumbers() {
  if (seconds<0) {
    minutes--;
    seconds = 59;
  }
  if (seconds>60) {
    minutes++;
    seconds = 0;
  }
  if (minutes < 0) {
    minutes = 4;
    seconds = 0;
    go = false;
    fill(255, 0, 0);
  }
}

void changeGo() {
  if (go) {
    go = false;
    fill(255, 0, 0 );
  } else {
    go = true;
    fill(255);
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    changeGo();
    display();
  }
  if (keyCode == 'R') {
    go = false;
    fill(255, 0, 0);
    seconds = 0;
    minutes = 4;
    display();
  }
  if (keyCode == UP) {
    seconds += 10;
    updateNumbers();
    display();
  }
  if (keyCode == DOWN) {
    seconds -= 10;
    updateNumbers();
    display();
  }
}