boolean speel_craps() {
  boolean heeftGewonnen = false;
  int scoreEersteBeurt = gooiDubbeleDobbelStenen();
  //println("Eerste beurt: " + scoreEersteBeurt);
  if (scoreEersteBeurt == 7) {
    println("Ace!");
    heeftGewonnen = true;
  } else
  if (scoreEersteBeurt == 2 || scoreEersteBeurt == 3 || scoreEersteBeurt == 12) {
    println("Instant verloren!");
    heeftGewonnen = false;
  } else {
    //int aantalBeurten = 2;
    int score;
    boolean nietGescoord = true;
    while (nietGescoord) {
      score = gooiDubbeleDobbelStenen();
      if (score == scoreEersteBeurt) {
        println("Spare! Jouw score: " + score);
        //aantalBeurtenZien(aantalBeurten);
        nietGescoord = false;
        heeftGewonnen = true;
      } else if (score == 7) {
          println("Verloren. Jouw score: " + score);
          //aantalBeurtenZien(aantalBeurten);
          nietGescoord = false;
          heeftGewonnen = false;
      } else {
        //aantalBeurten++;
      }
    }
  }
  
  return heeftGewonnen;
}

void aantalBeurtenZien(int aantalBeurten) {
  println("Aantal beurten: " + aantalBeurten);
}