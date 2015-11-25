class mots{
  float x;
  float y;
  float direction;
  float rotation;
  float vitesseX;
  float vitesseY;
  String mot;
  
  mots(float newX, float newY, String newMot){
    x=newX;
    y=newY;
    mot=newMot;
    direction=0;
    vitesseX=(random(10)-5)*2;
    vitesseY=(random(10)-5)*2;
    rotation=random(5)-2.5;
  }
  
  void dessine(){
    rotate(radians(direction));
    text(mot,x,y);
    rotate(-radians(direction));
  }
}