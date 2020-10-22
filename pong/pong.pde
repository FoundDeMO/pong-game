//pong!
//farzat selo
//Programming 11


//minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer leftbump, rightbump, wall, intro, score, clapping;

//mode ints
int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball

//scoring
int leftscore, rightscore, timer;

//keyboard variables
boolean wkey, skey, upkey, downkey;
boolean AI;

int x, y, d;
float vx, vy;

PFont player2;

void setup() {
  fullScreen(P2D);
  mode = INTRO;
  
  //initalize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //initalize
  ballx = width/2;
  bally = height/2;
  balld = 80;
  
  vx = random(-5, 5);
  vy = random(-5, 5);
  
  rightscore = leftscore = 0;
  timer = 100;
  
  player2 = createFont("PressStart2P-Regular.ttf", 200);
  
  //initalize keyboard vars
  wkey = skey = upkey = downkey = false;
  
  //sounds
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  clapping = minim.loadFile("clapping.wav");
  leftbump = minim.loadFile("leftpaddle.wav");
  rightbump = minim.loadFile("rightpaddle.wav");
  score = minim.loadFile("score.wav");
  wall = minim.loadFile("wall.wav");
}

void draw() {
  if (mode == INTRO) {
  intro();
  } else if (mode == GAME) {
  game();
  } else if (mode == PAUSE){
  pause();
  } else if (mode == GAMEOVER) {
  gameover();
  } else {
    println("Mode error: " + mode);
  }
}
  
  void tactileRect (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(255);
  } else {
    stroke(100);
}
  }
