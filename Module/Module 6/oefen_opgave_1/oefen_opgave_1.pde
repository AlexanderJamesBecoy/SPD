void setup() {
  size(250, 200);
  
  fill(0);
  for(int i = 1; i <= 10; i++) {
    textSize(10);
    text(i, 24, i * 18);
    for(int j = 2; j <= 10; j++) {
      text(i * j, j * 18, i * 18);
    }
  }
}