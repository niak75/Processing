//Déclaration et création de plusieurs instances de l'objet Balle

//Déclaration d'une variable contenant le nombre de balles
int nbreBalle = 100;
float vitesse;

float centreX;
float centreY;

float x;
float y;

//Déclaration d'une liste d'instances de l'objet Balle
Balle[] balles = new Balle[nbreBalle];

void setup() {
  centreX = width/2;
  centreY = height/2;

  vitesse = 1; // Nombre entre 0.5 et 10 c est mieux

  size(700, 700); //Taille de la fenêtre
  
  for (int i = 0; i < nbreBalle; i++) {
      balles[i] = new Balle();
  } 
}
  
void draw() {
  background(0); //On dessine un fond noir
  noStroke(); //On supprime le contour
  
  for (int i = 0; i < nbreBalle; i++) {

    balles[i].Vol(); 
    balles[i].display(); //Affichage de la balle 1
    }
  }

class Balle {
  
  //Déclaration des paramètres de base de la balle
  
  float vitesseY = random(-vitesse,vitesse);
  float vitesseX = random(-vitesse,vitesse);

  int nbPassage = 0;

  //Constructeur de la balle
  void Vol () {
    if(destinationExiste){
      
    }
    
    nbPassage = nbPassage+1;
    
    y = centreY+vitesseY*nbPassage;
    x = centreX+vitesseX*nbPassage;

    
  }

  //Dessin de la balle
  void display() {
    double hasardEntre1et3 = Math.ceil(random(3));
    if(hasardEntre1et3 == 1) fill(255,0,0);
    if(hasardEntre1et3 == 2) fill(0,255,0);
    if(hasardEntre1et3 == 3) fill(0,0,255);

    ellipse(x, y, 5, 5);
  }
}
