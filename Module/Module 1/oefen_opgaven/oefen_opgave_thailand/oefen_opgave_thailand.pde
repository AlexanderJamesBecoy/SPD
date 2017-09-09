int hoogte = 200;
int breedte = hoogte * 2;

int flagX = 20;
int flagY = 20;

color red = color(250, 0, 0);
color white =  color(255, 255, 255);
color blue = color(0, 0, 150);

void setup() {
  size(500, 500);
  
  noStroke();
  fill(red);
  rect(flagX, flagY, breedte, hoogte);
  
  fill(white);
  rect(flagX, (hoogte / 6) + flagY, breedte, (hoogte / 3) * 2);
  
  fill(blue);
  rect(flagX, (hoogte / 3) + flagY, breedte, hoogte / 3);
  
}