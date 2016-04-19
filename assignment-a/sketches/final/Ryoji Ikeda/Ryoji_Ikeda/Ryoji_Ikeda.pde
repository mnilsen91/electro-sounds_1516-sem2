void setup() {
  size(960, 540);
  background(0);
  strokeWeight(50);
  frameRate(5);
}

void draw() {
  for (int i = 0; i < width; i++) {
    float r = random(255);
    stroke(r);
    line(i, 0, i, height);
    
  }
}

  //Lines are drawn when mouse is pressed on the run screen.
  //original photo: http://images.junostatic.com/full/CS2531932-02A-BIG.jpg