// Moduleopgave 1
// Alexander James Becoy
// 4-09-2017


// Staven (deze waardes kunnen veranderen)
float staafA = 20.0;
float staafB = 190.0;
float staafC = 150.0;

// hieronder komt jouw code.

// Alle benodigde kleuren in een array.
color[] kleuren = {
  color(0, 0, 255), // staaf A
  color(0, 255, 0), // staaf B
  color(255, 0, 0), // staaf C
  color(255, 69, 0) // gemiddelde
};

// zoomFactor, gaat automatisch veranderen wanneer een staaf groter is dan de verticale-as.
float zoomFactor = 1.0;

// Een variabele voor de gemiddelde van de lengte van alle staven.
float average = (staafA + staafB + staafC) / 3;

void setup() {
  
  // Hier zit de setup want volgens Processing moet ik het hier neerzetten anders
  // werkt het niet.
  size(500, 200);
  background(0);
  textSize(12);
  
  // Check de lengte van elke staven
  if (staafA >= (height - 10)) {
    zoomFactor = (height - 10) / staafA;
  } 
  if (staafB >= (height - 10)) {
    zoomFactor = (height - 10) / staafB;
  } 
  if (staafC >= (height - 10)) {
    zoomFactor = (height - 10) / staafC;
  }
   
  // Zoomfactor indicator
  fill(255);
  textSize(10);
  text("Zoomfactor: " + zoomFactor, 4, 12);
  
  drawBar((width / 7), kleuren[0], staafA);
  drawBar((width / 7) * 3, kleuren[1], staafB);
  drawBar((width / 7) * 5, kleuren[2], staafC);
  
  stroke(kleuren[3]);
  fill(kleuren[3]);
  line(0, height - average * zoomFactor, width, height - average * zoomFactor);
  text(average, width / 10, (height - average * zoomFactor) - 1);
  
}

// Een functie om de staven te tekenen zodat ik het niet drie keer hoef te programmeren.
void drawBar(int x, color kleur, float lengte) {
  fill(kleur);
  rect(x, height, width / 7, -lengte * zoomFactor);
  text(lengte, x, height - lengte * zoomFactor);
}