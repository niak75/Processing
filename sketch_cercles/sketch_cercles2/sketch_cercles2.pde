float taille=700;

void setup(){
  size(700,700);
  background(0);
  noFill();
  stroke(255);
  //strokeWeight(3);
  frameRate(100);
}

void draw(){
  translate(350,350);
  ellipse(0,0,taille,taille);
  
  stroke(255,255,255,20);
  line(cos(radians(frameCount))*taille/2,sin(radians(frameCount))*taille/2,cos(radians(frameCount*3))*taille/2,sin(radians(frameCount*3))*taille/2);
}