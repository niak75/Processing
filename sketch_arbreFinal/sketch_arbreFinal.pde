float taille = 150;
float angle = 0;
int angleMax = 75;

PImage photo;


boolean incrementationAngle = true;

void setup() {
  photo = loadImage("montagne.jpeg");
  size(853,707);
  strokeWeight(1.2);
}

void mousePressed() {
  incrementationAngle = !incrementationAngle;
  loop();
}

void mouseReleased() {
  noLoop();
}

void draw() {
  image(photo,0,0,853,707);
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
  taille *= 0.77;
  if(taille>2) {
    if(taille>10) {
      stroke(150,100,40);
    }
    else {
      stroke(255,0,255);
    }
    pushMatrix();
    rotate(radians(random(angleMax)));
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
    rotate(-radians(random(angleMax)));
    line(0,0,0,-taille);
    translate(0,-taille);
    branche(taille);
    popMatrix();
  }
}