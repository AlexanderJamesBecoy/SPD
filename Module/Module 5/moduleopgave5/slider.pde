// BMI bereken
float berekenBMI(float gewichtInKg, float lengteInCm) {
  float lengteInM = lengteInCm / 100;      // Van cm naar m
  return gewichtInKg / sq(lengteInM); // BMI = gewicht(kg) / lengte^2(m^2)
}

/* Module 5 */
void drawSlider(String soortData, float grootheid, float xPos, float yPos) {
  String eenheid = "";
  boolean dataIsLengte = false;
  boolean dataIsGewicht = false;
  if(grootheid == lengteInCm) dataIsLengte = !dataIsLengte;
  if(grootheid == gewichtInKg) dataIsGewicht = !dataIsGewicht;
  
  if(dataIsLengte) {
    eenheid = "cm";
    ySliderKnopLengte = yPos;
  } else
  if(dataIsGewicht) {
    eenheid = "kg";
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

float xSliderKnop(float data) {
  boolean dataIsLengte = false;
  boolean dataIsGewicht = false;
  float minData = 0;
  float maxData = 0;
  if(data == lengteInCm) dataIsLengte = !dataIsLengte;
  if(data == gewichtInKg) dataIsGewicht = !dataIsGewicht;
  
  if(dataIsLengte) {
    minData = minLengteInCm;
    maxData = maxLengteInCm;
    dataPercentage = (maxData - minData) / 100;
    data = xSlider + data - minData;
  }
  if(dataIsGewicht) {
    minData = minGewichtInKg;
    maxData = maxGewichtInKg;
    dataPercentage = (maxData - minData) / 100;
    data = xSlider + data - minData;
  }
  
  return data;
}