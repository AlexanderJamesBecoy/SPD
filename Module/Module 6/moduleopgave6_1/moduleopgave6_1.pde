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
    boolean isMale = false;
    int amountOfSiblings = 0;
    if (!isMale) {
      while (!isMale) {
        amountOfSiblings++;
        if (random(chanceOfMaleDenominator) < chanceOfMaleNumerator) {
          isMale = !isMale;
          image(jongen, xPosition(amountOfSiblings), yPosition(familyIndex));
        } else {
          image(meisje, xPosition(amountOfSiblings), yPosition(familyIndex));
        }
      }
    }
  }
}

int xPosition(int index) {
  return (margin * index) + (imageWidth * (index - 1));
}

int yPosition(int index) {
  return (margin * (index + 1)) + (imageHeight * index);
}