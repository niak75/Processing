float centreX;
float centreY;

tentacule[] tentacules=new tentacule[10];

void setup(){
  size(displayWidth,displayHeight);
  frameRate(100);
  centreX=width/2;
  centreY=height/2;
  strokeWeight(20);
  
  for (int i = 0; i < 10; i++) {
    tentacules[i]= new tentacule(color(random(255),random(255),random(255),random(50,100)),random(-10000,10000),random(-1,1));
  }
}
    
void draw(){
  fill(0,0,0,20);
   rect(-1,-1,width,height);
   ellipse(centreX,centreY,10,10);
   
   for (int i = 0; i < 10; i++) {
    tentacules[i].affiche();
    tentacules[i].direction+=tentacules[i].changementDirection;
    tentacules[i].changementDirection+=random(-0.1,0.1)-tentacules[i].changementDirection/100;
  }
}

class tentacule{
  color couleur;
  float direction;
  float changementDirection;
  
  tentacule(color newCouleur, float newDirection, float newChangementDirection){
    couleur=newCouleur;
    direction= newDirection;
    changementDirection=newChangementDirection;
  }
  
  void affiche(){
    stroke(couleur);
    line(centreX,centreY,1000000*cos(radians(direction)),1000000*sin(radians(direction)));
  }
}