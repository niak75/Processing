float r=1;

void setup() {
  size(displayWidth,displayHeight);
}

void draw() {
  for (int y = -height/2; y < height/2; y++) {
    for (int x = -width/2; x < width/2; x++) {
      color couleur=color(determineCouleur(x,y),determineCouleur(x,y),determineCouleur(x,y));
      stroke(couleur);
      set(x+width/2,y+height/2,couleur);
    }
  }
  r+=1;
}

float determineCouleur(int x, int y){
  if(y==0)y=1;
  if(x==0)x=1;
  int i=0;
  float a=0;
  //int b=y;
  while(a<2550 && i<255){
    a+=Math.sqrt(abs((x*a-y*y)/7000.0));
    i++;
  }
  return a/10.0;
}