float r=1;

void setup() {
  size(700, 700);
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

int determineCouleur(int x, int y){
  if(y==0)y=1;
  if(x==0)x=1;
  int i=0;
  int a=x;
  int b=y;
  while(){
  
  }
  return i;
}