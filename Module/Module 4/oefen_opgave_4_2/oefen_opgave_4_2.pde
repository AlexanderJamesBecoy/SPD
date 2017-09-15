void setup() {
  size(800, 600);
  background(0);
  
  fill(#FFFFFF);
  textAlign(CENTER, CENTER);
  textSize(width * 0.02);
  
  begroet("Harry", width / 4, height / 4);
  begroet("Marianne", (width / 4) * 3, height / 4);
  begroet("Ludo", width / 4, (height / 4) * 3);
  begroet("Maaike", (width / 4) * 3, (height / 4) * 3);
  begroet("Alexander", width / 2, height / 2);
}

void begroet(String naam, int x, int y) {
  text("Hallo " + naam + ", hoe gaat het met je?", x, y);
}