void setup(){
  size(800,600);
}
void draw(){
  background(0);
  smooth();
  float angle = 0.0;
  //float scaleVal = 60.0/1.5;
  float scaleVal = (mouseX/7.6)/1.5;
  float i = 4;
  println(i);
  float angleInc = PI/i;
  float w = 75/1.5;
  fill(255);
  for (int y=0; y<= height+w; y+=w){
    stroke(130);
    strokeWeight(2);
    line(0,y,800,y);
  }
  
  for (int offset = 0; offset<width+w; offset +=w*2){
    angle = 0.0;
    //noStroke();
    for (int y=0; y<= height; y+=w){
      float x = offset + (sin(angle)*scaleVal);
      rect(x,y,w,w);
      angle += angleInc;
    }
  }
  if (mousePressed){
    background(0);
    float x = 0;
    float y = 0;
    stroke(130);
    strokeWeight(2);
    //noStroke();
    float scl = w*(abs(x-mouseX)/width*1+0.15);
    float count = 0;
    for (x=0; x<width; x+=scl){
      scl = w*(abs(x-mouseX)/width*1.4+0.15);
      if (scl>w){scl=w;}
      if (count%2==0){
        for (y = 0; y<height; y+=w*2){
        fill(255);
        rect(x,y,scl,w);
      }
      } else {
        for (y = w; y<height; y+=w*2){
        fill(255);
        rect(x,y,scl,w);
      }
      }
      count ++;
    }
  }
}