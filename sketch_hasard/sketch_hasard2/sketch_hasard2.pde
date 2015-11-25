float y=0;
float x=0;

float ecartementMax=random(2,5);

//float r=255;
//float g=255;
//float b=255;

void setup(){
  size(700,700);
  background(0);
}

void draw(){
  stroke(255,255,255,ecartementMax*2);
  
  for(int i=0 ; i<max(width,height) ; i++){
    point(i,i+y);
    y+=random(-ecartementMax,ecartementMax);
  }
  y=0;
  
  translate(width/2,0);
  for(int i=0 ; i<height ; i++){
    point(y,i);
    y+=random(-ecartementMax,ecartementMax);
  }
  y=0;
  
  translate(-width/2,height/2);
  for(int i=0 ; i<width ; i++){
    point(i,y);
    y+=random(-ecartementMax,ecartementMax);
  }
  y=0;
  
  //g-=random(0.5);
  //r-=random(2);
  //b-=random(1);
}

void mousePressed(){
  ecartementMax=random(2,10);
  background(0);
}