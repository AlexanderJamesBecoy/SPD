void loopFamily(float amountOfFamilies, float chanceOfMaleDenominator) {
  for (int familyIndex = 0; familyIndex < amountOfFamilies; familyIndex++) {
    makeFamily(familyIndex, chanceOfMaleDenominator);
  }
}

void makeFamily(int familyIndex, float chanceOfMaleDenominator) {
  boolean isMale = false;
  int amountOfSiblings = 0;
  while (!isMale) {
    amountOfSiblings++;
    if (randomIsMale(chanceOfMaleDenominator)) {
      isMale = !isMale;
      image(jongen, xPosition(amountOfSiblings), yPosition(familyIndex));
    } else {
      image(meisje, xPosition(amountOfSiblings), yPosition(familyIndex));
    }
  }
}

int xPosition(int index) {
  return (margin * index) + (imageWidth * (index - 1));
}

int yPosition(int index) {
  return (margin * (index + 1)) + (imageHeight * index);
}

boolean randomIsMale(float chanceOfMaleDenominator) {
  int isMale = round(random(1, chanceOfMaleDenominator));
  if(isMale == 1) {
    return true;
  } else {
    return false;
  }
}