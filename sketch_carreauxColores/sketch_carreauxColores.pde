//1280,800

int nbCellulesLongueur = 256;
int nbCellulesHauteur=160;

int tailleTrace=8000;
int nbTracesX = 256;
int nbTracesY = 140;

Cellule[][] cellules = new Cellule[nbCellulesLongueur][nbCellulesHauteur];
Trace[][] traces = new Trace[nbTracesX][nbTracesY];

boolean caTourne=true;


void setup() {
  noStroke();
  size(displayWidth, displayHeight);
  frameRate(700);

  creeCellules(nbCellulesLongueur, nbCellulesHauteur);

  for (int y=0; y<nbTracesY; y++) {
    for (int x=0; x<nbTracesX; x++) {
      traces[x][y]=new Trace(0, 0, x+2, y+2);
    }
  }
}

void draw() {
  background(0);
  for (int y=0; y<nbTracesY; y++) {
    for (int x=0; x<nbTracesX; x++) {
      fill(traces[x][y].ratioCasesTouchees()*350, 0, 0);
      rect(x*5, y*5, 5, 5);
    }
  }
  rect(0,0,1300,10);
}

void dessineCellules(int nbLongueur, int nbHauteur) {
  for (int y=0; y<nbHauteur; y++) {
    for (int x=0; x<nbLongueur; x++) {
      cellules[x][y].dessine();
    }
  }
}

void creeCellules(int nbLongueur, int nbHauteur) {
  for (int y=0; y<nbHauteur; y++) {
    for (int x=0; x<nbLongueur; x++) {
      cellules[x][y] = new Cellule(x*(width/nbLongueur), y*(height/nbHauteur), width/nbLongueur, height/nbHauteur);
    }
  }
}

class Cellule {
  int x;
  int y;
  float tailleX;
  float tailleY;

  color couleur;

  Cellule(int nouvX, int nouvY, float nouvTailleX, float nouvTailleY) {
    x=nouvX;
    y=nouvY;
    tailleX=nouvTailleX;
    tailleY=nouvTailleY;

    couleur=color(200, 100, 100);
  }

  void dessine() {
    fill(couleur);
    rect(x, y, tailleX, tailleY);
  }
}

class Trace {
  int xDebut;
  int yDebut;

  int nbCellulesX;
  int nbCellulesY;
  Boolean[][] casesTouchees;

  Trace(int nouvX, int nouvY, int nouvNbCellulesX, int nouvNbCellulesY) {
    xDebut=nouvX;
    yDebut=nouvY;

    nbCellulesX=nouvNbCellulesX;
    nbCellulesY=nouvNbCellulesY;

    casesTouchees = new Boolean[nbCellulesX][nbCellulesY];
    remplieTrace();
  }

  void remplieTrace() {
    for (int y=0; y<nbCellulesY; y++) {
      for (int x=0; x<nbCellulesX; x++) {
        casesTouchees[x][y]=false;
      }
    }

    int incrementationX=1;
    int incrementationY=1;

    int x=xDebut;
    int y=yDebut;

    for (int i=0; i<tailleTrace; i++) {      
      casesTouchees[x][y]=true;

      if (x>=nbCellulesX-1 || (x<=0 && incrementationX<0)) {
        incrementationX = -incrementationX;
      }
      if (y>=nbCellulesY-1 || (y<=0 && incrementationY<0)) {
        incrementationY = -incrementationY;
      }

      x+=incrementationX;
      y+=incrementationY;
    }
  }

  float ratioCasesTouchees() {
    float nbTouchees=0;
    float nbPasTouchees=0;
    for (int y=0; y<nbCellulesY; y++) {
      for (int x=0; x<nbCellulesX; x++) {
        if (casesTouchees[x][y]==true) {
          nbTouchees++;
        } else {
          nbPasTouchees++;
        }
      }
    }

    float ratio=nbTouchees/(nbTouchees+nbPasTouchees);
    return ratio;
  }
}

void mousePressed() {
  background(0);
  int xTrace=(int)(mouseX/5);
  int yTrace=(int)(mouseY/5);
  if(caTourne)println(xTrace, yTrace);
  

  creeCellules(traces[xTrace][yTrace].nbCellulesX, traces[xTrace][yTrace].nbCellulesY);
  for (int y=0; y<traces[xTrace][yTrace].nbCellulesY; y++) {
    for (int x=0; x<traces[xTrace][yTrace].nbCellulesX; x++) {
      if (traces[xTrace][yTrace].casesTouchees[x][y]==true) {
        cellules[x][y].couleur=color(0, 0, 0);
      } else {
        cellules[x][y].couleur=color(180, 0, 0);
      }
    }
  }
  dessineCellules(traces[xTrace][yTrace].nbCellulesX, traces[xTrace][yTrace].nbCellulesY);
 
  if(caTourne){
    caTourne=false;
    noLoop();
  }
  else{
    loop();
    caTourne=true;
  }
}