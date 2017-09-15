// Moduleopgave 3
// Alexander James Becoy
// 13-9-2017

int robotX, robotY;
int boxLength;
int payloadX, payloadY;
boolean retrieve = false;

void setup() {
  size(600, 600);
  
  boxLength = width / 10;
  
  robotX = width / 2;
  robotY = height / 2;
  
  payloadX = boxLength * (int)random(10);
  payloadY = boxLength * (int)random(10);
}

void draw() {
  background(0);
  
  // Decoratie
  for(int i = 0; i < 10; i++) {
    stroke(#222222);
    line(boxLength * i, 0, boxLength * i, height);
  }
  for(int i = 0; i < 10; i++) {
    line(0, boxLength * i, width, boxLength * i);
  }
  
  noStroke();
  fill(#ff0000);
  rect(robotX, robotY, boxLength, boxLength);
  
  if(retrieve) {
    fill(#FFFFFF);
    payloadX = robotX;
    payloadY = robotY;
  } else {
    fill(#AAAAAA);
  }
  
  ellipseMode(LEFT);
  ellipse(payloadX, payloadY, boxLength, boxLength);
  
}

void keyPressed() {
  if(key == CODED)
  {
    if (keyCode == UP && robotY > 0)
      robotY -= boxLength;
    else if (keyCode == DOWN && robotY < height - boxLength)
      robotY += boxLength;
    else if (keyCode == LEFT && robotX > 0)
      robotX -= boxLength;
    else if(keyCode == RIGHT && robotX < width - boxLength)
      robotX += boxLength;
  }
  else if (key == 10 && robotX == payloadX && robotY == payloadY)
    retrieve = !retrieve;
}