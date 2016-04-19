float xPos, yPos, xPPos, yPPos;
color  mainColor;
color  strokeColor;
 
void setup()
{
  size(960,540);
  background(0);
  stroke(0,0,0);
  strokeWeight(0.1);
  smooth();
  frameRate(5);

   
  mainColor = color(0,0,0);
  
   
  xPPos = width/2;
  yPPos = height/2;
}
 
void draw()
{
  //use
  strokeColor = color(random(255),random(255),random(255));
  for(int i = 0; i<10; i++){
  xPos = random(50,width-50);
  yPos = random(50,height-50);
   
  line(xPos,yPos,xPPos,yPPos);
  noStroke();
  strokeWeight(1);
  stroke(strokeColor,200);
  xPPos = xPos;
  yPPos = yPos;
  if(frameCount%8==0);
   }
  
  {
     
  }
   
 
}