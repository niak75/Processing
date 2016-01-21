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
  noStroke();
  background(0);
  frameCount=0;
  fill(255);
  if (random(1)>0.5) {
    if (mouseX>width/2) {
      reponse=true;
      total++;
      fill(0, 255, 0);
    } else {
      reponse = false;
      total--;
      fill(255, 0, 0);
    }
    ellipse(width/4+width/2,height/2,100,100);
  } 
  
  else {
    if (mouseX<width/2) {
      reponse=true;
      total++;
      fill(0, 255, 0);
    } else {
      total--;
      reponse = false;
      fill(255, 0, 0);
    }
    ellipse(width/4,height/2,100,100);
  }
 
}