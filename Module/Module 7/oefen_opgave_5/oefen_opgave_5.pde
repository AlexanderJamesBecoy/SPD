float[] cijfers = { 3.3, 4.5, 7.2, 5.3, 9.0, 2.3 }; // min 2.3, max 9.0
float[] lijst1 = { -8.0, 4.5, 1.2, -5.6, -9.1, 4 }; // min -9.1, max 4.5
float[] lijst2 = { -0.4, -0.7, -3.5, -1.9, -8.0 }; // min -8.0, max -0.4

void setup() {
  float hoogste = geefHoogste(cijfers);
  println("Het hoogste cijfer is: " + hoogste);
  
  float laagste = geefLaagste(cijfers);
  println("Het laagste cijfer is: " + laagste);
  
  println("Het hoogste cijfer van lijst 1 is: " + geefHoogste(lijst1));
  println("Het laagste cijfer van lijst 1 is: " + geefLaagste(lijst1));
  
  println("Het hoogste cijfer van lijst 2 is: " + geefHoogste(lijst2));
  println("Het laagste cijfer van lijst 2 is: " + geefLaagste(lijst2));
}

float geefHoogste(float[] cijfers) {
  float hoogste = cijfers[0];
  for(int cijferIndex = 1; cijferIndex < cijfers.length; cijferIndex++) {
    if(cijfers[cijferIndex] > hoogste) {
      hoogste = cijfers[cijferIndex];
    }
  }
  return hoogste;
}

float geefLaagste(float[] cijfers) {
  float laagste = cijfers[0];
  for(int cijferIndex = 1; cijferIndex < cijfers.length; cijferIndex++) {
    if(cijfers[cijferIndex] < laagste) {
      laagste = cijfers[cijferIndex];
    }
  }
  return laagste;
}