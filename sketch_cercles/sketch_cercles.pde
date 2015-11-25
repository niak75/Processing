int nbCercles=10000;
cercle[] cercles = new cercle[nbCercles];

void setup(){
  size(700,700);
  noStroke();
  
  for(int i=0;i<nbCercles;i++){
    cercles[i]=new cercle(random(width),random(height));
  }
}

void draw(){
  nbCercles=mouseX+mouseY;
  background(0);
  ellipse(mouseX,mouseY,5,5);
  for(int i=0;i<nbCercles;i++){
    cercles[i].dessine();
  }
  
}

void mousePressed(){
   for(int i=0;i<nbCercles;i++){
    cercles[i]=new cercle(random(width),random(height));
  }
}

class cercle{
  float posX;
  float posY;
  float diametre;
  
  float luminosite;
  float rouge;
  float vert;
  float bleu;
  color couleur;
  
  cercle(float newPosX,float newPosY){
    posX=newPosX;
    posY=newPosY;
    
    luminosite=random(255);
    rouge=random(255);
    vert=random(255);
    bleu=random(255);
    couleur=color(rouge,vert,bleu,luminosite);
    
    diametre= random(1000)/sqrt(nbCercles);
  }
  
  void dessine(){
    fill(couleur);
    ellipse(posX,posY,diametre,diametre);
  }
  
  void changeCouleur(){
    couleur=color(random(255),random(255),random(255),55+random(100));
  }
  
  void changeLuminosite(){
    couleur=color(rouge,vert,bleu,luminosite-30);
  }
  
}


/*
for(int i=0;i<nbCercles;i++){
    cercles[i].dessine();
    if(i==0)println(Math.sqrt(abs(mouseX-cercles[i].posX) + abs(mouseY-cercles[i].posY)),Math.sqrt(cercles[i].diametre/2));
    
    if(Math.sqrt(abs(mouseX-cercles[i].posX) + abs(mouseY-cercles[i].posY)) < Math.sqrt(cercles[i].diametre/2)){
      cercles[i].changeLuminosite();
    }
  }*/