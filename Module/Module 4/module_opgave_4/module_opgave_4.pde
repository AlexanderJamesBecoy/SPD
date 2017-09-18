// Moduleopgave 4
// Alexander James Becoy
// 18-9-2017

// Global scope
int startX, startY, startWidth, startHeight;
int targetX, targetY;
boolean targetMoveRight = true,
        targetMoveDown = false;

int cellSize, 
  cellMax = 10;

int textSize = 16;

color white = #ffffff, 
  red = #ff0000, 
  green = #00ff00, 
  blue = #0000ff, 
  black = #000000;

// Check of de game start of stopt.
boolean gameState = false;

int aantalScore, aantalMis;

// Setup()
void setup() {
  size(500, 500);
  cellSize = width / cellMax;

  startWidth = cellSize * 2;
  startHeight = cellSize;
  startX = width / 2;
  startY = height - (startHeight / 2);

  targetX = cellSize;
  targetY = height / 4;
}

// Draw()
void draw() {
  background(black);

  noStroke();

  if (!gameState) {
    drawPower("START");
  } else {
    drawPower("STOP");
  }

  if (gameState) {
    drawTarget(targetX, targetY);
    for() {
      
    }
  }

  if (checkMouse(startX, startWidth / 2, startY, startHeight / 2)) {
    cursor(HAND);
  } else {
    noCursor();
    drawCrosshair();
  }

  drawScore();
}

// mousePressed()
void mousePressed() {

  // Target
  if (gameState) {
    if (!checkMouse(startX, startWidth / 2, startY, startHeight / 2)) {
      if (checkMouse(targetX, cellSize, targetY, cellSize)) {
        aantalScore++;
      } else {
        aantalMis++;
      }
    }
  }
  
  // Game State
  if (checkMouse(startX, startWidth / 2, startY, startHeight / 2)) {
      gameState = !gameState;
    }
  
}

// Custom functions()
void drawPower(String power) {
  fill(green);
  rectMode(CENTER);
  rect(startX, startY, startWidth, startHeight);
  fill(black);
  textAlign(CENTER, BOTTOM);
  textSize(textSize);
  text(power, width / 2, height - textSize);
}

void drawTarget(int x, int y) {
  ellipseMode(CENTER);
  fill(red);
  ellipse(x, y, cellSize * 2, cellSize * 2);
  fill(white);
  ellipse(x, y, cellSize / 2 * 3, cellSize / 2 * 3);
  fill(red);
  ellipse(x, y, cellSize, cellSize);
  fill(white);
  ellipse(x, y, cellSize / 2, cellSize / 2);
}

void moveTarget() {
  if (targetMoveRight) {
    targetX += 2;
  } else {
    targetX -= 2;
  }
  
  if (targetMoveDown) {
    targetY += 2;
  } else {
    targetY -= 2;
  }

  if (targetY < (height / 4) - cellSize || targetY > (height / 4) + cellSize) {
    targetMoveDown = !targetMoveDown;
  }
  if (targetX > width - cellSize || targetX < 0 + cellSize) {
    targetMoveRight = !targetMoveRight;
  }
}

void drawCrosshair() {
  stroke(blue);
  strokeWeight(3);
  line(mouseX, mouseY - cellSize / 2, mouseX, mouseY - cellSize / 4);
  line(mouseX, mouseY + cellSize / 2, mouseX, mouseY + cellSize / 4);
  line(mouseX - cellSize / 2, mouseY, mouseX - cellSize / 4, mouseY);
  line(mouseX + cellSize / 2, mouseY, mouseX + cellSize / 4, mouseY);
}

void drawScore() {
  fill(white);
  textAlign(LEFT, TOP);
  textSize(textSize);
  String aantalScoreString = "Aantal score: ";
  String aantalMisString = "Aantal mis: ";
  text(aantalScoreString + aantalScore + " " + aantalMisString + aantalMis, 0, 0);
}

boolean checkMouse(int xStart, int xSize, int yStart, int ySize) {
  if ((mouseX >= xStart - xSize && mouseX < xStart + xSize) && (mouseY >= yStart - ySize && mouseY < yStart + ySize))
    return true;
  else
    return false;
}