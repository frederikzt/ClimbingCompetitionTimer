int minutes;
int seconds;
float tSize;
boolean go;

void setup() {
  size(600, 500);
  //fullScreen();
  minutes = 4;
  seconds = 0;
  frameRate(20);
  tSize = width/2.5;
  textSize(tSize);
  textAlign(CENTER);
  fill(255, 0, 0);
  background(#12132E);
  text(minutes+":0"+seconds, width/2, height/2+tSize/2.5);
  go = false;
}

void draw() {
  if (go) {
    background(#12132E);
    seconds--;
    if (seconds<0) {
      minutes--;
      seconds = 59;
    }
    if (minutes < 0) {
      minutes = 4;
      seconds = 0;
      go = false;
      fill(255, 0, 0);
    }
    display();
  }
}

void display() {
  if (seconds < 10) text(minutes+":0"+seconds, width/2, height/2+tSize/2.5);
  else text(minutes+":"+seconds, width/2, height/2+tSize/2.5);
}

void keyPressed() {
  if (keyCode == ' ') {
    if (go) {
      go = false;
      fill(255, 0, 0 );
    } else {
      go = true;
      fill(255);
    }
    display();
  }
}