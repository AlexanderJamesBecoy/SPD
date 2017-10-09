String[] stringCijferlijst;
int fontGrootte = 20;
int marge = 25;

String bestand1 = "cijfers_groot.txt";
String bestand2 = "cijfers_klein.txt";

void setup() {
  size(800, 600);
  background(0);
  stringCijferlijst = loadStrings(bestand1);
  
  float[] cijferlijst = leesBestand(stringCijferlijst);
  
  tekenData(cijferlijst);
  tekenStatistiek(cijferlijst, 10);
}