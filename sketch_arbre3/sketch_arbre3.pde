float taille = 150;
float angle = 0;

boolean incrementationAngle = true;

void setup() {
  size(700,700);
  strokeWeight(0.3);
}

void mousePressed() {
  incrementationAngle = !incrementationAngle;
}

void draw() {
  background(0);
  stroke(255);
  translate(width/2,height);
  stroke(150,100,40);
  line(0,0,0,-taille);
  translate(0,-taille);
  if(incrementationAngle) {
  angle = angle+mouseY/100;
  }
  branche(taille);
}

void branche(float taille) {
  taille *= 0.7;
  if(taille>2) {
    if(taille>10) {
      stroke(150,100,40);
    }
    else {
      stroke(255,0,255);
    }
    pushMatrix();
    rotate(-radians(angle));
    line(0,0,0,-taille);
    translate(0,-taille);
    branche(taille);
    popMatrix();
    
    if(taille>10) {
      stroke(150,100,40);
    }
    else {
      stroke(255,0,255);
    }
    pushMatrix();
    rotate(radians(angle));
    line(0,0,0,-taille);
    translate(0,-taille);
    branche(taille);
    popMatrix();
  }
}