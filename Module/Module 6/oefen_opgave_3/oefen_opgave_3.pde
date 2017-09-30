final int ZIJDE = 15;
final int AANTAL = 15;

void setup() {
  size(350, 350);
  background(#FFFFFF);
  
  for(int i = 0; i < AANTAL; ++i) {
    for(int j = 0; j < AANTAL; ++j) {
      int margin = (width - AANTAL * ZIJDE) / 2;
      fill(#FF0000);
      stroke(0);
      rect(i * ZIJDE + margin, j * ZIJDE + margin, ZIJDE, ZIJDE);
    }
  }
  
}