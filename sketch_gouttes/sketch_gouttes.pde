int nbGouttes=1000;
int nbObstacles=2;
float facteurRestitution=0.25; //Hauteur max retrouvee apres rebond
float agitationEau=10; //Pour la gravite et le rebond

Goutte[] gouttes=new Goutte[nbGouttes];
Obstacle[] obstacles=new Obstacle[nbObstacles];

void setup() {
  noStroke();
  size(700, 700);
  
  for (int i=0; i<nbGouttes; i++) {
    gouttes[i]=new Goutte(random(width), 20, 5);
  }
  
  obstacles[0]=new Obstacle(500,200,600,500);
  obstacles[1]=new Obstacle(100,300,500,320);
}


void draw() {
  fill(255,255,255,70);
  rect(0,0,width,height);
  
  afficherObstacles();
  mouvementDesGouttes();
}


void mouvementDesGouttes() {
  for (int i=0; i<nbGouttes; i++) {
    gouttes[i].determineLesForces();
    gouttes[i].calculeTrajectoire();
    gouttes[i].bouge();
    gouttes[i].affiche();
  }
}


void afficherObstacles(){
  for(int i=0 ; i<nbObstacles ; i++){
    obstacles[i].inclinaison+=0.00;
    obstacles[i].afficher();
  }
}


class Force {
  float decalageX;
  float decalageY;

  float angle;
  float valeur;

  Force(float nouvdecalageX, float nouvdecalageY) {
    decalageX=nouvdecalageX;
    decalageY=nouvdecalageY;

    valeur=(float)Math.sqrt(decalageX*decalageX+decalageY*decalageY);
    angle=atan(decalageY/decalageX);
  }
}

void mousePressed(){
  noLoop();
}


// Clacule les coordonnees d
float[] faisTournerUnPoint(float xPoint,float yPoint,float xCentreRotation,float yCentreRotation,float angle){
  angle+=PI;
  
  float distanceDeuxPoints=(float)Math.sqrt((xPoint-xCentreRotation)*(xPoint-xCentreRotation)+(yPoint-yCentreRotation)*(yPoint-yCentreRotation));
  float angleInitial=acos((yCentreRotation-yPoint)/distanceDeuxPoints);
  if(xPoint>xCentreRotation)angleInitial=-angleInitial;
  float angleFinal=angleInitial-angle;
  
  float xFinal=xCentreRotation+sin(angleFinal)*distanceDeuxPoints;
  float yFinal=yCentreRotation+cos(angleFinal)*distanceDeuxPoints;
  
  float[] coordonneesFinales=new float[2];
  coordonneesFinales[0]=xFinal;
  coordonneesFinales[1]=yFinal;
  return coordonneesFinales;
}