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

// BMI bereken
float berekenBMI(float gewichtInKg, float lengteInCm) {
  float lengteInM = lengteInCm / 100;      // Van cm naar m
  return gewichtInKg / sq(lengteInM); // BMI = gewicht(kg) / lengte^2(m^2)
}

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

/* Module 5 */
void drawSlider(String soortData, float grootheid, float xPos, float yPos) {
  String eenheid = "";
  boolean dataIsLengte = false;
  boolean dataIsGewicht = false;
  float data = 0;
  if(grootheid == lengteInCm) dataIsLengte = !dataIsLengte;
  if(grootheid == gewichtInKg) dataIsGewicht = !dataIsGewicht;
  
  if(dataIsLengte) {
    eenheid = "cm";
    data = lengteInCm;
    ySliderKnopLengte = yPos;
  } else
  if(dataIsGewicht) {
    eenheid = "kg";
    data = gewichtInKg;
    ySliderKnopGewicht = yPos;
  }
  noStroke();
  // Teken wit achtergrond en tekst
  fill(white);
  rect(xPos, yPos, sliderLengte, sliderDikte);
  textAlign(LEFT, TOP);
  text(soortData + grootheid + eenheid, xPos, yPos + sliderDikte);
  // Teken sliderknop
  fill(blue);
  if(dataIsLengte) {
    rect(xSliderKnopLengte, ySliderKnopLengte, sliderKnopBreedte, sliderDikte);
  } else
  if(dataIsGewicht) {
    rect(xSliderKnopGewicht, ySliderGewicht, sliderKnopBreedte, sliderDikte);
  }
}

float sd() {
  return 0.0;
}

boolean checkMousePressed(float dataX, float dataY) {
  if(mouseX > dataX - (sliderKnopBreedte / 2) && mouseX < dataX + sliderKnopBreedte 
  && mouseY > dataY && mouseY < dataY + sliderDikte) {
    return true;
  } else {
    return false;
  }
}

float decreaseData(float data) {
  float minData = 0;
  if(data == lengteInCm)  minData = minLengteInCm;
  if(data == gewichtInKg)  minData = minGewichtInKg;
  
  if(data > minData) {
    return data - 1.0;
  } else {
    return data;
  }
}

float increaseData(float data) {
  float maxData = 0;
  if(data == lengteInCm)  maxData = maxLengteInCm;
  if(data == gewichtInKg)  maxData = maxGewichtInKg;
  
  if(data < maxData) {
    return data + 1.0;
  } else {
    return data;
  }
}

float sliderKnop(float data) {
  boolean dataIsLengte = false;
  boolean dataIsGewicht = false;
  float minData = 0;
  float maxData = 0;
  float minBorder = xSlider;
  float maxBorder = xSlider + sliderLengte;
  if(data == lengteInCm) dataIsLengte = !dataIsLengte;
  if(data == gewichtInKg) dataIsGewicht = !dataIsGewicht;
  
  if(dataIsLengte) {
    
  }
  if(dataIsGewicht) {
    
  }
  
  return data;
}