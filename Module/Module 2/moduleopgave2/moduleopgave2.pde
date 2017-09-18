// Moduleopgave 2
// Alexander James Becoy
// 6 september 2017

import controlP5.*;
ControlP5 theControl;

// Het breedte and de x-waarde van de BMI-staaf wordt bepaalt door de grootte van
// de x-waarde van de windows.
int barWidth, barX, 
    textMargin = 10;
    
// Met de gridY variabele zorgt dat de lijnen en de BMI-staaf op elke y-waarde van
// de windows mee scalet.
float gridY, 
      maxGrid = 100, // 100%
      BMI;           // De variabele voor BMI

// Variabelen van elke benodigde kleuren.
color red = color(255, 0, 0),
      orange = color(255, 60, 0),
      green = color(0, 255, 0),
      white = color(255, 255, 255);

// Data van de BMI.
float max_onderGewicht = 18.5,
      max_normaalGewicht = 25,
      max_overGewicht = 30;

void setup() {
  size(800, 700);
  theControl = new ControlP5(this);
  createNumberBoxes(theControl);
  
  barWidth = width / 8;
  barX = (width / 2) - (barWidth / 2);
  
  gridY = height / maxGrid;
  textSize(textMargin);
}

void draw() {
  background(50);
  println("lengte:" + leesLengte());
  println("gewicht: " + leesGewicht());
  println("BMI: " + berekenBMI(leesGewicht(), leesLengte()));
  
  // De BMI wordt berekend door de functie.
  BMI = berekenBMI(leesGewicht(), leesLengte());
  
  // Hier zitten de lijnen
  // Ondergewicht
  stroke(red);
  line(0, height - max_onderGewicht * gridY, width, height - max_onderGewicht * gridY);
  fill(red);
  text("Ondergewicht", 10, (height - max_onderGewicht * gridY) + textMargin);
  
  // Normaal gewicht
  stroke(green);
  line(0, height - max_normaalGewicht * gridY, width, height - max_normaalGewicht * gridY);
  fill(green);
  text("Normaal gewicht", 10, (height - max_normaalGewicht * gridY) + textMargin);
  
  // Overgewicht
  stroke(red);
  line(0, height - max_overGewicht * gridY, width, height - max_overGewicht * gridY);
  fill(red);
  text("Overgewicht", 10, (height - max_overGewicht * gridY) + textMargin);
  
  // Obees
  text("Obees", 10, (height - max_overGewicht * gridY) - 2);
  
  // De BMI-staaf
  noStroke();
  fill(orange);
  rect(barX, height, barWidth, -BMI * gridY);
  
  // BMI-Indicator (extraatjes)
  fill(white);
  text("BMI: " + BMI, 10, height - (textMargin * 2));
  if(BMI < max_onderGewicht) {
    fill(red);
    text("U heeft ondergewicht!", 10, height - textMargin);
  } else if(BMI >= max_onderGewicht && BMI < max_normaalGewicht) {
    text("U heeft normaal gewicht.", 10, height - textMargin);
  } else if(BMI >= max_normaalGewicht && BMI < max_overGewicht) {
    fill(orange);
    text("U heeft overgewicht.", 10, height - textMargin);
  } else {
    fill(red);
    text("U bent obees!", 10, height - textMargin);
  }
  
}

// BMI bereken
float berekenBMI(float gewichtInKg, float lengteInCm) {
  float lengteInM = lengteInCm / 100;      // Van cm naar m
  return gewichtInKg / sq(lengteInM); // BMI = gewicht(kg) / lengte^2(m^2)
}