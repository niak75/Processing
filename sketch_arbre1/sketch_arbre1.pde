float theta;   

int i=0;
int n=0;

float posY = 100;
float posX = width/2;

void setup() {
  size(1280, 720);
}

void draw() {
  fill(0,0,0,6);
  rect(0,0,width,height);
  if(n<500){
    n=n+1;
    posY = posY+1.2;
  }
  else{
    posY=posY-0.5;
  }
  if(i<400){
    i = i+1;
    posX=posX+2;
  }
  else{
    posX=posX-1;
  }
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (posX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-120*(posY / (float) height)*2);
  // Move to the end of that line
  translate(0,-120*(posY / (float) height)*2);
  // Start the recursive branching!
  branch(120);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.7;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h*(posY / (float) height)*2);  // Draw the branch
    translate(0, -h*(posY / (float) height)*2); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h*(posY / (float) height)*2);
    translate(0, -h*(posY / (float) height)*2);
    branch(h);
    popMatrix();
  }
}