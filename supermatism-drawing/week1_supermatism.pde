import processing.pdf.*;
void setup(){
  size(400,400,PDF, "filename.pdf");
}
void draw(){
  background(245,246,241);
  noStroke();
  smooth();
  translate(-10,4);
  fill(26,44,120);
  ellipse(170,290,70,70);
  fill(46,91,60);
  ellipse(280,350,40,40);
  fill(207,72,52);
  ellipse(220,260,10,10);
  fill(251,190,65);
  ellipse(360,160,220,220);
  
  pushMatrix();
  rotate(radians(25));
  translate(45,-70);
  fill(49,103,69);
  rect(40,60,120,70);
  popMatrix();
  
  pushMatrix();
  translate(240,210);
  rotate(radians(60));
  fill(207,72,52);
  triangle(0,0,-60,240,60,240);
  popMatrix();
  
  pushMatrix();
  translate(140,120);
  rotate(radians(17));
  float h = 280;
  float w = 18;
  float x = 0;
  for (int i=1; i<7; i++){
    fill(0,0,0);
    if (i==3 || i==4){
      fill(110,133,122);
      x = x + 8;
    }
    if (i==5 || i==6){
      fill(207,72,52);
      x = x - 10;
    }
    rect(x,-h/2, w,h);
    h = h*0.65;
    x = x + 40;
  } 
  rotate(radians(9));
  fill(0,0,0);
  rect(-40,-30,330,-4);
  popMatrix();
  
  pushMatrix();
  translate(300,0);
  rotate(radians(75));
  fill(26,44,120);
  rect(-10,0,160,6);
  popMatrix();
  
  // draw runs forever
  println("Finished.");
  exit();
}