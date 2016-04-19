

void setup() {
  size(960, 450);
  background(255);
  frameRate(2);
}
 
int lineNum;
int rx1;
int ry1;
int rx2;
int ry2;
 
void draw() {
  background(255);
  lineNum=int(random(5, 10));
  rx1=int(random(10, width));
  ry1=int(random(10, height));
  rx2=int(random(10, width));
  ry2=int(random(10, height));
  lineStorm(lineNum, rx1, ry1, rx2, ry2);
 
}
 
int r1;
int r2;
void lineStorm(int num, int x, int y, int x2, int y2) {
  if (num >= 0) {
    stroke(0);
    line(x, y, x2, y2);
    lineStorm(num-1, ((x/2)+(abs(x-x2))/2), ((y/2)+(abs(y-y2))/2), r1, r2);
  } else {
  }
}
 
void mouseClicked() {
  redraw();
  //original photo: http://media.vam.ac.uk/media/thira/collection_images/2009BX/2009BX6035_jpg_ds.jpg
}