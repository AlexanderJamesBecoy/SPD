// Module Opgave - 4 Extra
// Alexander James Becoy
// 18-9-2017

/*======================
    Global scopes
======================*/   
float margin = 20.0;
float rectHeight;

color red = #ff0000,
      green = #00ff00,
      blue = #0000ff,
      gray = #999999,
      gold = #dfe399,
      black = #000000;
      
color darkRed = #770000,
      darkGreen = #007700,
      darkBlue = #000077;
      
boolean powerOn = false,
        lampAan = false;
int maxTimer = 1000,
    timer;

/*======================
      setup()
======================*/
void setup() {
  size(800, 400);
  
  rectHeight = (height - (2 * margin)) / 4;
}

/*======================
      draw()
======================*/
void draw() {
  background(0);
  
  drawLamp(width / 4, height / 3, height / 3, red);
  drawLamp(width / 2, height / 3, height / 3, green);
  drawLamp(width / 4 * 3, height / 3, height / 3, blue);
  
  if(powerOn) {
    drawPower("Zet uit");
  } else {
    drawPower("Zet Aan");
  }
  
  timer++;
}

/*======================
    mousePressed()
======================*/
void mousePressed() {
  
  if(mouseX > margin && mouseX < width - margin) {
    if(mouseY > height - rectHeight && mouseY < height - margin) {
      powerOn = !powerOn;
    }
  }
  
}

/*======================
  Custom functions()
======================*/
void drawLamp(float xPos, float yPos, float diameter, color colorLamp) {
  fill(gray);
  rectMode(CENTER);
  rect(xPos, yPos + diameter / 2, diameter / 2, diameter);
  if(!powerOn) {
    switch(colorLamp) {
      case #ff0000:
        colorLamp = darkRed;
        break;
      case #00ff00:
        colorLamp = darkGreen;
        break;
      case #0000ff:
        colorLamp = darkBlue;
        break;
      default:
        break;
    }
  } else {
     
  }
  fill(colorLamp);
  ellipse(xPos, yPos, diameter, diameter);
}

void drawPower(String stringPower) {
  fill(gold);
  rectMode(LEFT);
  rect(margin, height - rectHeight, width - margin, height - margin);
  fill(black);
  textSize(20);
  textAlign(CENTER);
  text(stringPower, width / 2, height - (rectHeight / 2));
}