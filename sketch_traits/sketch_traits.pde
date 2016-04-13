int nbPoints=20;
point[] points=new point[nbPoints];

void setup(){
  size(displayWidth,displayHeight);
  for(int i=0;i<nbPoints;i++){
    points[i]=new point();
    frameRate(100);
    stroke(255);
    strokeWeight(4);
  }
}

void draw(){
  fill(0,0,0,40);
  rect(-5,-5,width+10,height+10);
  for(int i=0;i<nbPoints;i++){
    points[i].traceTrait(points[(i+1)%nbPoints]);
    points[i].traceTrait(points[(i+8)%nbPoints]);
    points[i].bouge();
    if(frameCount%150==0)points[i].changeDestination();
  }
}

class point{
  float posX;
  float posY;
  float destinationX;
  float destinationY;
  
  point(){
    posX=random(0,width);
    posY=random(0,height);
    destinationX=random(0,width);
    destinationY=random(0,height);
  }
  void traceTrait(point autrePoint){
    line(posX,posY,autrePoint.posX,autrePoint.posY);
  }
  void bouge(){
    posX+=(destinationX-posX)/100.0;
    posY+=(destinationY-posY)/100.0;
  }
  void changeDestination(){
    destinationX=random(0,width);
    destinationY=random(0,height);
  }
}