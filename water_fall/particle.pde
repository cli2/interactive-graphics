class Particle {
  PVector pos, vel, acc;
  float ms;
  color dispColor;
  float fallRate;
  
  Particle (float x, float y, float mass, color displayColor) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dispColor = displayColor;
    ms = mass;
    //println(ms);
    fallRate = map(ms, 0, pMaxMass, 0.1, 0.05);
    //println(fallRate);
    
  }
  
  float[] getBoundingBox() {
    float radius = ms/2;
    float offset = 2; // Just to expand its bb a bit.
    float[] boxVal = new float[4]; 
    boxVal[0] = pos.x-radius-offset;
    boxVal[1] = pos.y-radius-offset;
    boxVal[2] = pos.x+radius+offset;
    boxVal[3] = pos.y+radius+offset;
    
    return boxVal;
  }
  void display() {
    fill(dispColor);
    if (ms>=4.5){
      ellipse(pos.x, pos.y, ms, ms);
      if (ms<9){
      fill(255);
      ellipse(pos.x, pos.y, 2, 2);
    }
    }
    
  }
  
  void move() {
    PVector gravity = new PVector(0, fallRate);
    acc.add(gravity);
    if(abs(vel.x)>20){vel.x=0;}
    vel.add(acc);
    if(abs(vel.x)>20){println(vel.x);}
    pos.add(vel);
    acc.mult(0);
  }
  
  boolean resolveCollisions() {
    boolean hit_object = false;
    
    float[] bb1 = getBoundingBox();
    
    for (int c = 0; c < collisions.size(); c++) {
      Collision col = collisions.get(c);
      
      float[] bb2 = col.getBoundingBox();
      
      // First check bounding box to optimize checks.
      boolean is_close_enough = do_aabb_collision(bb1[0], bb1[1], bb1[2], bb1[3], 
                                              bb2[0], bb2[1], bb2[2], bb2[3]);
      
      if (is_close_enough) {
        float distance = dist(pos.x, pos.y, col.pos.x, col.pos.y);
        //println("change");
        if (distance < col.ms/2) {
          // Push out of collision object.
          PVector offset = pos.copy();
          offset.sub(col.pos);
          offset.normalize();
          offset.mult(col.ms/2-distance);
          pos.add(offset);
          
          //println(offset);
 
          float friction = 2;//variable
          float dampening = map(ms, pMinMass, pMaxMass, 1, 0.8);
          if(dampening <0){println(dampening);}
          float mag = vel.mag();

          // Get its new vector.
          PVector bounce = pos.copy();
          bounce.sub(col.pos);
          //if(bounce.y <0){bounce.y = 0;}
          
          //if(abs(bounce.x)>10){bounce.x=bounce.x/4;}
          //if(abs(bounce.x)>10){bounce.x=bounce.x/4;}
          //if(abs(bounce.x)>10){bounce.x=0;}
          bounce.normalize();
          bounce.mult(mag*friction*dampening);
          
          vel = bounce;

          if (ms > 2) {
            ms = max(1, ms-2);

            float splitCount = 6; //variable

            for (int s = 0; s < splitCount; s++) {
              ms = max(1, ms-1);
              color displayColor = color(red(dispColor),green(dispColor),blue(dispColor),ms/pMaxMass*200);
              if (ms>=6.9){
                water.play();
              }
              Particle splash = new Particle(pos.x, pos.y, ms, displayColor);
              //println(ms);
              splash.vel = vel.copy();
              
              splash.vel.rotate(radians(random(-45, 45)));
              splash.vel.mult(random(0.1, 0.2));
              
              particles.add(splash);
            }
          }
          
          hit_object = true;
          
          break;
        }
      }
    }
    
    return hit_object;
  }
  
  
}