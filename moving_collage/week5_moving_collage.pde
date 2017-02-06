color [] colorarray = new color[5]; 
int i=0; boolean show=false; float x1=0,x2=0,x3=0; float s1=2,s2=4,s3=7; float r1=0;
PShape ppl1, ghost, ghost2, cloud1, ghost1, ppl, mechanical;
PImage cloud, cloud2, flower,head, brain, flower2, flower3, skeleton, mask, eye,head1,skeleton1,skeleton2,horse; 
PImage brain2, cloud22,cloud23,head12,cloud12,eye1,eye2;
float angle = 0, speed = 0.3, d_ellipse = 70;
int directionX=1, directionY=-1;
float speedX = 20,speedY = 20,x=0,y=0;
void setup(){
  size(1000,800);
  smooth();
  colorarray[0]=color(214,213,218);
  colorarray[1]=color(239,92,110);
  colorarray[2]=color(63,79,94);
  colorarray[3]=color(144,167,208);
  colorarray[4]=color(189,206,190);
  ppl1=loadShape("ppl-1.svg"); ghost=loadShape("ghost.svg"); ghost2=loadShape("ghost-2.svg");
  cloud1=loadShape("cloud-1.svg"); ghost1=loadShape("ghost-1.svg"); ppl=loadShape("ppl.svg"); 
  mechanical = loadShape("mechanical.svg"); cloud = loadImage("cloud.png"); cloud2 = loadImage("cloud-2.png");
  flower = loadImage("flower.png"); head = loadImage("head.png"); brain = loadImage("brain.png"); 
  flower2 = loadImage("flower-2.png"); flower3 = loadImage("flower-3.png"); skeleton = loadImage("skeleton.png");
  mask = loadImage("mask.png"); eye = loadImage("eye.png"); head1 = loadImage("head-1.png");
  skeleton1 = loadImage("skeleton-1.png"); skeleton2 = loadImage("skeleton-2.png"); horse = loadImage("horse.png");
  cloud22= loadImage("cloud-2.png");brain2 = loadImage("brain.png");cloud23= loadImage("cloud-2.png");head12=loadImage("head-1.png");
  cloud12 = loadImage("cloud.png");eye1 = loadImage("eye.png");eye2 = loadImage("eye.png");
  imageMode(CENTER);
  shapeMode(CENTER);
  ghost1.scale(0.5);
}

void draw(){
  background(colorarray[i]);
  pushMatrix();
  translate(0, height/2);
  //tint(255,75);
  imagePlace(cloud2,457,342,x1+300,-120,75,r1);
  imagePlace(cloud,425,283,x1-370,-380,75,0);
  imagePlace(cloud22,564,423,x1-800,20,150,0);
  tint(255,60);
  brain2.resize(458,361);image(brain2,x1-150,300);
  cloud23.resize(564,423);image(cloud23, x1+1100,120);
  head12.resize(408,545);image(head12,x1+900, 400);
  // second speed
  noTint();
  brain.resize(266,210);image(brain,x2+600,-90);
  cloud12.resize(243,162);image(cloud12,x2-80,320);
  eye.resize(94,72);image(eye,x2+700,100);
  eye1.resize(94,72);image(eye1,x2+1000,-350);
  eye2.resize(295,227);image(eye2,x2+1400,180);
  flower2.resize(240,220);image(flower2,x2+730,340);
  flower3.resize(180,247);image(flower3,x2+1450,-200);
  flower.resize(153,150);image(flower,x2-750,-100);
  head1.resize(200,265);image(head1,x2+350,-200);
  head.resize(102,122);image(head,x2-600,-120);
  horse.resize(423,325);image(horse,x2+1000,-10);
  mask.resize(211,201);image(mask,x2+790,-280);
  skeleton1.resize(236,305);image(skeleton1,x2-150,-180);
  skeleton2.resize(191,255);image(skeleton2,x2-430,-100);
  skeleton.resize(268,182);image(skeleton,x2+100,-75);
  // third speed
  shape(cloud1,x3+600,-380);
  shape(mechanical,x2+150,180);
  shape(ppl1,x3-450,170);
  shape(ppl,x3-600,280);
  popMatrix();
  // motion
  x1=x1+s1;
  x2=x2+s2;
  x3=x3+s3;
  r1=r1+0.1;
  if (x1>1600){x1=-1600;}
  if (x2>1600){x2=-1600;}
  if (x3>1600){x3=-1600;}
  if (keyPressed){
    i=i+1;
    if (i>4){i=0;}
  }
  if (mousePressed){
    show = !show;
  }
  if (show) {
    noStroke();
    pushMatrix();
    translate(100,300);
    breathingCircle(255,255,0,150,angle,20,x,y);
    breathingCircle(255,0,255,150,angle+QUARTER_PI,10,x,y);
    breathingCircle(0,255,255,150,angle+HALF_PI,25,x,y);
    breathingCircle(255,255,255,150,angle+PI/3,5,x,y);
    angle += speed;
    popMatrix();
    x+=speedX*directionX*random(-1,1);
    if ((x>width/2)||(x<0)){
      directionX = -directionX;
    }
    y +=speedY*directionY*random(-0.5,1);
    if ((y>height/2)||(y<0)){
      directionY = -directionY;
    }
    pushMatrix();
    translate(400,700);
    breathingCircle(255,0,0,150,angle,15,x,y);
    breathingCircle(255,255,255,150,angle+QUARTER_PI,15,x,y);
    breathingCircle(0,255,0,150,angle+HALF_PI,15,x,y);
    breathingCircle(255,0,255,150,angle+PI/3,15,x,y);
    angle += speed;
    popMatrix();
    x+=speedX*directionX*random(-1,1.5);
    if ((x>width/2)||(x<0)){
      directionX = -directionX;
    }
    y +=speedY*directionY*random(-1.5,1);
    if ((y>height/2)||(y<0)){
      directionY = -directionY;
    }
    pushMatrix();
    translate(800,100);
    breathingCircle(255,0,0,150,angle,15,x,y);
    breathingCircle(255,255,255,150,angle+QUARTER_PI,15,x,y);
    breathingCircle(0,255,0,150,angle+HALF_PI,15,x,y);
    breathingCircle(255,0,255,150,angle+PI/3,15,x,y);
    angle += speed;
    popMatrix();
    x+=speedX*directionX*random(-1,1);
    if ((x>width/2)||(x<0)){
      directionX = -directionX;
    }
    y +=speedY*directionY*random(-1,1);
    if ((y>height/2)||(y<0)){
      directionY = -directionY;
    }
    pushMatrix();
    translate(500,60);
    breathingCircle(255,0,0,150,angle,40,x,y);
    breathingCircle(255,255,255,150,angle+QUARTER_PI,40,x,y);
    breathingCircle(0,255,0,150,angle+HALF_PI,40,x,y);
    breathingCircle(255,0,255,150,angle+PI/3,40,x,y);
    angle += speed;
    popMatrix();
    x+=speedX*directionX*random(-1,0.5);
    if ((x>width/2)||(x<0)){
      directionX = -directionX;
    }
    y +=speedY*directionY*random(-0.5,1);
    if ((y>height/2)||(y<0)){
      directionY = -directionY;
    }
    if ((x<-width/2) || (x>width/2)){x=0;}
    if ((y<-height/2) || (y>height/2)){y=0;}
  }
}

void breathingCircle(int r, int g, int b, int a, float angle, int s,float x, float y){
  fill(r,g,b,a);
  float d1=d_ellipse +(sin(angle)*s);
  ellipse(x,y,d1,d1);
}
void imagePlace(PImage i, int sizeX, int sizeY, float pX, float pY, float t, float r){
  tint(255,t);
  i.resize(sizeX,sizeY);
  pushMatrix();
  translate(pX,pY);
  rotate(r);
  image(i,0,0);
  popMatrix();
}
void svgPlace(PShape i, float pX, float pY, float t,float r){
  tint(255,t);
  pushMatrix();
  translate(pX,pY);
  rotate(r);
  shape(i,0,0);
  popMatrix();
}
void objPlace(PShape i, float pX, float pY, float t){
  tint(255,t);
  pushMatrix();
  translate(pX,pY);
  shape(i,0,0);
  popMatrix();
}