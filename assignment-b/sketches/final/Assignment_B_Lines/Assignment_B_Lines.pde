//import codeanticode.syphon.*;

//SyphonServer syphon;

ArrayList <myFlyingLines> newLines = new ArrayList();


//void settings() {
//  size(960, 540, P3D);
//  PJOGL.profile=1;
//  smooth(8);
//}

void setup(){
  
  size(960,540,P3D);
  
  //syphon = new SyphonServer( this , "p5-to-syphon" );
 
  for(int i=0; i<400; i++){
  newLines.add(new myFlyingLines());
  }
  
}


void draw(){
  //background(0);
  fill(0, 10);
  rect(0,0, width,height);
  
  for(myFlyingLines b : newLines){
    
    b.display();
    b.move();
    b.display2();
    b.display3();
  }
  
  keyPressed();
   saveFrame("line-######.png");

  }
  
  void keyPressed(){
    switch(key){
      
      case('1'): stroke(random(200,255),0,0,50); break;
      case('2'): stroke(244,252,31,20); break;
      
    }
    
    //syphon.sendScreen();
    
  }