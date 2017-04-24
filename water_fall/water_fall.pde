import processing.video.*;
import processing.sound.*;

float pMinMass = 8;
float pMaxMass = 12;
float cMinMass = 15;
float cMaxMass = 100;
int numCollision = 5;

float waterfallMin;
float waterfallMax;

Capture video;

color trackColor;
float threshold = 5;
float distThreshold = 100;


ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Collision> collisions = new ArrayList<Collision>();
ArrayList<Blob> blobs = new ArrayList<Blob>();

SoundFile water;

void setup() {
  //size(960,600);
  fullScreen();
  background(0);
  waterfallMin = width/80;
  waterfallMax = width-waterfallMin;
  
  water = new SoundFile(this, "water.wav");
  
  // Create collision objects.
  video = new Capture(this, width,height,30);
  video.start();
  trackColor = color(255, 0, 0);
}

void captureEvent(Capture video) {
  video.read();
}

void keyPressed() {
  if (key == 'a') {
    distThreshold++;
  } else if (key == 'z') {
    distThreshold--;
  }
  println(distThreshold);
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}

void draw() {
  int spawnCount = 2;
  video.loadPixels();
  image(video, 0, 0);
  if (frameCount>200){
    //background(0);
  }
  
  blobs.clear();
  collisions.clear();
  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d = distSq(r1, g1, b1, r2, g2, b2); 

      if (d < threshold*threshold) {

        boolean found = false;
        for (Blob b : blobs) {
          if (b.isNear(x, y)) {
            b.add(x, y);
            found = true;
            break;
          }
        }

        if (!found) {
          Blob b = new Blob(x, y);
          blobs.add(b);
        }
      }
    }
  }
  
  println(blobs.size());

  for (Blob b : blobs) {
    if (b.size() > 500) {
      b.show();
    }
  }
  for (int i = 0; i < collisions.size(); i++) {
    collisions.get(i).ms = map(mouseX, 0,width, 40,80);
    collisions.get(i).display();
  }
  // Spawn new particles.
  for (int num = 0; num < spawnCount; num++) {
    float x = random(waterfallMin, waterfallMax);
    float mass = random(pMinMass, pMaxMass);
    color displayColor;
    displayColor = color(random(100, 210), random(100, 210), random(100, 210),100);
    Particle newParticle = new Particle(x, 0, mass, displayColor);
    particles.add(newParticle);
  }
  
  for (int i = particles.size()-1; i > -1; i--) {
    particles.get(i).move();
    boolean has_collision = particles.get(i).resolveCollisions();
    //println(has_collision);
    particles.get(i).display();
    if (particles.get(i).pos.y > height) {
      // Delete if it's out of bounds.
      particles.remove(i);
      //println("true");
    } else if(particles.get(i).pos.x < 0 || particles.get(i).pos.x > width){
      particles.remove(i);
      //println("true");
    }else if (has_collision && particles.get(i).vel.mag() < 0.1) {
      // Delete if it's stuck on top of a collision object.
      particles.remove(i);
      //println("true");
    }
    //println(particles.size());
  }
}

boolean do_aabb_collision(float ax, float ay, float Ax, float Ay, float bx, float by, float Bx, float By) {
  return ! ((Ax < bx) || (Bx < ax) || (Ay < by) || (By < ay));
}



float distSq(float x1, float y1, float x2, float y2){
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
  return d;
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2){
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1);
  return d;
}