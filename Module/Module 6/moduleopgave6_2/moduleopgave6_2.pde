PImage boy;
PImage girl;

int margin = 10;
int imageWidth = 28;
int imageHeight = 48;
int amountOfBoys = 0;
int amountOfGirls = 0;

void setup() {
  size(100, 100);
  
  boy = loadImage("jongetje.png");
  girl = loadImage("meisje.png");
  
  loopFamilies(100, 2);
  
  image(girl, xPosition(1), yPosition());
  image(boy, xPosition(2), yPosition());
  fill(0);
  textSize(12);
  textAlign(LEFT, TOP);
  text(amountOfGirls, xPosition(1), yPosition() + imageHeight);
  text(amountOfBoys, xPosition(2), yPosition() + imageHeight);
  
  println("Meisjes: " + amountOfGirls);
  println("Jongens: " + amountOfBoys);
}

void loopFamilies(float amountOfFamilies, float chanceOfMaleDenominator) {
  for (int familyIndex = 0; familyIndex < amountOfFamilies; familyIndex++) {
    boolean isMale = false;
    if (!isMale) {
      while (!isMale) {
        if (randomIsMale(chanceOfMaleDenominator)) {
          isMale = !isMale;
          amountOfBoys++;
        } else {
          amountOfGirls++;
        }
      }
    }
  }
}

float xPosition(int index) {
  return ((width / 3) * index) - (imageWidth / 2);
}

float yPosition() {
  return margin + (imageHeight / 2);
}

boolean randomIsMale(float chanceOfMaleDenominator) {
  int isMale = round(random(1, chanceOfMaleDenominator));
  if (isMale == 1) {
    return true;
  } else {
    return false;
  }
}