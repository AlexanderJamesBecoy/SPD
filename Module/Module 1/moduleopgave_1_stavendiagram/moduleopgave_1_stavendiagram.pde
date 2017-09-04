// Moduleopgave 1
// Alexander James Becoy
// 4-09-2017


// Staven (deze waardes kunnen veranderen)
float staafA = 20.0;
float staafB = 190.0;
float staafC = 150.0;

// hieronder komt jouw code

// Kleuren voor iedere staaf
color kleurA = color(0, 0, 255);
color kleurB = color(0, 255, 0);
color kleurC = color(255, 0, 0);

// x-coordinaten
int xA = ((width / 7) * 2);
int xB = ((width / 7) * 4);
int xC = ((width / 7) * 6);

void setup() {
  
  size(500, 200);
  
  background(0);
  noStroke();
  
  drawBar(xA, kleurA, staafA);
  drawBar(xB, kleurB, staafB);
  drawBar(xC, kleurC, staafC);

}

// Een functie om staven te maken
void drawBar(int x, color c, float l) {
  fill(c);
  rect(x, height, width / 7, -l);
}