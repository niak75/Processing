int nbBalles=10;
double distanceBalles;
balle[] balles=new balle[nbBalles];

void setup(){
  size(displayWidth,displayHeight);
  for(int i=0 ; i<nbBalles ; i++){
    balles[i]= new balle(random(-180,180),random(0,10));
  }
  frameRate(40);
}

void draw(){
  background(0);
  for(int i=0 ; i<nbBalles ; i++){
    balles[i].bouge();
    balles[i].affiche();
    for(int n=0 ; n<nbBalles ; n++){
      if(n!=i){
        distanceBalles=Math.sqrt(Math.pow(balles[i].posX-balles[n].posX,2)+(Math.pow(balles[i].posY-balles[n].posY,2)));
        if(distanceBalles<balles[i].taille/2+balles[n].taille/2){
          Mouvement temporaireMouvement=balles[n].mouvement;
          balles[n].mouvement=balles[i].mouvement;
          balles[i].mouvement=temporaireMouvement;
          
        }
      }
    }
  }
}

class Mouvement{
  float direction;
  float vitesse;
  Mouvement(float nouvDirection,float nouvVitesse){
    direction=nouvDirection;
    vitesse=nouvVitesse;
  }
  
  float deplacementX(){
    return cos(radians(direction))*vitesse;
  }
  float deplacementY(){
    return sin(radians(direction))*vitesse;
  }
}

class balle{
  Mouvement mouvement;
  float posX;
  float posY;
  float taille;
  float couleur;
  
  balle(float nouvDirection,float nouvVitesse){
    mouvement=new Mouvement(nouvDirection,nouvVitesse);
    posX=random(50,width-50);
    posY=random(50,height-50);
    taille=random(30,100);
    couleur=255;
  }
  
  void bouge(){
    posX+=mouvement.deplacementX();
    posY+=mouvement.deplacementY();
    
    if(posX>width){
      posX=0;
    }
    if(posX<0){
      posX=width;
    }
    if(posY>height){
      posY=0;
    }
    if(posY<0){
      posY=height;
    }
  }
  
  void affiche(){
    ellipse(posX,posY,taille,taille);
  }
}