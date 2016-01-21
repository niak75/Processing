class Balle {
  
  //Déclaration des paramètres de base de la balle
  int nbFoisOuOnSeRapprocheDeDestination;
  
  float distanceX;
  float distanceY;
  
  float currentx=width/2;
  float currenty=height/2;
  
  float vitesseY;
  float vitesseX;
  
  float centreX = width/2;
  float centreY = height/2;

  int nbPassage = 0;

  //Constructeur de la balle
  void bouge () {
    if(nbPassage == 0){
      vitesseY = random(-vitesseEloignement,vitesseEloignement);
      vitesseX = random(-vitesseEloignement,vitesseEloignement);
    }
    
    if(!destinationExiste){ // Quand on n'a pas cliqué sur l écran
      nbFoisOuOnSeRapprocheDeDestination=0;
      
      //Mouvement :
      currentx = centreX + nbPassage * vitesseX;
      currenty = centreY + nbPassage * vitesseY;
      
      nbPassage = nbPassage+1;
    }
    
    else{
      nbFoisOuOnSeRapprocheDeDestination+=1;
      
      //Mouvement :
      currentx = currentx + vitesseRapprochement * distanceX;
      currenty = currenty + vitesseRapprochement * distanceY;
    }
     
    if(nbFoisOuOnSeRapprocheDeDestination == Math.ceil(1/vitesseRapprochement)){
      nbPassage = 0;
      centreX = currentx;
      centreY = currenty;
    }
     
    if(nbFoisOuOnSeRapprocheDeDestination == Math.ceil(1/vitesseRapprochement)+1){
       destinationExiste = false;
    }
  }
  
  void calculeDistances(){
    nbPassage = 0;
    
    distanceX = mouseX - currentx;
    distanceY = mouseY - currenty;
  }

  //Dessin de la balle
  void display() {
    double hasardEntre1et5 = Math.ceil(random(5)); //Aléatoire pour la couleur 
    if(hasardEntre1et5 == 1) fill(255,0,0); //Rouge
    if(hasardEntre1et5 == 2) fill(0,255,0); //Vert
    if(hasardEntre1et5 == 3) fill(0,0,255); //Bleu
    if(hasardEntre1et5 == 4) fill(255,127.5,0); //Orange
    if(hasardEntre1et5 == 5) fill(255,0,255); //Violet
    ellipse(currentx, currenty, tailleBalle, tailleBalle);
  }
}