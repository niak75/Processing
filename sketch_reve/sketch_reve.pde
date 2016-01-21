import ddf.minim.*;

Minim minim;

String[] message1={"Les ", "rêves ", "sont ", "les ", "clés ", "pour ", "sortir ", "de ", "nous ", "même"};
mots[] mots=new mots[13];
float x;
float y;
int nbMots1=10;
float luminosite=255;
int etape=1;
boolean vent=false;
PFont police;

String[] message2={"Mais ", "où ", "se ", "situe ", "la ", "frontière ", "entre ", "les ", "deux ", "?"};
int nbMots2=10;
float tailleEcriture=1;
int nbSerpents=50;
float tailleSerpents=40;
serpent[] serpents=new serpent[nbSerpents];
serpent mySerpent1 = new serpent(350, 350, 0, 0, 0, 255);
serpent mySerpent2 = new serpent(350, 350, 0, 255, 255, 0);

//Déclaration d'une variable contenant le nombre de balles
int nbreBalle = 80;

float tailleBalle =5;

float vitesseEloignement = 20; //Vitesse des balles quand elles ne vont pas vers la souris
float vitesseRapprochement = 0.01; //Vitesse des balles pour se rapprocher vers la souris

boolean destinationExiste = false;

//Déclaration d'une liste d'instances de l'objet Balle
Balle[] balles = new Balle[nbreBalle];

float n=0;

float angle=0;
float[] coins = new float[700*700*700];
float coinX;
float coinY;

void setup() {
  minim = new Minim(this);
  
  size(displayWidth, displayHeight);
  background(0);

  for (int i = 0; i < nbreBalle; i++) {
    balles[i] = new Balle(); // Création de toutes les balles
  }
}

void draw() {
  if (etape==1) {
    fill(0, 0, 0, 60);
    rect(0, 0, width, height);
    textAlign(RIGHT, BASELINE);
    x=20;
    y=350;
    police = loadFont("Monaco-48.vlw");
    textFont(police, 45);
    if (frameCount==1 && vent==false) {
      for (int i=0; i<nbMots1; i++) {
        //message1[i].length()


        x+=message1[i].length()*26;
        if (x>width) {
          x=20+message1[i].length()*28;
          y+=50;
        }
        mots[i]= new mots(x, y, message1[i]);
      }
    }

    float tailleCercle = random(100);
    fill(0, 0, mouseY/(255/luminosite)/3);
    ellipse(random(width), random(height), tailleCercle, tailleCercle);

    fill(luminosite);
    for (int i=0; i<nbMots1; i++) {
      mots[i].dessine();
    }

    if (vent) {
      for (int i=0; i<nbMots1; i++) {
        mots[i].x+=mots[i].vitesseX;
        mots[i].y+=mots[i].vitesseY;
        luminosite-=0.1;
      }
    }
    if (luminosite<0) {
      etape=2;
      frameCount=0;
    }
  }


  if (etape==2) {
    frameRate(20);
    if (frameCount==0) {
      for (int i = 0; i < nbSerpents; i++) {
        serpents[i] = new serpent(350, 350, 0, 255, 255, 255);
      }
    }
    textAlign(RIGHT, BASELINE);
    x=20;
    y=100;
    police = loadFont("Monaco-48.vlw");
    textFont(police, 45*tailleEcriture);

    if (frameCount==0)luminosite=0;
    for (int i=0; i<nbMots2; i++) {
      x+=message2[i].length()*27*tailleEcriture;
      if (x>width) {
        x=20+message2[i].length()*28*tailleEcriture;
        y+=48*tailleEcriture;
      }
      mots[i]= new mots(x, y, message2[i]);
    }
    for (int i=0; i<nbMots2; i++) {
      fill(luminosite);
      mots[i].dessine();
    }
    luminosite++;

    fill(0, 0, 0, 60);
    stroke(0);
    rect(0, 0, width, height);
    strokeWeight(20);
    mySerpent1.avance();
    mySerpent2.avance();
    strokeWeight(2);
    for (int i = 0; i < nbSerpents; i++) {
      serpents[i].avance();
    }
  }
  if (etape==3) {
    frameRate(30); // Vitesse d'execution du programme
    fill(0, 0, 0, 20); 
    rect(0, 0, width, height); //On dessine un fond transparent pour que les balles s'effacent petit à petit
    noStroke(); //Dessins plus beaux

    for (int i = 0; i < nbreBalle; i++) {
      balles[i].bouge(); //Mouvement de la balle
      balles[i].display(); //Affichage de la balle
    }
  }


  if (etape==4) {

    n+=0.2;
    noStroke();
    fill(0, 0, 0, n);
    ellipse(width/2, height/2, n*20%width*2, n*20%width*2);
    if (n>50) {
      etape=5;
      n=1;
    }
  }

  if (etape==5) {
    textAlign(CENTER, BASELINE);
    textFont(police, 48);
    if (n<255) {
      n+=n/50;
      background(n);
      fill(0, 0, 0, 255-n);
      text("Mais une chose est sûre...", width/2, height/2);
    } else {
      n+=0.5;
      background(600-n);
      fill(255, 255, 255, 400-n/1.5);
      text("La vraie liberté se trouve dans les rêves", width/2, height/2);
    }
    if (n>600) {
      etape=6;
      n=0;
    }
  }

  if (etape==6) {
    n+=1;
    frameRate(60);
    noFill();
    strokeWeight(3);
    angle=(angle+0.1)%90;
    translate(width/2, height/2);
    double taille=10;
    for (int i=0; i<100; i++) {
      stroke(0, i/2, 0, i/5);
      rect(-(float)taille/2, -(float)taille/2, (float)taille, (float)taille);

      rotate(radians(angle));
      taille=taille*(Math.cos(radians(angle))+Math.sin(radians(angle)));
    }
    if (n==90*10)noLoop();
  }
}

void mousePressed() {
  if (etape==1) {
    vent=true;
    frameCount=0;
  }
  if (etape==3) {

    for (int i = 0; i < nbreBalle; i++) {
      balles[i].calculeDistances();
    }
    destinationExiste = true;
    tailleBalle+=tailleBalle/2;
    if (tailleBalle>150)etape=4;
  }
  if (etape==2) {
    tailleSerpents-=2.5; 
    tailleEcriture+=0.12;
    if (tailleEcriture>3) {
      etape=3;
    }
  }
}


void stop() {
  minim.stop();
  super.stop();
}