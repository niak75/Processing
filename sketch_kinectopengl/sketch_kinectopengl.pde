// Thomas Sanchez Lengeling
// openGL Point Cloud Example.

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import java.nio.*;
import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// Kinect Library object
Kinect kinect;

// Angle for rotation
float a = 0;

//openGL
PGL pgl;
PShader sh;

int  vertLoc;
int  colorLoc;

//VBO buffer location in the GPU
int vertexVboId;
int colorVboId;

void setup() {
  // Rendering in P3D
  size(800, 600, P3D);
  kinect = new Kinect(this);
  kinect.initDepth();
  
  
  //load shaders
  sh = loadShader("frag.glsl", "vert.glsl");
}

void draw() {

  background(0);
  
  image(kinect.getDepthImage(), 0, 0, 320, 240);

  pushMatrix();
  translate(width/2, height/2, 50);
  scale(150);
  rotateY(a);

  pgl = beginPGL();
  
   // allocate buffer big enough to get all VBO ids back
  IntBuffer intBuffer = IntBuffer.allocate(2);
  pgl.genBuffers(2, intBuffer);

  //memory location of the VBO
  vertexVboId = intBuffer.get(0);
  colorVboId = intBuffer.get(1);
  
  
  sh.bind();
  
  FloatBuffer depthPositions =  kinect.getDephToWorldPositions();
  
  
  int vertData = kinect.width * kinect.height;

  vertLoc  = pgl.getAttribLocation(sh.glProgram, "vertex");
  
  //color for each POINT of the point cloud
  sh.set("fragColor", 1.0f, 1.0f, 1.0f, 1.0f);

  pgl.enableVertexAttribArray(vertLoc);



{
    pgl.bindBuffer(PGL.ARRAY_BUFFER, vertexVboId);
    // fill VBO with data
    pgl.bufferData(PGL.ARRAY_BUFFER, Float.BYTES * vertData, depthPositions, PGL.DYNAMIC_DRAW);
    // associate currently bound VBO with shader attribute
    pgl.vertexAttribPointer(vertLoc, 3, PGL.FLOAT, false, Float.BYTES * 3, 0);
  }
  
  //pgl.vertexAttribPointer(vertLoc, 3, PGL.FLOAT, false, 0, depthPositions);

  //draw the XYZ depth camera points
  pgl.drawArrays(PGL.POINTS, 0, vertData);

  //clean up the vertex buffers
  pgl.disableVertexAttribArray(vertLoc);

  sh.unbind();
  endPGL();

  popMatrix();
  
  fill(255, 0, 0);
  text(frameRate, 50, 50);

  // Rotate
 // a += 0.015f;
}