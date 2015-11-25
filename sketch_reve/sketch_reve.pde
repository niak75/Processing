String[] message={"Le ", "futur ", "appartient ", "à ", "ceux ", "qui ", "croient ", "en ", "la ", "beauté ", "de ", "leurs ", "rêves"};
mots[] mots=new mots[13];
float x;
float y;

boolean vent=false;

float directionVentX;
float directionVentY;

PFont police;

void setup() {
  size(700, 700);
  background(0);
}

void draw() {
  background(mouseX*(255/(float)width));
  textAlign(RIGHT, BASELINE);
  x=20;
  y=300;
  police = loadFont("Monaco-48.vlw");
  textFont(police, 48);
  if (frameCount==1) {
    for (int i=0; i<13; i++) {
      //message[i].length()


      x+=message[i].length()*28;
      if (x>width) {
        x=20+message[i].length()*28;
        y+=50;
      }

      //text(message[i], x, y);
      mots[i]= new mots(x, y, message[i]);
    }
  }
  for(int i=0 ; i<13;i++){
    mots[i].dessine();
  }
  
  if(vent){
    for(int i=0 ; i<13;i++){
      mots[i].x+=mots[i].vitesseX;
      mots[i].y+=mots[i].vitesseY;
    }
  }
}

void mousePressed(){
  vent=true;
}