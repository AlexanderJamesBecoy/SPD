// Moduleopgave 1
// <naam>
// <datum>


// Staven (deze waardes kunnen veranderen)
float staafA = 20.0;
float staafB = 190.0;
float staafC = 150.0;

// hieronder komt jouw code
color a = color(0, 0, 255);
color b = color(0, 255, 0);
color c = color(255, 0, 0);

void setup() {
  
  size(500, 200);
  
  background(0);
  noStroke();

}

void draw() {
  
  drawRect(100, 200, a, -staafA);
  
}

void drawRect(int x, int y, color c, float l) {
  fill(c);
  rect(x, y, 100, -l);
}