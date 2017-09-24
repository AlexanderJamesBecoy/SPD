float muurBreedte = 5.50;
float muurHoogte = 2.25;
float rolBreedte = 0.52;
float rolLengte = 10.0;

float patroonHoogte = 0;

void setup() {
  int aantalStroken = berekenAantalStroken(muurBreedte, rolBreedte);
  int aantalStrokenPerRol = berekenAantalStrokenPerRol(muurHoogte, rolLengte);
  println("Je hebt er " + berekenBenodigdeRollen(aantalStroken, aantalStrokenPerRol) + " rollen nodig.");
}

int berekenAantalStroken(float muurBreedte, float rolBreedte) {
  float aantal = muurBreedte / rolBreedte;
  return ceil(aantal);
}

int berekenAantalStrokenPerRol(float muurHoogte, float rolLengte, float patroonHoogte) {
  if (patroonHoogte > 0) {
    muurHoogte = muurHoogte / patroonHoogte;
  }
  float lengte = rolLengte / muurHoogte;
  return ceil(lengte);
}

int berekenAantalStrokenPerRol(float muurHoogte, float floatRolLengte) {
  return berekenAantalStrokenPerRol(muurHoogte, floatRolLengte, 0);
}

int berekenBenodigdeRollen(int aantalStroken, int aantalStrokenPerRol) {
  float benodigdeRollen = (float)aantalStroken / (float)aantalStrokenPerRol;
  return ceil(benodigdeRollen);
}