float direction=0;

void setup(){
  size(displayWidth,displayHeight);
  strokeWeight(10);
  background(0);
}

void draw(){
  stroke(random(255),random(255),random(255));
  
  direction+=1;
  float longueurTrait = random(300);
  double positionX = mouseX+longueurTrait*Math.cos(radians(direction));
  double positionY = mouseY+longueurTrait*Math.sin(radians(direction));
  line(mouseX, mouseY, (int)positionX, (int)positionY);
}

void mousePressed(){
  background(0);
}