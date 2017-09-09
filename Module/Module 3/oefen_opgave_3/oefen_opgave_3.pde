void setup() {
  size(500, 300);
}

void draw() {
  background(150);
  
  fill(0);
  textSize(12);
  text("Seconds: " + millis(), 4, 16);
  
  text("MouseX: " + mouseX, 4, 32);
  text("MouseY: " + mouseY, 4, 48);
}

void mouseClicked() {
  println("CLICK!");
}