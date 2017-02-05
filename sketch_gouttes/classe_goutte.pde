class Goutte{
  float x;
  float y;
  float rayon;
  color couleur;
  
  int nbForces=nbObstacles+1;
  Force[] forces=new Force[nbForces];
  Force trajectoire=new Force(0,0);
  
  
  Goutte(float nouvX, float nouvY, float nouvRayon){
    x=nouvX;
    y=nouvY;
    rayon=nouvRayon;
    couleur=color(0,random(150),random(150)+105);
  }
  
  
  void affiche(){
    fill(couleur);
    ellipse(x,y,2*rayon,2*rayon);
  }
  
  
  void determineLesForces(){
    //forces[0] est la gravite et les autres sont celles provoquees par le contact des obstacles
    float valeurGravite=9.81-agitationEau/14+random(agitationEau/7.0);
    forces[0]=new Force(0,valeurGravite);
    
    for(int i=0 ; i<nbObstacles ; i++){
      if(obstacles[i].estEnContactAvec(this)){
        forces[i+1]=obstacles[i].forceRebond(this);
      }
      else{
        forces[i+1]=new Force(0,0);
      }
    }
  }
  
  
  void calculeTrajectoire(){ //On additionne les forces pour trouver la trajectoire
    float resultanteX=0;
    float resultanteY=0;
    
    for(int i=0 ; i<nbForces ; i++){
      resultanteX+=forces[i].decalageX;
      resultanteY+=forces[i].decalageY;
    }
    
    trajectoire=new Force(resultanteX+trajectoire.decalageX,resultanteY+trajectoire.decalageY);
  }
  
  void bouge(){ //On deplace la goutte et on divise pour qu elle n aille pas trop vite
    x+=trajectoire.decalageX/500.0;
    y+=trajectoire.decalageY/500.0;
  }
}