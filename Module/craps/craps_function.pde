void speel_craps() {
  int scoreEersteBeurt = gooiDobbelsteen();
  switch(scoreEersteBeurt) {
    case 7:
      println("Ace! Your score: " + scoreEersteBeurt);
      break;
    case 2:
    case 3:
    case 12:
      println("Instant lose! Your score: " + scoreEersteBeurt);
      break;
    default:
      int aantalBeurten = 2;
      int score;
      boolean nietGescoord = true;
      while(nietGescoord) {
        score = gooiDobbelsteen();
        if(score == scoreEersteBeurt) {
          println("You win! Your score: " + score);
          aantalBeurtenZien(aantalBeurten);
          nietGescoord = false;
        } else
        if(score == 7) {
          println("You hit rock bottom. Your score: " + score);
          aantalBeurtenZien(aantalBeurten);
          nietGescoord = false;
        } else {
          aantalBeurten++;
        }
      }
  }
}

void aantalBeurtenZien(int aantalBeurten) {
  println("Aantal beurten: " + aantalBeurten);
}