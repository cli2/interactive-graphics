PImage [] images = new PImage[6];
PImage collage;
PImage back;
void setup(){
  size(800,800);
  frameRate(10);
  images[0] = loadImage("n1.jpg");
  images[1] = loadImage("n2.jpg");
  images[2] = loadImage("n3.jpg");
  images[3] = loadImage("f1.jpg");
  images[4] = loadImage("f2.jpg");
  images[5] = loadImage("f3.jpg");
  collage = loadImage("collage.png");
}
int i = 0;
void draw(){
  back = images[i];
  image(back,0,0);
  image(collage,0,0);
}

void mouseMoved() {
  i = int(random(images.length));
  image(images[i],0,0);
}