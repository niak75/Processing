//23070;21443
//24000;12230
int nbBranche=9;
float taille=0.5;
int n=25;

int nbFlocons=2;

flocon[] listeDesFlocons = new flocon[nbFlocons];

void mouseReleased(){
}

void setup(){
  for(int i=0 ; i<nbFlocons ; i++){
    int h = (int) Math.ceil(random(height)+0.0001 );
    listeDesFlocons[i] = new flocon(h);
  }  
  strokeWeight(2);
  stroke(36,237,225);
  size(700,700);
}

void draw(){
  translate(0,height);
  fill(0);
  frameRate(3);
  //background(255,255,255,5);
  for(int i=0 ; i<nbFlocons ; i++){
    listeDesFlocons[i].dessineFlocon();
    listeDesFlocons[i].determineHauteur();
  }
}



class flocon{
  
  int x;
  int y;
  float tailleFlocon;
  
  flocon(int nouvY){
    x = (int) Math.ceil(random(width));
    y = nouvY;
    tailleFlocon=0.5;
  }
  
  void dessineFlocon(){
    translate(x,-y);
    rotate(radians(-90));
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
  }

  void determineHauteur(){
    if(y%2==0) {
      y=y/2;
    }
    else{
      y=3*y+1;
    }
  }
}