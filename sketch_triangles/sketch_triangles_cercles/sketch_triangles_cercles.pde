float diametre = 1700;
Point[] listePoints = new Point[3];

void setup(){
  size(displayWidth,displayHeight);
  background(0);
  noFill();
  
  for(int i=0 ; i<3 ; i++){
    listePoints[i] = new Point();
  }
}

void draw(){
  stroke(255,255,255,255);
  ellipse(width/2,height/2,diametre,diametre);
  for(int i=0 ; i<3 ; i++){
    listePoints[i].deplace();
    //listePoints[i].dessine();
  }
  stroke(255,0,0,30);
  line(listePoints[0].x,listePoints[0].y,listePoints[1].x,listePoints[1].y);
  stroke(0,255,0,30);
  line(listePoints[1].x,listePoints[1].y,listePoints[2].x,listePoints[2].y);
  stroke(0,0,255,30);
  line(listePoints[0].x,listePoints[0].y,listePoints[2].x,listePoints[2].y);
}

class Point {
  float x;
  float y;
  float direction;
  float vitesse;
  
  Point(){
    direction=random(360);
    vitesse=0.5+random(1.5);
  }
  
  void deplace(){
    direction+=vitesse;
    x=(float)(width/2+Math.cos(radians(direction))*diametre/2);
    y=(float)(height/2+Math.sin(radians(direction))*diametre/2);
  }
  
  void dessine(){
    ellipse(x, y, 10, 10);
  }
}

void mousePressed(){
  noLoop();
}