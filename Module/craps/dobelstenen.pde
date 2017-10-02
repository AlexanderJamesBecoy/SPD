int gooiDobbelsteen() {
  int score = ceil(random(0, 6));
  return score;
}

int gooiDubbeleDobbelStenen() {
  int worp1 = gooiDobbelsteen();
  int worp2 = gooiDobbelsteen();
  int score = worp1 + worp2;
  return score;
}