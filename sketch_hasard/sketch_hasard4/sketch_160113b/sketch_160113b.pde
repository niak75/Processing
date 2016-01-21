boolean reponse;
int total = 0;

void setup() {
  size(displayWidth, displayHeight);
  background(0);
}

void draw(){
  if(frameCount>100)background(0);
  stroke(255,255,255,255);
  line(width/2,0,width/2,height);
  
   textSize(40);
  textAlign(BASELINE,DOWN);
  fill(total*-255,total*255,255-abs(total)*255);
  text(total,width/2+20,40);
  
}

void mousePressed() { 
  float x;
  
  noStroke();
  background(0);
  frameCount=0;
  fill(255);
  if(bonneReponse()) {
    total++;
    fill(0,255,0);
    x = (mouseX>width/2) ? 3 * width / 4 : width / 4;
  } else {
    total--;
    fill(255,0,0);
    x = (mouseX<width/2) ? 3 * width / 4 : width / 4;
  }
  ellipse(x, height/2, 200, 200);
  
  
 
}

boolean bonneReponse(){
  float hasard=random(1);
  if((mouseX<width/2 && hasard<0.5) || (mouseX>width/2 && hasard>0.5)){
    return true;
  }
  else{
    return false;
  }
}