//declare
float xPos, yPos, xPPos, yPPos;
color  mainColor;
color  strokeColor;
 
void setup()
{
  size(960,540);
  background(255);
  stroke(0,0,0);
  strokeWeight(0.1);
  smooth();
  frameRate(5);

   
  mainColor = color(0,0,0);
  strokeColor = color(0,0,0);
   
  xPPos = width/2;
  yPPos = height/2;
}
 
void draw()
{
  //use
  xPos = random(50,width-50);
  yPos = random(50,height-50);
   
  line(xPos,yPos,xPPos,yPPos);
  noStroke();
  stroke(strokeColor,100);
  xPPos = xPos;
  yPPos = yPos;
  if(frameCount%8==0)
  
  //original photo: https://www.magasin3.com/wp-content/uploads/2014/08/multimedia-17060-img.jpg
  {
     
  }
   
 
}