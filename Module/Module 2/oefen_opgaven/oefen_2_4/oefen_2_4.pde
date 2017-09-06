color white = color(255, 255, 255);
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);

int rectX = 20;
int rectY = 20;
int rectWidth = constrain(width, 400, width);
int rectHeight = rectWidth / 2;

int pivotX = width / 2;
int pivotY = height / 2;

void setup() {
  size(500, 500);
  
  fill(white);
  rect(rectX, rectY, rectWidth, rectHeight);
  
  noStroke();
  fill(blue);
  rect(rectX + 1, rectY + 1, rectWidth / 2, rectHeight / 2);
  rect((rectWidth /2) + rectX, (rectHeight /2) + rectY, rectWidth / 2, rectHeight / 2);
  
  fill(green);
  rect((rectWidth / 2) + rectX, rectY + 1, rectWidth / 2, rectHeight / 2);
  rect(rectX + 1, (rectHeight / 2) + rectY, rectWidth / 2, rectHeight / 2);
  
  stroke(red);
  line((rectWidth / 2) + rectX, rectY, (rectWidth / 2) + rectX, rectHeight + rectY);
  line(rectX, (rectHeight / 2) + rectY, rectWidth + rectX, (rectHeight / 2) + rectY);
}