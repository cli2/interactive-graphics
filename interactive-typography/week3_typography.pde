PFont font;
color blue,grey,orange,purple,red,pink,green;
void setup(){
  size(800,800);
  font = loadFont("Ubuntu-Medium-200.vlw");
  textFont(font);
  colorMode(RGB);
  blue = color(63,169,245,130);
  grey = color(189,204,212,130);
  orange = color(255,147,30,130);
  purple = color(102,45,145,130);
  red = color(255,29,37,130);
  pink = color(255,0,230,130);
  green = color(0,104,55,130);
}

void draw(){
  background(255);
  int x = mouseX;
  int y = mouseY;
  //is there a way to change text color
  
  //size 450
  textSize(450);
  if (x>400 && y<400){fill(orange);}
  else if (x<400 && y>400){fill(green);}
  else{fill(grey);}
  text("R",-14+150,140+570);
  
  //size 200
  textSize(200);
  fill(orange); 
  text("M", -14+200, 140+80);//orange
  if (x<400 && y<400){
    fill(blue);
    text("E", -14+240, 140+300);
  }
  else {text("E", -14+240, 140+300);}
  
  fill(blue); 
  text("D", -14+70, 140+250);//blue
  if (x<400 && y>400){fill(green);}
  text("E", -14+660, 140+300);
  fill(blue);
  
  //size 250
  textSize(250);
  if (x>400 && y>400){fill(pink);text("G", -14+450, 140+270);}
  else if (x<400 && y>400){fill(green);text("G", -14+450, 140+270);}
  else{fill(blue);text("G", -14+450, 140+270);}
  
  
  //size 80
  textSize(80);
  fill(blue);
  text("S", -14+360, 140+260);
  if (x>400 && y<400){fill(orange);text("K", -14+260, 140+140);}
  else{fill(purple); }
  
  text("K", -14+260, 140+140);//purple
  fill(orange);
  if (x>400 && y<400){fill(blue);text("P", 180, 470);}
  else if(x<400 && y>400){fill(green);text("P", 180, 470);}
  else {text("P", 180, 470);}
  //orange
  fill(pink);
  text("C", 240,570);//pink
  text("H", 280,570);
  fill(red);
  text("L",390,280);//red
  
  //size 70
  textSize(70);
  fill(green);
  text("M",570,480);//green
  
  //size 100
  textSize(100);
  text("R",480,580);
  text("A",510,580);
  if (x<400 && y<400){
    fill(blue);
  }
  text("R",680,315);
  fill(red);
  if (x>400 && y<400){fill(orange);}
  else{fill(red);}
  text("A",240,200);//red
  fill(red);
  if (x<400 && y<400){
    fill(blue);
    text("I",400,380);}
    else {text("I",400,380);};
  
  
  //size 150
  textSize(150);
  fill(pink);
  text("O",370,500);//pink
  if (x<400 && y<400){fill(blue);}
  text("N",550,400);
}