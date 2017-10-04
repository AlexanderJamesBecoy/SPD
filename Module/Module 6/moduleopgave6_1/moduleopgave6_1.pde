// Module opgave 6 deel 1
// Alexander James Becoy
// 2-10-17

PImage jongen;
PImage meisje;

int margin = 10;
int imageWidth = 28;
int imageHeight = 48;

void setup() {
  size(500, 500);
  
  jongen = loadImage("jongetje.png");
  meisje = loadImage("meisje.png");

  loopFamily(8, 10);
}