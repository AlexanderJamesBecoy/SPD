// Module 5 opgave extra 2
// Alexander James Becoy
// 25 september 2017

void setup() {
  println(berekenABC_xWaarden(2, 5, -7));
}

String berekenABC_xWaarden(float a, float b, float c) {
  float geworteldeFormule = (float)Math.sqrt(sq(b) - 4 * a * c);
  float negatieveTeller = -b - geworteldeFormule;
  float positieveTeller = -b + geworteldeFormule;
  float noemer = 2 * a;
  float X1 = negatieveTeller / noemer;
  float X2 = positieveTeller / noemer;
  
  return X1 + " en " + X2;
}