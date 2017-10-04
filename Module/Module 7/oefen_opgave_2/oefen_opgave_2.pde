String boodschappen[] = {
  "Brood",
  "Melk",
  "Eieren",
  "Vleeswaren",
  "Koekjes"
};

void setup() {
  drukAf(boodschappen);
}

void drukAf(String[] array) {
  for(int arrayIndex = 0; arrayIndex < array.length; arrayIndex++) {
    println("[" + arrayIndex + "] " + array[arrayIndex]);
  }
}