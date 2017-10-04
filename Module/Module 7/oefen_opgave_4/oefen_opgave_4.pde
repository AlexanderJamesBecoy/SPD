// Een array van int[6][2] met coördinaten van cirkels
int[][] cirkels = {
  {10, 15},
  {100, 130},
  {77, 43},
  {30, 145},
  {185, 17},
  {99, 76}
};
final int DIAMETER = 20;
final int GEEL = #FFFF00;
final int ROOD = #FF0000;

void setup() {
  size(200, 200);
  ellipseMode(CENTER);
}

void draw() {
  background(#000000);
  tekenCirkels(cirkels);
}

//Hieronder jouw code
void mouseClicked() {
  printCirkelIndex(cirkels);
}

void tekenCirkels(int coordinatie[][]) {
  noStroke();
  for(int aantalCirkels = 0; aantalCirkels < coordinatie.length; aantalCirkels++) {
    if(muisHover(coordinatie, aantalCirkels)) {
      fill(ROOD);
    } else {
      fill(GEEL);
    }
    ellipse(coordinatie[aantalCirkels][0], coordinatie[aantalCirkels][1], DIAMETER, DIAMETER);
  }
}

boolean muisHover(int coordinatie[][], int aantalCirkels) {
  float xMin = coordinatie[aantalCirkels][0] - (DIAMETER / 2);
  float xMax = coordinatie[aantalCirkels][0] + (DIAMETER / 2);
  float yMin = coordinatie[aantalCirkels][1] - (DIAMETER / 2);
  float yMax = coordinatie[aantalCirkels][1] + (DIAMETER / 2);
  if(mouseX > xMin && mouseX < xMax && mouseY > yMin && mouseY < yMax ) {
      return true;
    } else {
      return false;
    }
}

void printCirkelIndex(int coordinatie[][]) {
  for(int aantalCirkels = 0; aantalCirkels < coordinatie.length; aantalCirkels++) {
    if(muisHover(coordinatie, aantalCirkels)) {
      println("geklikt op cirkel met index: "+ aantalCirkels);
    }
  }
}