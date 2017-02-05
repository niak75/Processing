int nbPoints=30000;
Point[] points=new Point[nbPoints];

void setup() {
  size(2000, 2000);
  background(0);
  noStroke();
  fill(255, 255, 15  );

  for (int i=0; i<nbPoints; i++) {
    points[i]=new Point(random(width), random(height));
  }
}

void draw() {
  for (int i=0; i<nbPoints; i++) {
    points[i].deplace();
    points[i].affiche();
  }
}

class Point {
  float x;
  float y;

  int destinationX;
  int destinationY;

  float vectX;
  float vectY;

  boolean dessine=true;

  Point(float nouvX, float nouvY) {
    x=nouvX;
    y=nouvY;

    destinationX=(int)nouvX;
    destinationY=(int)nouvY;
  }

  void deplace() {
    x+=vectX;
    y+=vectY;

    if (pointEstArriveADestination()) {
      determineDestination();
    }
  }

  void determineDestination() {
    if ((destinationY%2==0 && destinationX%2==0) || (destinationY%2!=0 && destinationX%2!=0)) {
      dessine=false;
    } else {
      dessine=true;
    }

    if (destinationX%2==0) {
      destinationX=destinationX/2;
    } else {
      destinationX=3*destinationX+1;
    }

    if (destinationY%2==0) {
      destinationY=destinationY/2;
    } else {
      destinationY=3*destinationY+1;
    }

    float distX=destinationX-x;
    float distY=destinationY-y;

    float distTotale=(float)Math.sqrt(distX*distX+distY*distY);

    vectX=(destinationX-x)/distTotale;
    vectY=(destinationY-y)/distTotale;
  }

  void affiche() {
    if (dessine) {
    ellipse(x, y, 3, 3);
    }
  }

  boolean pointEstArriveADestination() {
    float distX=destinationX-x;
    float distY=destinationY-y;

    float distTotale=(float)Math.sqrt(distX*distX+distY*distY);

    if (distTotale<2) {
      return true;
    } else {
      return false;
    }
  }
}

int signe(float x) {
  if (x>=0) {
    return 1;
  } else {
    return -1;
  }
}