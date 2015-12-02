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

void setup() {
  size(1280, 760);
  background(0);
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

    if(frameCount==0)luminosite=0;
    for (int i=0; i<nbMots2; i++) {
      x+=message2[i].length()*28*tailleEcriture;
      if (x>width) {
        x=20+message2[i].length()*28*tailleEcriture;
        y+=50*tailleEcriture;
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
}

void mousePressed() {
  if (etape==1) {
    vent=true;
    frameCount=0;
  }
  if (etape==2) {
    tailleSerpents-=2.5; 
    tailleEcriture+=0.12;
  }
}