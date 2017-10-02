// Module opgave 6 deel 1
// Alexander James Becoy
// 2-10-17

PImage jongen;
PImage meisje;

int margin = 10;
int imageWidth = 28;
int imageHeight = 48;
int amountOfFamilies = 8;

float chanceOfMaleNumerator = 2;
float chanceOfMaleDenominator = 5;

void setup() {
  size(500, 500);
  
  jongen = loadImage("jongetje.png");
  meisje = loadImage("meisje.png");

  for (int familyIndex = 0; familyIndex < amountOfFamilies; familyIndex++) {
    maakGezin(familyIndex);
  }
}

void maakGezin(int familieIndex) {
  boolean isMale = false;
  int amountOfSiblings = 0;
  while (!isMale) {
    amountOfSiblings++;
    if (random(chanceOfMaleDenominator) < chanceOfMaleNumerator) {
      isMale = !isMale;
      image(jongen, xPosition(amountOfSiblings), yPosition(familieIndex));
    } else {
      image(meisje, xPosition(amountOfSiblings), yPosition(familieIndex));
    }
  }
}

int xPosition(int index) {
  return (margin * index) + (imageWidth * (index - 1));
}

int yPosition(int index) {
  return (margin * (index + 1)) + (imageHeight * index);
}