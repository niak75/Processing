float precision=1000;

void setup(){
  size(700,700);
}

void draw(){
  translate(0,height/2);
  for(double x=0 ; x<width ; x+=1/precision){
    point((float)x,tan(radians((float)x)));
  }
}