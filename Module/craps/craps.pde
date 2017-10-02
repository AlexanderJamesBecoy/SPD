
void setup() {
  int aantalGewonnen = 0;
  int aantalGamesSpelen = 1000000;
  
  for(int aantalGames = 0; aantalGames < aantalGamesSpelen; aantalGames++) {
    if(speel_craps()) {
      aantalGewonnen++;
    }
  }
  
  println("Aantal gewonnen: " + aantalGewonnen);
  println("Aantal verloren: " + (aantalGamesSpelen - aantalGewonnen));
}