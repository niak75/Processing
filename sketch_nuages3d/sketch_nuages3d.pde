
import peasy.*;

PeasyCam cam;
float distance=6;
int nbNuage=100;


nuage[] nuages = new nuage[nbNuage];



void setup() {
  size(1280, 760, P3D);
  background(0);

  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(10000);



  for (int i = 0; i < nbNuage; i++) {
    nuages[i] = new nuage(20+(int)random(width-40), 20+(int)random(height-40), 20+(int)random(1000-40));
  }

  
}


void draw() {
background(0);

  
   for (int i = 0; i < nbNuage; i++) {
     nuages[i].ajoutepoint();
    nuages[i].dessine();
      }

}

class nuage {

  color couleur;

  int nbpoints =2000;
  float[] x= new float[nbpoints];
  float[] y= new float[nbpoints];
  float[] z= new float[nbpoints];
int k=1;

  nuage(int nouvX, int nouvY, int nouvZ) {
    x[0]=nouvX;
    y[0]=nouvY;
    z[0]=nouvZ;
    couleur=color(80+random(175), 80+random(175), 80+random(175), 200);


 /*   for (int k=1; k<nbpoints; k++) {
      x[k]=x[k-1]+random(distance);
      if (Math.random()<0.5)x[k]=x[k]-2*random(distance);

      y[k]=y[k-1]+random(distance);
      if (Math.random()<0.5)y[k]=y[k]-2*random(distance);

      z[k]=z[k-1]+random(distance);
      if (Math.random()<0.5)z[k]=z[k]-2*random(distance);
    }
  */
  }

  void ajoutepoint () {
    if (k<nbpoints){
     x[k]=x[k-1]+random(distance);
      if (Math.random()<0.5)x[k]=x[k]-2*random(distance);

      y[k]=y[k-1]+random(distance);
      if (Math.random()<0.5)y[k]=y[k]-2*random(distance);

      z[k]=z[k-1]+random(distance);
      if (Math.random()<0.5)z[k]=z[k]-2*random(distance); 
      
      k=k+1;
    }
    
  }
  void dessine() {

    stroke(couleur);
    for (int k=0; k<nbpoints; k++) {
      pushMatrix();

      translate((int)x[k], (int)y[k], (int)z[k]);
      // Draw a point
      point(0, 0);

      popMatrix();
    }
    
  }
}