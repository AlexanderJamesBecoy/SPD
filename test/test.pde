float t;

void setup() {
  size(640, 480);
  background(20);
  strokeWeight(5);
  
  fill(color(255));
  
}

void draw() {
  
  translate(width / 2, height / 2);
  
  point(x(t), y(t));
  t++;
}

float x(float t) {
  return sin(t / 10) * 100 + sin(t / 15) * 100;
}

float y(float t) {
  return cos(t / 10) * 100;
}