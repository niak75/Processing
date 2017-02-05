int nbTraits=200;
float ecart=0.1;
float[] pointsX=new float[nbTraits];
float[] pointsY=new float[nbTraits];


void setup() {
  size(displayWidth, displayHeight);
  strokeWeight(2);
  frameRate(10);

  for (int i=0; i<nbTraits; i++) {
    pointsX[i]=width/2;
    pointsY[i]=height/2;
  }
}

void draw() {
  background(255);
  float modifX=0;
  float modifY=0;
  for (int n=0; n<nbTraits; n++) {
    modifX+=random(ecart)-ecart/2;
    modifY+=random(ecart)-ecart/2;
    for (int i=0; i<n; i++) {
      pointsX[i]+=modifX-(pointsX[i]-width/2)/30000;
      pointsY[i]+=modifY-(pointsY[i]-height/2)/30000;;
    }
    if (n!=nbTraits-1) {
      line(pointsX[n], pointsY[n], pointsX[n+1], pointsY[n+1]);
    }
  }
}