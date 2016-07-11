int nbCellulesParCote=30;

Cellule[][] listeDeCellules = new Cellule[nbCellulesParCote][nbCellulesParCote];

void setup() {
  size(700, 700);
  donneVieAuxCellules(nbCellulesParCote);
  frameRate(10);
}

void draw() {
  for (int y=0; y<nbCellulesParCote; y++) {
    for (int x=0; x<nbCellulesParCote; x++) {
      listeDeCellules[x][y].dessine(nbCellulesParCote);
    }
  }
  for (int y=0; y<nbCellulesParCote; y++) {
    for (int x=0; x<nbCellulesParCote; x++) {
      listeDeCellules[x][y].evolutionCellule();
    }
  }
  print(listeDeCellules[1][1].calculeLeNombreDeVoisines());
}

void donneVieAuxCellules(int nbCellulesParCote) {
  for (int y=0; y<nbCellulesParCote; y++) {
    for (int x=0; x<nbCellulesParCote; x++) {
      listeDeCellules[x][y] = new Cellule(x, y);
    }
  }
}

class Cellule {
  int couleur=0;
  int x;
  int y;

  boolean vivante=false;
  boolean vivanteAuProchainTour=false;

  Cellule(int nouvX, int nouvY) {
    
    x = nouvX;
    y = nouvY;
    if (Math.random()>0.5) {
      vivanteAuProchainTour=true;
    }
  }

  void dessine(int nbCellulesParCote) {
    if(vivante!=vivanteAuProchainTour){
      couleur+=1;
    }
    vivante=vivanteAuProchainTour;
    if (vivante) {
      fill(couleur,0,0);
      stroke(couleur,0,0);
    } else {
      fill(255);
      stroke(255);
    }
    rect(x*width/nbCellulesParCote, y*height/nbCellulesParCote, width/nbCellulesParCote, height/nbCellulesParCote);
  }

  int calculeLeNombreDeVoisines() {
    int nbVoisines = 0;
    if (listeDeCellules[(nbCellulesParCote+x-1)%nbCellulesParCote][(nbCellulesParCote+y-1)%nbCellulesParCote].vivante==true)nbVoisines+=1;
    if (listeDeCellules[x][(nbCellulesParCote+y-1)%nbCellulesParCote].vivante==true)nbVoisines+=1;
    if (listeDeCellules[(nbCellulesParCote+x+1)%nbCellulesParCote][(nbCellulesParCote+y-1)%nbCellulesParCote].vivante==true)nbVoisines+=1;

    if (listeDeCellules[(nbCellulesParCote+x-1)%nbCellulesParCote][y].vivante==true)nbVoisines+=1;
    if (listeDeCellules[(nbCellulesParCote+x+1)%nbCellulesParCote][y].vivante==true)nbVoisines+=1;

    if (listeDeCellules[(nbCellulesParCote+x-1)%nbCellulesParCote][(nbCellulesParCote+y+1)%nbCellulesParCote].vivante==true)nbVoisines+=1;
    if (listeDeCellules[x][(nbCellulesParCote+y+1)%nbCellulesParCote].vivante==true)nbVoisines+=1;
    if (listeDeCellules[(nbCellulesParCote+x+1)%nbCellulesParCote][(nbCellulesParCote+y+1)%nbCellulesParCote].vivante==true)nbVoisines+=1;
    return nbVoisines;
  }

  void evolutionCellule() {
    if (this.calculeLeNombreDeVoisines()==3) {
      vivanteAuProchainTour=true;
    }
    if (this.calculeLeNombreDeVoisines()<2 || this.calculeLeNombreDeVoisines()>3) {
      vivanteAuProchainTour=false;
    }
  }
}