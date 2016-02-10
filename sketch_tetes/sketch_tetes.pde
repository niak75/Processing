int nbTetes=20;
tete[] tetes=new tete[nbTetes];

void setup(){
  size(displayWidth,displayHeight);
  for (int i = 0; i < nbTetes; i++) {
    tetes[i] = new tete(random(50,width-50),random(50,height-50),random(10,150)+random(10,150),color(random(255),random(255),random(255)));
  }
}

void draw(){
  background(0);  
  for (int i = 0; i < nbTetes; i++) {
    tetes[i].affiche();
  }
}

class tete{
  float centreX;
  float centreY;
  float taille;
  color couleur;
  
  tete(float newCentreX, float newCentreY, float newTaille, color newCouleur){
     centreX=newCentreX;
     centreY=newCentreY;
     taille=newTaille;
     couleur=newCouleur;
  }
  
  void affiche(){
    fill(couleur);
    ellipse(centreX,centreY,taille,taille);
    fill(255,255,255);
    ellipse(centreX-taille/5,centreY-taille/10,taille/6,taille/6);
    ellipse(centreX+taille/5,centreY-taille/10,taille/6,taille/6);
    
    fill(0);
    ellipse(centreX-taille/5+taille*(mouseX-centreX)/15000,centreY-taille/10+taille*(mouseY-centreY)/8000,taille/15,taille/15);
    ellipse(centreX+taille/5+taille*(mouseX-centreX)/15000,centreY-taille/10+taille*(mouseY-centreY)/8000,taille/15,taille/15);
  }
}

void mousePressed(){
  nbTetes-=1;
}