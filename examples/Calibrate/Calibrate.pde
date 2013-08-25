import codeanticode.planetarium.*;

DomeCamera camera;
float cubeX, cubeY;
boolean grid = false;

void setup() {
  // For the time being, only use square windows  
  size(600, 600, Dome.RENDERER);
  camera = new DomeCamera(this);
}

// Called one time per frame.
void pre() {
  cubeX += (mouseX - cubeX) * 0.2;
  cubeY += (mouseY - cubeY) * 0.2;
}

// Called five times per frame.
void draw() {
  int face = camera.getFace();
  if (face == DomeCamera.POSITIVE_X) {
    background(255, 0, 0);
  } else if (face == DomeCamera.NEGATIVE_X) {
    background(255, 0, 0);
  } else if (face == DomeCamera.POSITIVE_Y) {
    background(0, 255, 0);
  } else if (face == DomeCamera.NEGATIVE_Y) {
    background(0, 255, 0);
  } else if (face == DomeCamera.POSITIVE_Z) {
    background(0, 0, 255);
  } else if (face == DomeCamera.NEGATIVE_Z) {
    background(0, 0, 255);
  }
  
  pushMatrix();  
  translate(0, 0, 200); // Z is now pointing towards the screen
  
  stroke(0);  
  fill(255, 200, 50);
  pushMatrix();
  translate(width * 0.5 - cubeX, cubeY - height * 0.2, 0);
  box(20);
  popMatrix();

  stroke(255);
  int linesAmount = 10;
  for (int i = 0; i < linesAmount;i++) {
    float ratio = (float)i/(linesAmount-1);
    line(0, 0, cos(ratio*TWO_PI) * 50, sin(ratio*TWO_PI) * 50);
  }
  
  popMatrix();
}

void keyPressed() {
  grid = !grid;
  if (grid) camera.setMode(Dome.GRID);
  else camera.setMode(Dome.NORMAL);  
}