void setup(){
  size(700,700);
  background(255);
  noStroke();
  //frameRate(15);
}

void draw(){
  background(255);
  translate(width/2,height/2);
  for(int i=0 ; i<100 ; i++){
    rotate(radians((float)frameCount/100));
    translate(i,i);
    fill((float)i/2,0,0);
    ellipse(0,0,5,5);
    translate(-i,-i);
  }
}