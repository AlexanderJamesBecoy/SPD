Numberbox nb1, nb2;

/**
  Creates the two input fields   
*/

/**
  Returns the length in cm  
*/
float leesLengte() {
  return lengteInCm;
}

/**
  Returns the weight in kg
*/
float leesGewicht() { 
  return gewichtInKg;
}

/* Module 2 */

void bmiLijn(float gewichtInKg, color kleur, String bmiData) {
  stroke(kleur);
  line(0, (height / 2) - gewichtInKg * gridY, width, (height / 2) - gewichtInKg * gridY);
  fill(kleur);
  textAlign(BOTTOM);
  text(bmiData, 10, (height / 2 - gewichtInKg * gridY) + textMargin);
}

void bmiIndicator(String bmiData) {
  textAlign(BOTTOM);
  text(bmiData, 10, (height / 2) - textMargin);
}