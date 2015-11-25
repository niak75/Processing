float distance=0;

import peasy.*;

PeasyCam cam;

void setup(){
  size(700,700,P3D);
  noStroke();
  background(0);
  
   cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(10000);
}

void draw(){
  distance=0;
  frameRate(1000);
  for(int i=0;i<500;i++){
  rotate(radians(i)/5);
  translate(0,distance*i/10,distance);
  fill(255);
  sphere(3);
  distance+=0.1;
  }
}

void mouseReleased(){
  background(0);
}