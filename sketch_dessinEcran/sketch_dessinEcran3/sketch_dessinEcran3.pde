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
  x=abs(x);
  float i=1;
  double a=1;
  double b=1;
  while(a<255 && i<255){
    a+=Math.sqrt(log(abs((float)((x-b)*(y-a)/(i*i)))));
    b+=Math.sqrt(Math.sqrt(abs((float)(y*y-i*a))));
    i++;
  }
  return (float)a;
}