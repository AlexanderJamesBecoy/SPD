PFont myFont;

void setup() {
  //background(255);
  size(800, 400);
  noStroke();
  
  fill(255);
  rect(0, 0, width, height);
  fill(color(255, 0, 0));
  ellipse(width / 2, height / 2, width / 3, width / 3);
  
  fill(255);
  textAlign(CENTER);
  textSize(32);
  
  myFont = createFont("Comic Sans", (width / 100) * 2);
  textFont(myFont);
  text("For the glorious Nippon", width / 2, height / 2);
}