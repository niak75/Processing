//23070;21443
//24000;12230

/*
PImage montagne;
montagne = loadImage("IMG_0426.jpg");
image(montagne,700,700);*/

int nbBranche = 9;
float taille=0.5;
int nbFlocons=15;

flocon[] listeDesFlocons = new flocon[nbFlocons];

void setup(){
  for(int i=0 ; i<nbFlocons ; i++){
    int h = (int) Math.ceil(random(height));
    listeDesFlocons[i] = new flocon(h);
    println(h);
  }  
  strokeWeight(2.5);
  stroke(36,237,225);
  size(700,700);
}

void draw(){
  translate(0,height);
  rotate(radians(-90));
  fill(0);
  background(255,255,255,5);
  for(int i=0 ; i<nbFlocons ; i++){
    listeDesFlocons[i].dessineFlocon();
    listeDesFlocons[i].determineHauteur();
  }
}



class flocon{
  int currentVitesseX;
  int x;
  int destinationX;
  int y;
  int n;
  float tailleFlocon;
  
  flocon(int nouvY){
    x = (int) Math.ceil(random(100,width-100));
    destinationX = x;
    y = nouvY;
    n = y;
    tailleFlocon=0.5;
  }
  
  void dessineFlocon(){
    translate(y,x);
    for(int branche=0 ; branche<nbBranche ; branche++){
      line(0,0,tailleFlocon*100,0);
      translate(tailleFlocon*60,0);
      rotate(radians(-30));
      for(int i=0 ; i<3 ; i++){
        line(0,0,tailleFlocon*40,0);
        rotate(radians(30));
      }
      rotate(-radians(60));
      translate(tailleFlocon*-60,0);
      rotate(radians(360/nbBranche));
    }
    translate(-y,-x);
  }

  void determineHauteur(){
    if(n==y){
      if(n%2==0) {
        n=n/2;
      }
      else{
        n=3*n+1;
      }
    }
    else if(y<n){
      y++;
    }
    else{
      y--;
    }
    
    if(x<destinationX+3 && x>destinationX-3){
      destinationX = (int) Math.ceil(random(100,width-100));
      currentVitesseX = (int) Math.ceil(random(2,4));
    }
    else if(x<destinationX){
      x += currentVitesseX;
    }
    else{
      x -= currentVitesseX;
    }
    
    if(n==1){
      y = (int) Math.ceil(random(height));
      n=y;
    }
  }
}