// Moduleopgave 2
// Alexander James Becoy
// 6 september 2017

import controlP5.*;
ControlP5 theControl;

int barWidth, barX, 
    textMargin = 10;
float gridY,
      maxGrid = 100, // Zorgt dat de y-as van 0 tot 100 is, zodat de lengte zichtbaar zijn
      BMI;

color red = color(255, 0, 0),
      orange = color(255, 60, 0),
      green = color(0, 255, 0),
      white = color(255, 255, 255);

float max_onderGewicht = 18.5,
      max_normaalGewicht = 25,
      max_overGewicht = 30;

void setup() {
  size(400, 350);
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
  BMI = berekenBMI(leesGewicht(), leesLengte());
  
  noStroke();
  fill(orange);
  rect(barX, height, barWidth, -BMI * gridY);
  
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
  
  // BMI-Indicator (extraatjes)
  fill(white);
  text("BMI: " + (int)BMI, 10, height - (textMargin * 2));
  if(BMI < 18.5) {
    fill(red);
    text("U heeft ondergewicht!", 10, height - textMargin);
  } else if(BMI >= 18.5 && BMI < 25) {
    text("U heeft normaal gewicht.", 10, height - textMargin);
  } else if(BMI >= 25 && BMI < 30) {
    fill(orange);
    text("U heeft overgewicht.", 10, height - textMargin);
  } else {
    fill(red);
    text("U bent obees!", 10, height - textMargin);
  }
  
}

// BMI bereken
float berekenBMI(float g, float l) {
  l = l / 100;      // Van cm naar m
  return g / sq(l); // BMI = gewicht(kg) / lengte^2(m^2)
}