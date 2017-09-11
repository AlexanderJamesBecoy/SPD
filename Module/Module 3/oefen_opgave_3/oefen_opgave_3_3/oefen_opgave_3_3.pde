int rectX = 0, 
  rectY = 0, 
  rectWidth, rectHeight;

int credit = 25, 
  combo, currentX, currentY, timer;


void setup() {
  size(500, 500);

  rectWidth = (width / 10) * 8;
  rectHeight = height / 10;
  rectX = (width / 2) - (rectWidth / 2);
  rectY = (height / 2) - (rectHeight / 2);
}

void draw() {
  background(50);

  stroke(0);
  fill(#FFFFFF);
  textSize(16);
  textAlign(LEFT);
  text("Credits: " + credit, 10, 24);

  if (combo > 0) {
    fill(#ff0000);
    text(combo + " COMBO", 10, 48);
  }

  stroke(0);
  fill(#dddd00);
  rect(rectX, rectY, rectWidth, rectHeight);

  if (credit == 0) {
    fill(#ff0000);
    textSize(32);
    textAlign(CENTER);
    text("GAME OVER", width / 2, (height / 2) + 10);
  }
  
  if(timer >= 100) {
    timer = 0;
    credit--;
  }
  
  timer++;
}

void mouseClicked() {
  fill(#ff0000);
  textSize(32);
  textAlign(CENTER);

  if (credit > 0) {
    if (currentX != mouseX || currentY != mouseY) {
      if (mouseX % 2 == 0 && mouseY % 2 == 0) {
        println("EVEN!");
        combo++;
        switch(combo) {
        case 1:
          credit += 1;
          break;
        case 2:
          credit += 2;
          break;
        case 3:
          credit += 3;
          break;
        case 4:
          credit += 5;
          break;
        case 5:
        default:
          credit += 10;
        }
        text("(" + mouseX + " - " + mouseY + ")", width / 2, (height / 2) + 10);
      } else if (mouseX % 2 != 0 && mouseY % 2 != 0) {
        combo = 0;
        credit--;
        println("ONEVEN!");
        text(" ONEVEN ", width / 2, (height / 2) + 10);
      } else {
        combo = 0;
        if (mouseX % 2 == 0)
          text("(" + mouseX + " - ONEVEN)", width / 2, (height / 2) + 10);
        else
          text("(ONEVEN - " + mouseY + ")", width / 2, (height / 2) + 10);
      }
    } else {
      text("BEWEEG JE MUIS", width / 2, (height / 2) + 10);
    }
  }

  currentX = mouseX;
  currentY = mouseY;
}