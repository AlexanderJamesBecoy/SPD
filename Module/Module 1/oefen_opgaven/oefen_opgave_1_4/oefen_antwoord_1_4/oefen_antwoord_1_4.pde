// Japanse vlag

int hoogteVlag = 200;
int breedteVlag = 2 * hoogteVlag;

int middelpuntX = breedteVlag / 2;
int middelpuntY = hoogteVlag / 2;

int diameterCirkel = breedteVlag / 3;

size(500, 500);

fill(255);
rect(0, 0, breedteVlag, hoogteVlag);

fill(#ff0000);
ellipse(middelpuntX, middelpuntY, diameterCirkel, diameterCirkel);

fill(255);
textSize(16);
textAlign(CENTER);
text("Kamikaze", middelpuntX, middelpuntY);