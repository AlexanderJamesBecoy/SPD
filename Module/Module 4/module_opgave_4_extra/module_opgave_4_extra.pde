import cc.arduino.*;
import org.firmata.*;

import processing.serial.*;


// Module Opgave - 4 Extra
// Alexander James Becoy
// 18-9-2017

/*======================
    Global scopes
======================*/
int redTimer = 500,
    greenTimer = 750,
    blueTimer = 1000;

color red = #ff0000,
      green = #00ff00,
      blue = #0000ff;


/*======================
      setup()
======================*/
void setup() {
  size(800, 400);
  

}

/*======================
      draw()
======================*/
void draw() {
  background(0);
  
  drawLamp(width / 3, red);
}

/*======================
    mousePressed()
======================*/


/*======================
  Custom functions()
======================*/
void drawLamp(int xPos, color colorLamp) {
  fill(colorLamp);
  tint(0, 0, 0, 1);
  ellipse(xPos, height / 4, height / 4, height / 4);
}