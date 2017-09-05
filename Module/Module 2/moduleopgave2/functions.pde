Numberbox nb1, nb2;

/**
  Creates the two input fields   
*/
void createNumberBoxes(ControlP5 controlP5) {
  nb1 = controlP5.addNumberbox("lengte (cm)     ", 170, 100, 10, 100, 30);
  
  nb1.getValueLabel().setFont(createFont("arial",12)); //changed ControlP5.grixel into createFont("arial",12) (and below) 
  nb1.setMax(250);
  nb1.setMin(50);
  nb1.getCaptionLabel().setFont(createFont("arial",12));
  
  nb2 = controlP5.addNumberbox("gewicht (kg)      ", 60, 100, 70, 100, 30);
  nb2.getValueLabel().setFont(createFont("arial",12));
  nb2.getCaptionLabel().setFont(createFont("arial",12));
  
  nb2.setMax(200);
  nb2.setMin(10);
}

/**
  Returns the length in cm  
*/
float leesLengte() {
  return nb1.getValue();
}

/**
  Returns the weight in kg
*/
float leesGewicht() { 
  return nb2.getValue();
}


