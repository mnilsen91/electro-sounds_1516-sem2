class myFlyingLines{
  
  //GLOBAL VARIABLES
  
  float x,y,z;
  float x1,y1;
  float x2,y2;
  int col;
  float thicky;
  float speed;
  float r;
  float speedo;
  float xx;
  
  //CONSTRUCTOR
  
  myFlyingLines(){
    
    x = random(width);
    y = random(height);
    z = random(-200,200);
    x2 = random(-300,300);
    y2 = random(-300,300);
    col = color(0,0,255,40);
    thicky = random(0.5,2);
    speed = 4;
    speedo = random(-3,3);
   
  }
  
  
  
  //FUNCTIONS
  
  void display(){
    
    //r += speed;
    r = (frameCount*0.01);
    r += speedo;
    
    pushMatrix();
    translate(x,y,z);
    rotateX(r);
    stroke(col);
    keyPressed();
    strokeWeight(thicky);
    line(x1,y1,x2,y2);
    popMatrix();
    
  }
  
  void move(){
    
    x += speed;
    
    if(x>width || x<0){
      speed *= -1;
      
    }
    
  }
  
      void display2(){
      
      pushMatrix();
      translate(0,0);
      fill(255,10);
      noStroke();
      rect(0,0,width, 100);
      popMatrix();
    }
    
      void display3(){
        
      pushMatrix();
      translate(0,0);
      fill(255,10);
      noStroke();
      rect(0,440,width, 100);
      popMatrix();
    }
  
}