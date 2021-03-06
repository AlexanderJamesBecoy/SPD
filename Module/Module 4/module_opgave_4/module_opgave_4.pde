// Moduleopgave 4
// Alexander James Becoy
// 18-9-2017

/*========================
 Global scopes
/*========================*/

// Variabelen voor de start-knop
int startX, startY, startWidth, startHeight;

// Variabelen voor de doelwit
float targetX, targetY;
boolean targetMoveRight = true;

// Een variabele om te zorgen dat de doelwit in een sinus beweging maakt.
// Zie functie _float moveTargetY()_ in Custom Functions()
float t;

// Met cellMax kan ik de kamer in 10x10 delen.
// Dus cellSize is de variabele voor de 1/10e van de breedte/hoogte van de kamer.
int cellSize, 
  cellMax = 10;

// De grootte van de font.
int textSize = 16;

// Kleuren in variabelen.
color white = #ffffff, 
  red = #ff0000, 
  green = #00ff00, 
  blue = #0000ff, 
  yellow = #ffff00,
  black = #000000;

// Check of de game start of stopt.
boolean gameState = false;

// Houdt het aantal score en mis.
int aantalScore, aantalMis;
// Een variabele voor de waarde waar jij op de doelwit heeft geklikt.
int precision = -1;

/*========================
 Setup()
/*========================*/
void setup() {
  size(500, 500);
  // Maak 10x10 grids
  cellSize = width / cellMax;

  // Definieer de grootte van de start-knop
  startWidth = cellSize * 2;
  startHeight = cellSize;
  startX = width / 2;
  startY = height - (startHeight / 2);

  smooth();
  frameRate(60);
}

/*========================
 Draw()
 ========================*/
void draw() {
  background(black);
  // De y-waarde van de doelwit wordt bepaald door de sinus-functie en het aantal t;
  targetY = moveTargetY(t);

  noStroke();

  // Bekijk of de game gestart is of niet.
  if (!gameState) {
    drawPower("START");
  } else {
    drawPower("STOP");
    moveTargetX();
    drawTarget(targetX, targetY);
  }

  // Als de muis over de knop hovert, zet dan de HAND cursor.
  // Als niet, dan teken de cross hair en haal de cursor weg.
  if (checkMouse(startX, startWidth, startY, startHeight)) {
    cursor(HAND);
  } else {
    noCursor();
    drawCrosshair();
  }

  // Teken het aantal score en mis.
  drawScore();

  // Zorgt dat de y-waarde van de doelwit in een sinus-golf beweegt.
  t++;
}

/*========================
 mousePressed()
 ========================*/
void mousePressed() {

  // Target, check of de game gestart is of niet.
  if (gameState) {
    // Bekijk of de muis niet over de start-knop is
    if (!checkMouse(startX, startWidth, startY, startHeight)) {
      // Als de muis op de bullseye klikt, plus 4 punten
      if (targetClicking(1)) {
        precision = 4;
        aantalScore += 4;
      // +3 punten
      } else if (targetClicking(2)) {
        precision = 3;
        aantalScore += 3;
      // +2 punten
      } else if (targetClicking(3)) {
        precision = 2;
        aantalScore += 2;
      // +1 punten
      } else if (targetClicking(4)) {
        precision = 1;
        aantalScore++;
      // Mis
      } else {
        precision = 0;
        aantalMis++;
      }
    }
  }

  // Game State
  // Verander de game state van START naar STOP, en andersom.
  if (checkMouse(startX, startWidth / 2, startY, startHeight / 2)) {
    gameState = !gameState;
    if (gameState) startTargetX();
  }
}

/*========================
 Custom functions()
 ========================*/

// Tekent de start-knop.
void drawPower(String power) {
  fill(green);
  rectMode(CENTER);
  rect(startX, startY, startWidth, startHeight);
  fill(black);
  textAlign(CENTER, BOTTOM);
  textSize(textSize);
  text(power, width / 2, height - textSize);
}

// De doelwit tekenen met behulp van de moveTargetX en de moveTargetY.
void drawTarget(float x, float y) {
  ellipseMode(CENTER);
  for (int i = 4; i > 0; i--) {
    if (i % 2 == 0) {
      fill(red);
    } else {
      fill(white);
    }
    ellipse(x, y, cellSize / 2 * i, cellSize / 2 * i);
  }
}

// Laat de doelwit in een horizontale lijn bewegen.
void moveTargetX() {
  if (targetMoveRight) {
    targetX += 2;
  } else {
    targetX -= 2;
  }

  if (targetX > width - cellSize || targetX < 0 + cellSize) {
    targetMoveRight = !targetMoveRight;
  }
}

// Tekent het crosshair
void drawCrosshair() {
  stroke(blue);
  strokeWeight(3);
  line(mouseX, mouseY - cellSize / 2, mouseX, mouseY - cellSize / 4);
  line(mouseX, mouseY + cellSize / 2, mouseX, mouseY + cellSize / 4);
  line(mouseX - cellSize / 2, mouseY, mouseX - cellSize / 4, mouseY);
  line(mouseX + cellSize / 2, mouseY, mouseX + cellSize / 4, mouseY);
}

// Tekent de aantal score en mis.
// Plus de precision
void drawScore() {
  fill(white);
  textAlign(LEFT, TOP);
  textSize(textSize);
  String aantalScoreString = "Aantal score: ";
  String aantalMisString = "Aantal mis: ";
  text(aantalScoreString + aantalScore + " " + aantalMisString + aantalMis, 0, 0);
  if (precision >= 0) {
    switch(precision) {
      case 4:
        fill(yellow);
        precisionText("Bullseye!");
        break;
      case 3:
        fill(blue);
        precisionText("Goed zo!");
        break;
      case 2:
        fill(green);
        precisionText("Netjes!");
        break;
      case 1:
        fill(white);
        precisionText("Nice");
        break;
      default:
        fill(red);
        precisionText("Helaas pindakaas");
    }
  }
}

// Bekijkt of de muis over een gegeven object hovert
boolean checkMouse(float xStart, float xSize, float yStart, float ySize) {
  if ((mouseX >= xStart - xSize / 2 && mouseX < xStart + xSize / 2) && (mouseY >= yStart - ySize / 2 && mouseY < yStart + ySize / 2))
    return true;
  else
    return false;
}

float moveTargetY(float t) {
  return sin(t / 15) * 100 + cellSize * 3;
}

// Maakt de x-waarde van de doelwit willekeurig.
// Plus, het bekijkt of de doelwit niet doorheen de horizontale borders spawnt.
void startTargetX() {
  targetX = random(width);
  if (targetX < cellSize) {
    targetX = cellSize;
  }
  if (targetX > width - cellSize) {
    targetX = width - cellSize;
  }
}

// Boolean voor doelwit klikken
boolean targetClicking(int size) {
  if (checkMouse(targetX, (cellSize / 2) * size, targetY, (cellSize /2) * size))
    return true;
  else
    return false;
}

// Precision text-opmaker
void precisionText(String compliment) {
  text(compliment + " +" + precision, 0, textSize);
}