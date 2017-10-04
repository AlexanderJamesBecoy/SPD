final boolean MEID = true;
final boolean JONG = !MEID;

void setup() {
  maakGezinnen(5);
}

void maakGezinnen(int aantal) {
  for(int aantalGezinnen = 0; aantalGezinnen < aantal; aantalGezinnen++) {
    println("Familie " + (aantalGezinnen + 1));
    maakGezin();
  }
}

void maakGezin() {
  while(maakKind() == MEID) {
    println("Het is een meisje");
  }
  println("Het is een jongen");
}

boolean maakKind() {
  if(random(0,1) < 0.5) {
    return MEID;
  } else {
    return JONG;
  }
}