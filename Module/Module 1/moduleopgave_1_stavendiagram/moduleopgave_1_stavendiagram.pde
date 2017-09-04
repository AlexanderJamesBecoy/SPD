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

// Een variabele voor de gemiddelde van de lengte van alle staven.
float average = (staafA + staafB + staafC) / 3;

// Zoomfactor
float zoomfactor = 1;

void setup() {
  
  // Hier zit de setup want volgens Processing moet ik het hier neerzetten anders
  // werkt het niet.
  size(500, 200);
  background(0);
  
  // Zoomfactor indicator
  fill(255);
  textSize(10);
  text("Zoomfactor: " + zoomfactor, width / 20, height / 10);
  
  drawBar((width / 7), kleuren[0], staafA);
  drawBar((width / 7) * 3, kleuren[1], staafB);
  drawBar((width / 7) * 5, kleuren[2], staafC);
  
  stroke(kleuren[3]);
  fill(kleuren[3]);
  line(0, height - average, width, height - average);
  textSize(12);
  text(average, width / 10, height - average - 1);
  
}

// Een functie om de staven te tekenen zodat ik het niet drie keer te programmeren.
void drawBar(int x, color kleur, float lengte) {
  fill(kleur);
  rect(x, height, width / 7, -lengte);
  textSize(12);
  text(lengte, x, height - lengte);
}