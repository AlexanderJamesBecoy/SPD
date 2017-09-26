// Moduleopgave 5
// Alexander James Becoy
// 22 september 2017

// Het breedte and de x-waarde van de BMI-staaf wordt bepaalt door de grootte van
// de x-waarde van de windows.
int barWidth, barX, margin,
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
      blue = color(0, 0, 255),
      white = color(255, 255, 255);

// Data van de BMI.
float max_onderGewicht = 18.5,
      max_normaalGewicht = 25,
      max_overGewicht = 30;

/*
=========================
  Module 5 - Pseudocode
=========================
Wat komen erbij?
De minimale en maximale waarde van de data (gewicht en lengte).
We willen niet dat de waarde bv. minder dan negatieve waarden of overdreven
grote getallen.
Dus wanneer de data minder/groter dan de minimale/maximale, kan het niet
kleiner/groter dan dat worden.
Ook drukken we de data in de bijbehorende eenheden uit, zodat de anderen het kunnen
meteen weten.

float min(Data)In(Eenheid);
float max(Data)In(Eenheid);
float (data)In(Eenheid);

We willen ook coordinaten van de sliders, zodat wij het in de mousePressed() methode
kunnen slepen. We gooien ze in een float, want het moet precies zijn en het moet met
de grootte van size mee kunnen scalen.

float sliderLengte; // Het lengte van de slider.
float sliderDikte;  // Hoe dik de slider.
float xSliderKnop(Data); // De x-coordinaat van een sliderknop, want elke sliderknop
                         // kunnen andere waarden hebben.
float ySliderKnop(Data); // De y-coordinaat van een sliderknop.
float sliderKnopBreedte; // Beide knoppen zijn toch even breed en de dikte is
                         // toch even groot als de dikte van de slider.
                         
We maken gebruik van een boolean om te bekijken of de sliderknop gedrukt is.

boolean slider(Data)Pressed;

We willen beide sliders aan de onderste helft van de window symmetrisch, horizontaal
en verticaal.
We maken geen gebruik van rectMode want dat zult misschien de bmiDoos verpesten.

EDIT: ik heb nog variabelen aangemaakt voor de coordinaten van beide sliders.

*/
// Data van lengte en gewicht
float minLengteInCm = 50.0;
float maxLengteInCm = 250.0;
float lengteInCm = 50.0;

float minGewichtInKg = 10.0;
float maxGewichtInKg = 200.0;
float gewichtInKg = 10.0;

// Data van de sliders
float sliderLengte;
float sliderDikte;

float xSlider;
float ySliderLengte;
float ySliderGewicht;

float xSliderKnopLengte;
float ySliderKnopLengte;
float xSliderKnopGewicht;
float ySliderKnopGewicht;
float sliderKnopBreedte;

boolean sliderLengtePressed = false;
boolean sliderGewichtPressed = false;

float midHeight;
float dataPercentage;

void setup() {
  size(800, 700);
  
  barWidth = width / 8;
  barX = (width / 2) - (barWidth / 2);
  
  margin = width / 10;
  gridY = height / maxGrid;
  midHeight = height / 2;
  textSize(textMargin);
  
  sliderLengte = width / 5 * 4;
  sliderDikte = midHeight / 10;
  sliderKnopBreedte = sliderLengte / 100;
  
  xSlider = width / 10;
  ySliderLengte = midHeight + midHeight / 4;
  ySliderGewicht = midHeight + midHeight / 3 * 2;
  
  xSliderKnopLengte = xSlider;
  xSliderKnopGewicht = xSlider;
  dataPercentage = sliderLengte / (maxLengteInCm - minLengteInCm);
}

void draw() {
  /* Module 2 */
  background(50);
  
  // De BMI wordt berekend door de functie.
  BMI = berekenBMI(gewichtInKg, lengteInCm);
  
  // Hier zitten de lijnen
  // Ondergewicht
  bmiLijn(max_onderGewicht, red, "Ondergewicht");
  
  // Normaal gewicht
  bmiLijn(max_normaalGewicht, green, "Normaal gewicht");
  
  // Overgewicht
  bmiLijn(max_overGewicht, red, "Overgewicht");
  
  // Obees
  text("Obees", 10, (midHeight - max_overGewicht * gridY) - 2);
  
  // De BMI-staaf
  stroke(white);
  fill(orange);
  rect(barX, midHeight, barWidth, -BMI * gridY);
  
  // BMI-Indicator (extraatjes)
  fill(white);
  noStroke();
  text("BMI: " + BMI, 10, (midHeight) - (textMargin * 2));
  if(BMI < max_onderGewicht) {
    fill(red);
    bmiIndicator("U heeft ondergewicht!");
  } else if(BMI >= max_onderGewicht && BMI < max_normaalGewicht) {
    bmiIndicator("U heeft normaal gewicht.");
  } else if(BMI >= max_normaalGewicht && BMI < max_overGewicht) {
    fill(orange);
    bmiIndicator("U heeft overgewicht.");
  } else {
    fill(red);
    bmiIndicator("U bent obees!");
  }
  
  stroke(white);
  line(0, midHeight, width, midHeight);
  
  /* Module 5 */
  smooth();
  
  xSliderKnopLengte = xSliderKnop(lengteInCm);
  xSliderKnopGewicht = xSliderKnop(gewichtInKg);
  
  drawSlider("Lengte: ", lengteInCm, xSlider, ySliderLengte);
  drawSlider("Gewicht: ", gewichtInKg, xSlider, ySliderGewicht);
  
  if(sliderLengtePressed || sliderGewichtPressed) {
   cursor(MOVE); 
  } else
  if(checkMousePressed(xSliderKnopLengte, ySliderKnopLengte)
  || checkMousePressed(xSliderKnopGewicht, ySliderKnopGewicht)) {
    cursor(HAND); 
  } else {
    cursor(POINT);
  }
  
  // @TODO -- Dit in een functie opstellen
  /*
  if(sliderLengtePressed) {
    if(mouseX < xSliderKnopLengte) {
      lengteInCm = decreaseData(lengteInCm);
    } else
    if(mouseX > xSliderKnopLengte + sliderKnopBreedte) {
      lengteInCm = increaseData(lengteInCm);
    }
  } else
  if(sliderGewichtPressed) {
    if(mouseX < xSliderKnopGewicht) {
      gewichtInKg = decreaseData(gewichtInKg);
    } else
    if(mouseX > xSliderKnopGewicht + sliderKnopBreedte) {
      gewichtInKg = increaseData(gewichtInKg);
    }
  }
  */
  
  if(sliderLengtePressed) {
    lengteInCm = changeData(lengteInCm);
  }
  if(sliderGewichtPressed) {
    gewichtInKg = changeData(gewichtInKg);
  }
}

void mousePressed() {
  if(checkMousePressed(xSliderKnopLengte, ySliderKnopLengte) && !sliderGewichtPressed) {
    sliderLengtePressed = true;
  } else
  if(checkMousePressed(xSliderKnopGewicht, ySliderKnopGewicht) && !sliderLengtePressed) {
    sliderGewichtPressed = true;
  }
}

void mouseReleased() {
  if(sliderLengtePressed ^ sliderGewichtPressed) {
    sliderLengtePressed = false;
    sliderGewichtPressed = false;
  }
}