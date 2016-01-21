double[] hauteurDesPoints = new double[1250];
float ecartementMax=4;
float influence=0;
boolean loop=true;
float k;
float n=300;

void setup(){
  size(1250,700);
  background(0);
  
  
  
  
  stroke(255);
  strokeWeight(2);
}


void draw(){
  k = frameCount/100.0;
  hauteurDesPoints[0]=(double)0.4;
  for(int i=1 ; i<width ; i++){
    hauteurDesPoints[i]=(double)k*hauteurDesPoints[i-1]*(1-hauteurDesPoints[i-1]);
//    hauteurDesPoints[i]=hauteurDesPoints[i-1];
  }
  frameRate(10000);
  background(0);
  stroke(255,255,255,20);
  line(0,height/2,width,height/2);
  
  for(float i=0 ; i<width-1 ; i++){
    stroke(255);
    line(i*10,n*(float)hauteurDesPoints[(int)i]+height/2,(i+1)*10,n*(float)hauteurDesPoints[(int)i+1]+height/2);
   //hauteurDesPoints[(int)i]=hauteurDesPoints[(int)i+1];
  }
  
  point(width,n*(float)hauteurDesPoints[width-1]+height/2);
}
  
  /*
  hauteurDesPoints[width-1]+=random(-ecartementMax+influence,ecartementMax+influence);
  
  ecartementMax=4+mouseX/80;
  influence=0.005*(mouseY-height/2);
  
  dessineTraits();
}

void dessineTraits(){
  float n=0;
  float max=-height;
  float min=height;
  for(int i=0 ; i<width ; i++){
    n+=hauteurDesPoints[i]-height/2;
    max=Math.max(max,hauteurDesPoints[i]);
    min=Math.min(min,hauteurDesPoints[i]);
  }
  float moyenne=n/width;
  stroke(255,0,0,155);
  line(0,height/2+moyenne,20,height/2+moyenne);
  stroke(0,0,255,155);
  line(0,max,20,max);
  line(0,min,20,min);
}


void mousePressed(){
  if(loop){
    noLoop();
    loop=false;
  }
  else{
    loop();
    loop=true;
  }
}*/

void mousePressed(){
  noLoop();
}