  /**
 * Gravitational Attraction (3D) 
 * by Daniel Shiffman.  
 *
 * Adapted for dome projection by Andres Colubri
 * 
 * Simulating gravitational attraction 
 * G ---> universal gravitational constant
 * m1 --> mass of object #1
 * m2 --> mass of object #2
 * d ---> distance between objects
 * F = (G*m1*m2)/(d*d)
 *
 * For the basics of working with PVector, see
 * http://processing.org/learning/pvector/
 * as well as examples in Topics/Vectors/
 * 
 */

import codeanticode.planetarium.*;

// A bunch of planets
Planet[] planets = new Planet[10];
// One sun (note sun is not attracted to planets (violation of Newton's 3rd Law)
Sun s;

// An angle to rotate around the scene
float angle = 0;

void setup() {
  size(600, 600, Dome.RENDERER);
  smooth();
  // Some random planets
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(random(0.1, 2), random(-width/2, width/2), random(-height/2, height/2), random(-100, 100));
  }
  // A single sun
  s = new Sun();
}

void pre() {
  for (int i = 0; i < planets.length; i++) {
    // Sun attracts Planets
    PVector force = s.attract(planets[i]);
    planets[i].applyForce(force);
    // Update and draw Planets
    planets[i].update();
  }  
}

void draw() {
  background(0);  
  // Setup the scene
  lights();
  
  // Important: there is no need to translate to (width/2, height/2) because
  // the dome projection is already centered at (0, 0). Some (negative) displacement
  // is needed though, otherwise the objects will be too close to the dome's equatorial
  // plane. The z axis points towards the bottom of the dome.
  //translate(0, 0, -200);
  translate(width/2, height/2);
  
  rotateY(angle);

  // Display the Sun
  s.display();

  // All the Planets
  for (int i = 0; i < planets.length; i++) {
    planets[i].display();
  }
}

void post() {
  // Rotate around the scene
  angle += 0.003;
}  