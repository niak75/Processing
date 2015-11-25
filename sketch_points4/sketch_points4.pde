float x;
float y;
float distance=2.5;
int nbTache=1000;
int[] currentTache = new int[nbTache];

tache[] taches = new tache[nbTache];

int[] luminositePixel = new int[1260*800];

void setup() {
  size(1280, 760);
  background(0);

  for (int i = 0; i < nbTache; i++) {
    taches[i] = new tache(20+(int)random(width-40), 20+(int)random(height-40));
  }
}

void mouseReleased() {
  noStroke();
  background(0);
  for(int y=0 ; y<height ; y++){
    for(int x=0 ; x<width ; x++){
      int luminosite=luminositePixel[y*width+x]*8;
      int diametreEllipse=((luminositePixel[y*width+x]+3)*(luminositePixel[y*width+x]+3))/(frameCount/300+1);
      fill(luminosite,0,0,luminosite);
      ellipse(x,y,diametreEllipse,diametreEllipse);
    }
  }
  noLoop();
}

void draw() {
  for (int i = 0; i < nbTache; i++) {
    taches[i].placeUnPoint();
  }
}

class tache {
  float x;
  float y;
  color couleur;

  tache(int nouvX, int nouvY) {
    x=nouvX;
    y=nouvY;
    couleur=color(80+random(175), 80+random(175), 80+random(175), 25);
  }

  void placeUnPoint() {
    stroke(couleur);
    point((int)x, (int)y);
    
    if((int)((int)y*width+x)>0 && (int)((int)y*width+x)<width*height) {
      luminositePixel[(int)((int)y*width+x)]+=1;
    }
    
    x=x+random(distance);
    if (Math.random()<0.5)x=x-2*random(distance);

    y=y+random(distance);
    if (Math.random()<0.5)y=y-2*random(distance);
  }
}




/*if (frameCount%300==0) {
    println("ok");
    beginShape();
    stroke(255,255,255,30);
    fill(0,0,0,0);
    for(int i = 0; i < nbTache; i++){
      //currentTache[i]=(int)taches[i].y*width+(int)taches[i].x;
      vertex((int)taches[i].x,(int)taches[i].y);
    }
    endShape(CLOSE);
  }*/