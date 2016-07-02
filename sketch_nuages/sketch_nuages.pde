Point[] listePoints = new Point[100000];
float dispersion=100;
float dispersionCouleurs=35;
int nbNuages=10;

void setup(){
  size(displayWidth, displayHeight);
  background(0);
  noStroke();
  frameRate(200);
}

void draw(){
  fill(0,0,0,1);
  rect(0,0,width,height);
  
  if(frameCount>nbNuages){
    Point positionDepart=listePoints[(int)Math.floor(random(frameCount-1))];
    println(positionDepart.x);
    float direction = random(360);
    float distance = random(dispersion);
    
    int posX = (int)(positionDepart.x+distance*Math.cos(radians(direction)));
    int posY = (int)(positionDepart.y+distance*Math.sin(radians(direction))/3);
    
    listePoints[frameCount-1]=new Point(posX, posY);
    listePoints[frameCount-1].r=positionDepart.r+random(dispersionCouleurs)-dispersionCouleurs/2;
    listePoints[frameCount-1].g=positionDepart.g+random(dispersionCouleurs)-dispersionCouleurs/2;
    listePoints[frameCount-1].b=positionDepart.b+random(dispersionCouleurs)-dispersionCouleurs/2;
  }
  else{
    listePoints[frameCount-1]=new Point((int)random(width-200)+100,(int)random(height-150)+75);
  }
  
  listePoints[frameCount-1].dessine();
}

class Point {
  int x;
  int y;
  
  float r=random(255);
  float g=random(255);
  float b=random(255);
  float transparence=random(150);
  
  Point(int nouvX, int nouvY){
    x=nouvX;
    y=nouvY;
  }
  
  void dessine(){
    fill(r,g,b,transparence);
    ellipse(x,y,30,30);
  }
}