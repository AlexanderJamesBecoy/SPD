int gewichtPositie = 40;
final float gewichtX = 70;
final float gewichtY =  100;
final float gewichtBreedte = 300;
final float gewichtHoogte = 50;

int gewichtNPosities;
final float gewichtMin = 50;
final float gewichtMax = 250;
 
int lengtePositie;
final float lengteX = 70;
final float lengteY =  200;
final float lengteBreedte = 300;
final float lengteHoogte = 50;

int lengteNPosities;
final float lengteMin = 1;
final float lengteMax = 5;
 
void setup() {
  size(400, 400);
  
  gewichtNPosities = berekenNPosities(gewichtMin, gewichtMax);
  lengteNPosities = berekenNPosities(lengteMin, lengteMax);
}
 
void draw() {
  background(0);
  if (isMuisBovenRect(gewichtX, gewichtY, gewichtBreedte, gewichtHoogte)) {
    gewichtPositie = bepaalPositie(gewichtX, gewichtBreedte, gewichtNPosities);
  }
  tekenSlider(gewichtX, gewichtY, gewichtBreedte, gewichtHoogte, gewichtPositie, gewichtNPosities);
 
  if( isMuisBovenRect(lengteX, lengteY, lengteBreedte, lengteHoogte)  ){
    lengtePositie = bepaalPositie(lengteX, lengteBreedte, lengteNPosities);
  }
  tekenSlider(lengteX, lengteY, lengteBreedte, lengteHoogte, lengtePositie, lengteNPosities);
 
  text(gewichtPositie, gewichtX, gewichtY + gewichtHoogte + 25);
  
  println(leesGewicht(gewichtMin, gewichtMax, gewichtPositie, gewichtNPosities) + "kg");
  println(leesLengte(lengteMin, lengteMax, lengtePositie, lengteNPosities) + "m");
}
 
boolean isMuisBovenRect( float x, float y, float breedte, float hoogte)
{
  if((mouseX > x) && (mouseX < x+breedte) && (mouseY > y) && (mouseY < y+hoogte)){
    return true;
  }
  else
  {
    return false;
  }
}
 
void tekenSlider(float x, float y, float breedte, float hoogte, int positie, int nPosities) {
  float blokjeBreedte = breedte / nPosities;
 
  noStroke();
  fill(255);
  rect(x, y, breedte, hoogte);
  fill(#2257F0);
  rect(x+positie*blokjeBreedte, y, blokjeBreedte, hoogte);
}
 
int bepaalPositie(float x, float breedte, int nPosities) {
  float blokjeBreedte = breedte / nPosities;
  if (mouseX < x) {
    return 0;
  }
  else if (mouseX >= x+breedte) {
    return nPosities-1;
  }
  else {
    return floor((mouseX-x) / blokjeBreedte);
  }
}

int berekenNPosities(float min, float max) {
  return round(max - min);
}

float leesGewicht(float min, float max, float x, float breedte) {
  int nPosities = berekenNPosities(min, max);
  int positie = bepaalPositie(x, breedte, nPosities);
  float resultaat = min + positie;
  return resultaat;
}

float leesLengte(float minLengte, float maxLengte, float x, float breedte) {
  float lengteVerschil = maxLengte - minLengte;
  float lengteGrootte = breedte / lengteVerschil;
  return x * lengteGrootte + 1;
}