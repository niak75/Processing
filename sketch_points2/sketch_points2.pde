//Déclaration d'une variable contenant le nombre de balles
int nbreBalle = 100;

float vitesseEloignement = 20; //Vitesse des balles quand elles ne vont pas vers la souris
float vitesseRapprochement = 0.01; //Vitesse des balles pour se rapprocher vers la souris

boolean destinationExiste = false;

//Déclaration d'une liste d'instances de l'objet Balle
Balle[] balles = new Balle[nbreBalle];



void setup() {
  size(1000, 700); //Taille de la fenêtre
  background(0); // Fond noir
  
  for (int i = 0; i < nbreBalle; i++) {
      balles[i] = new Balle(); // Création de toutes les balles
  } 
}



void mouseReleased(){ // Quand on clique sur l'écran
  destinationExiste = true;
  
  for (int i = 0; i < nbreBalle; i++) {
    balles[i].calculeDistances(); 
  }
}
  
  
  
void draw() {
  frameRate(30); // Vitesse d'execution du programme
  fill(0,0,0,20); 
  rect(0, 0, width, height); //On dessine un fond transparent pour que les balles s'effacent petit à petit
  noStroke(); //Dessins plus beaux
  
  for (int i = 0; i < nbreBalle; i++) {
    balles[i].bouge(); //Mouvement de la balle
    balles[i].display(); //Affichage de la balle 
  }
}
  


class Balle {
  
  //Déclaration des paramètres de base de la balle
  int nbFoisOuOnSeRapprocheDeDestination;
  
  float distanceX;
  float distanceY;
  
  float currentx;
  float currenty;
  
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
      nbPassage = nbPassage+1;
      
      //Mouvement :
      currentx = centreX + nbPassage * vitesseX;
      currenty = centreY + nbPassage * vitesseY;
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
    ellipse(currentx, currenty, 5, 5);
  }
}