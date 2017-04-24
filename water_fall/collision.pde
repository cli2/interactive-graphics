// Repulses particles from itself.
class Collision {
  PVector pos;
  PVector target;
  float ms;
  float targetMass;
  
  Collision (float x, float y, float mass) {
    pos = new PVector(x, y);
    ms = mass;
    targetMass = mass;
  }
  
  float[] getBoundingBox(){
    float radius = ms/2;
    float offset = 2; // Just to expand its bb a bit.
    float[] boxVal = new float[4]; 
    boxVal[0] = pos.x-radius-offset;
    boxVal[1] = pos.y-radius-offset;
    boxVal[2] = pos.x+radius+offset;
    boxVal[3] = pos.y+radius+offset;
    
    return boxVal;
  }
  
  // Avoids using stroke otherwise it overlaps the particles.
  void display() {
    noStroke();
    fill(255,50);
    ellipse(pos.x, pos.y, ms, ms);
    fill(0,200);
    ellipse(pos.x, pos.y, ms*0.8, ms*0.8);
  }
}