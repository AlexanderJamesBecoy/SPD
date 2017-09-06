// Oefenopgaven 2.1 en 2.2
// Alexander James Becoy
// 6 september 2017

color white = color(255, 255, 255),
      red = color(255, 0, 0),
      green = color(0, 255, 0),
      blue = color(0, 0, 255),
      black = color(0);

int rectX = 20,
    rectY = 20,
    rectWidth = 401,
    rectHeight = rectWidth / 2;

void setup() {
  size(500, 500);
  
  if(rectWidth % 2 != 0) {
    rectWidth -= 1;
  }
  if(rectHeight % 2 != 0) {
    rectHeight -= 1;
  }
  
  stroke(black);
  noFill();
  rect(rectX, rectY, rectWidth, rectHeight);
  
  noStroke();
  fill(blue);
  rect(rectX + 1, rectY + 1, rectWidth / 2, rectHeight / 2);
  rect((rectWidth /2) + rectX, (rectHeight /2) + rectY, rectWidth / 2, rectHeight / 2);
  
  fill(green);
  rect((rectWidth / 2) + rectX, rectY + 1, rectWidth / 2, rectHeight / 2);
  rect(rectX + 1, (rectHeight / 2) + rectY, rectWidth / 2, rectHeight / 2);
  
  stroke(red);
  println((rectWidth + rectX) / 2);
  line((rectWidth / 2) + rectX, rectY, (rectWidth / 2) + rectX, rectHeight + rectY);
  line(rectX, (rectHeight / 2) + rectY, rectWidth + rectX, (rectHeight / 2) + rectY);
}