import codeanticode.syphon.*;

SyphonServer server;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

FFT         fft;

float t;
PImage colors; 
ArrayList<MyFlyingObject> os = new ArrayList();

float x1(float t) {
  return sin(t/10)*100 + sin(t/6)*30;
}

float y1(float t) {
  return cos(t/10)*50;
}

float x2(float t) {
  return sin(t/10)*200 + sin(t)*2;
}

float y2(float t) {
  return cos(t/20)*200 + cos(t/12)*20;
}

static final int NUM_LINES = 20;
static final int NUM_LINES2 = 20;

void settings() {
  size(1280,720, P3D);
  PJOGL.profile=1;
}

void setup() {
  size(1280, 720);
  colors = loadImage("tumblr_m5evp9pnTY1r809ibo1_400.png");
  noStroke();
  for (int i=0; i<height; i++) {
    os.add(new MyFlyingObject(i));
  }
  minim = new Minim(this);
  song = minim.loadFile("W A V E.aif", 2048);
  song.play();
  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();

  fft = new FFT( song.bufferSize(), song.sampleRate() );
  server = new SyphonServer(this, "Processing Syphon");

}


void draw() {
  background(255, 5, 22);

  fft.forward( song.mix );
  beat.detect(song.mix);
  if (key == 'e') {
    background(255, 200, 20);
  } else if (key == 'r') {
    background(random(255));
  }
  stroke(255);


  if ( beat.isOnset() ) strokeWeight(2);
  translate(width/2, height/2);

  for (int i = 0; i < NUM_LINES; i++) {
    line(x1(-t+i*2), y1(-t+i*2), x2(-t+i), y2(-t+i));
  }
  stroke(26, 100, 255, 10);
  for (int i = 0; i < NUM_LINES2; i++) {
    line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));
  }  

  if (key == 't') {
    for (int i = 0; i < fft.specSize(); i++) {
      line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));
    }
  }
  if (key == 'e') {
    filter(ERODE);
  }
  t += 0.5;
    for (MyFlyingObject o : os) {
    o.move();
    o.draw();
    
  }
  server.sendScreen();
}

class MyFlyingObject {

  float x = 0;
  float y = 200;
  float z = 0;
  float s = 10;

  float speed = 0;

  int col = 0;
  int colX = int(random(colors.width));
  int colY = 150;

  ArrayList<Integer> others = new ArrayList();

  MyFlyingObject(float theY) {
    y = theY;
    z = random(-400, 400);
    s = 10;
    speed = random(0.5, 4.0);
    int n = int(random(1, 4));
    for (int i=0; i<n; i++) {
      others.add(int(random(height)));
    }
  }

  void move() {

    colY+=1;
    colY %= colors.height;

    x = x + speed;
    if (x<0 || x>width) {
      speed *= -1;
    }
  }

  void draw() {
    col = colors.get(colX, colY);
    fill(255);
    pushMatrix();
    //translate(x, y , z);
    // box(s,10,100);
    translate(x, y, z);
    //rect(0,0,10,10);
    stroke(255, 20);
    for (Integer i : others) {

      MyFlyingObject t = os.get(i);
      line(x, y, z, t.x, t.y, t.z);
    }
    popMatrix();
  }
}

//The author reference is by Alexander Miller.
//Alexander Miller discusses how to create a more modern take of a vintage computer art set in a repetitive motion.
//The floats that are located at the top functions as the motions of the lines that are being commanded. Below, I have minim to detect the sounds that are synchronizing the the motions with sound.
//I've used keyPress function to activate different visual events to make the piece more minimalistic and simplistic. ERODE is the filter being used to flicker the colors of white and black.