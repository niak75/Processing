float[] positionsX = new float[30]; 
float[] positionsY = new float[30]; 
int nbClics = 0;

void setup() {
  size(700,700);
  strokeWeight(2);
}

void mouseReleased() {
  positionsX[nbClics] = mouseX;
  positionsY[nbClics] = mouseY;
  nbClics = nbClics+1;
}

void draw() {
  frameRate(1);
  fill(0,0,0,1);
  rect(0,0,width,height);
  for(int i=0 ; i<nbClics ; i=i+1) {
    //Il passe 4 fois
    for(int n=i ; n<nbClics ; n=n+1) {
      float rouge = random(225);
      float vert = random(225);
      float bleu = random(225);

      stroke(rouge,vert,bleu);
      line(positionsX[i],positionsY[i],positionsX[n],positionsY[n]);
    }
  }
}