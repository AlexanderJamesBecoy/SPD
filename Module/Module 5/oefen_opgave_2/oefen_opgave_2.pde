float muurBreedte = 5.50;
float muurHoogte = 2.25;
float rolBreedte = 0.52;
float rolLengte = 10.0;

float patronHoogte = 0.8;

void setup() {
  println("Je hebt er " + berekenAantalRollen(muurBreedte, muurHoogte, rolLengte, rolBreedte) + " rollen nodig.");
  println("Je hebt er " + berekenAantalRollen(muurBreedte, muurHoogte, rolLengte, rolBreedte, patronHoogte) + 
          " rollen nodig met een patronhoogte van " + patronHoogte + "m.");
}

int berekenAantalStroken(float muurBreedte, float rolBreedte) {
  float aantal = muurBreedte / rolBreedte;
  return ceil(aantal);
}

int berekenAantalStrokenPerRol(float muurHoogte, float rolLengte) {
  float lengte = rolLengte / muurHoogte;
  return ceil(lengte);
}

int berekenAantalRollen(float muurBreedte, float muurHoogte, float rolLengte, float rolBreedte, float patronHoogte) {
  float knipLengte = berekenKnipLengte(patronHoogte, muurHoogte);
  int aantal = berekenAantalRollen(muurBreedte, knipLengte, rolLengte, rolBreedte);
  return aantal;
}

int berekenAantalRollen(float muurBreedte, float muurHoogte, float rolLengte, float rolBreedte) {
  int aantalStroken = berekenAantalStroken(muurBreedte, rolBreedte);
  int aantalStrokenPerRol = berekenAantalStrokenPerRol(muurHoogte, rolLengte);
  float aantal = float(aantalStroken) / aantalStrokenPerRol;
  return ceil(aantal);
}

float berekenKnipLengte(float patronHoogte,float hoogteMuur) {
  int aantal = ceil(hoogteMuur/patronHoogte);
  return aantal * patronHoogte;
}