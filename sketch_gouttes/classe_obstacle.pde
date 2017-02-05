class Obstacle{
  float inclinaison=1.0;
  
  float centreX;
  float centreY;
  
  float x1;
  float x2;
  float y1;
  float y2;
  
  float[][] coordonnees=new float[4][2];
    
  Obstacle(float nouvx1,float nouvy1,float nouvx2,float nouvy2){
    x1=nouvx1;
    x2=nouvx2;
    y1=nouvy1;
    y2=nouvy2;
    
    coordonnees[0][0]=x1;
    coordonnees[0][1]=y1;
    
    coordonnees[1][0]=x2;
    coordonnees[1][1]=y1;
    
    coordonnees[2][0]=x2;
    coordonnees[2][1]=y2;
    
    coordonnees[3][0]=x1;
    coordonnees[3][1]=y2;
    
    centreX=(x1+x2)/2.0;
    centreY=(y1+y2)/2.0;
}
  
  void afficher(){
    pushMatrix();
    translate(centreX,centreY);
    rotate(inclinaison);
    translate(-centreX,-centreY);

    fill(0);
    rect(x1,y1,x2-x1,y2-y1);
    
    popMatrix();
    
    fill(255,0,0);
    
    // Voir les coins :
    for(int i=0 ; i<4 ; i++){
      ellipse(coins()[i][0],coins()[i][1],10,10);
    }
  }
  
  
  boolean estEnContactAvec(Goutte goutte){
    if(goutte.x+goutte.rayon>x1 && goutte.x-goutte.rayon<x2 && goutte.y+goutte.rayon>y1 && goutte.y-goutte.rayon<y2){
      return true;
    }
    else{
      return false;
    }
  }
  
  
  Force forceRebond(Goutte goutte){ //On regarde sur quelle face la goutte rebondit et on donne la force qu elle prend
    boolean contactFaceSuperieure=false;
    boolean contactFaceInferieure=false;
    boolean contactFaceDroite=false;
    boolean contactFaceGauche=false;
    
    int nbContacts=0; //Pour savoir si la goutte touche l obstacle a plusieurs endroits
    
    if(goutte.y<y1){
      nbContacts++;
      contactFaceSuperieure=true;
    }
    if(goutte.y>y2){
      nbContacts++;
      contactFaceInferieure=true;
    }
    if(goutte.x<x1){
      nbContacts++;
      contactFaceGauche=true;
    }
    if(goutte.x>x2){
      nbContacts++;
      contactFaceDroite=true;
    }
    
    if(nbContacts>1){ //Touche un coin
      goutte.couleur= color(255,0,0);
      //println("2 contacts !",contactFaceSuperieure,contactFaceInferieure,contactFaceGauche,contactFaceDroite);
      //noLoop();
    }
    
    if(contactFaceSuperieure){
      goutte.y=y1-goutte.rayon-random(agitationEau);
      return new Force(0,-goutte.trajectoire.decalageY*(1+facteurRestitution));
    }
    else if(contactFaceInferieure){
      goutte.y=y2+goutte.rayon;
      return new Force(0,-goutte.trajectoire.decalageY*(1+facteurRestitution));
    }
    else if(contactFaceGauche){
      goutte.x=x1-goutte.rayon;
      return new Force(-goutte.trajectoire.decalageX*(1+facteurRestitution),0);
    }
    else if(contactFaceDroite){
      goutte.x=x2+goutte.rayon;
      return new Force(-goutte.trajectoire.decalageX*(1+facteurRestitution),0);
    }
    else{
      return new Force(0,0);
    }
  }
  
  
  
  float [][] coins(){ //Les coordonnes [nbCoin][x ou y] de chaque coin apres rotation
    float[][] coinsListe=new float[4][2]; 
    for(int i=0 ; i<8 ; i++){
      coinsListe[i/2][i%2]=faisTournerUnPoint(coordonnees[i/2][0],coordonnees[i/2][1],centreX,centreY,inclinaison)[i%2];
    }
    return coinsListe;
  }
}





/*

float obstacleCentreX=(2*xDebut+xLongueur)/2.0;
    float obstacleCentreY=(2*yDebut+yLongueur)/2.0;
    float distanceGoutteObstacle= (float)Math.sqrt((obstacleCentreX-goutte.x)*(obstacleCentreX-goutte.x)+(obstacleCentreY-goutte.y)*(obstacleCentreY-goutte.y));
    float angle=-acos((obstacleCentreY-goutte.y)/distanceGoutteObstacle)-inclinaison-PI;
        
    float xIncline=obstacleCentreX+sin(angle)*distanceGoutteObstacle;
    float yIncline=obstacleCentreY+cos(angle)*distanceGoutteObstacle;
    //float yIncline=goutte.y;
    
    fill(goutte.couleur);
    ellipse(xIncline,yIncline,10,10);

    
    //if(goutte.x+goutte.rayon>xDebut && goutte.x-goutte.rayon<xDebut+xLongueur && goutte.y+goutte.rayon>yDebut && goutte.y-goutte.rayon<yLongueur+yDebut){
    if(xIncline+goutte.rayon>xDebut && xIncline-goutte.rayon<xDebut+xLongueur && yIncline+goutte.rayon>yDebut && yIncline-goutte.rayon<yLongueur+yDebut){
      return true;
    }
    else{
      return false;
    }
    */