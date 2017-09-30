int marge = 20;
int aantal = 7;
float knopHoogte;

color kleuren[] = {
  #FF0000,
  #00FF00,
  #0000FF,
  #FFFF00,
  #FF00FF,
  #00FFFF,
  #FF6000
};

void setup() {
  size(800, 800);
  
  fill(255);
  knopHoogte = knopHoogte(height, aantal, marge);
}

void draw() {
  for(int knopIndex = 0; knopIndex < aantal; knopIndex++) {
    tekenKnop(marge, knopIndex, width - marge * 2, knopHoogte, #FFFFFF, kleuren[knopIndex]);
  }
}

void tekenKnop(float x, float y, float b, float h, color kleur, color kleurActive) {
  float rectY = marge * (y + 1) + knopHoogte * y;
  if(muisBovenKnop(x, rectY, b, h)) {
    fill(kleurActive);
    println((int)y + 1);
  } else {
    fill(kleur);
    println(0);
  }
  rect(x, rectY, b, h);
}

boolean muisBovenKnop(float x, float y, float b, float h) {
  if ((mouseX >= x) && (mouseX <= x + b) && (mouseY >= y) && (mouseY <= y + h)) {
    return true;
  } else {
    return false;
  }
}

float knopHoogte(float hoogte, float aantal, float marge) {
  return (hoogte - ( (aantal + 1) * marge) ) / aantal;
}