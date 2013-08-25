import codeanticode.planetarium.*;

PVector mouseP;
PVector mousePos;
float mouseSpeed = .2f;
float globalX = 0;
float globalZ = 0;
float destGlobalX = 0;
float destGlobalZ = 200;

void setup() {
  size(600, 600, Dome.RENDERER);
  mousePos = new PVector(width*.5f, height*.5f, 0); 
}

void pre() {
  println("at pre");
  
  // main position
  globalX += (destGlobalX - globalX) * .25;
  globalZ += (destGlobalZ - globalZ) * .25;
   
  if (mousePressed) destGlobalZ += 3;

  mousePos.x += (mouseX - mousePos.x) * mouseSpeed;
  mousePos.y += (mouseY - mousePos.y) * mouseSpeed;
  mouseP = new PVector(width*.5f - mousePos.x, 
                       height*.5f - (height - mousePos.y), 0);    
        
}

void draw() {
  background(0);
  stroke(0);

  pushMatrix();  
  translate(globalX, 0, globalZ);
    
  // cursorBox
  fill(255, 200, 50);
  pushMatrix();
  translate(mouseP.x, mouseP.y, mouseP.z);
  box(20);
  popMatrix();

  // some test lines
  stroke(255);
  int linesAmount = 20;
  for (int i=0;i<linesAmount;i++) {
    float ratio = (float)i/(linesAmount-1);
    line(0, 0, cos(ratio*TWO_PI) * 600, sin(ratio*TWO_PI) * 600);
  }
  popMatrix();
}