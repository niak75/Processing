color couleur;
int r=3;
boolean caTourne = true;

void setup(){
  size(700,700);
}

void mouseReleased(){
  if(caTourne) {
    caTourne=false;
    noLoop();
  }
  else{
    caTourne = true;
    loop();
  }
  //println(mouseX+"  "+mouseY+"  "+r);
  println(mouseX*mouseY*mouseY);
}

void draw() {
  r=r*2;
  for(int y=0 ; y<height ; y++){
    for(int x=0 ; x<width ; x++){
      couleur=color(determineCouleur(x,y,r));
      set(x,y,couleur);
    }
  }
}

int determineCouleur(int x,int y, int r){
  int i=0;
  int n = x*y*y;
  while(i<100){
    if(n%2==0){
      n=n/2;
    }
    else{
      n=3*n+1;
    }
    if(n==1){
      break;
    }
    i=i+1;
  }
  if(n==0) n=1;
  return i/n;
}