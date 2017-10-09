int[] testDobbelsteen(int aantal)
{
  int[] waardes = new int[6];
  
  for (int worp = 0; worp < aantal; worp++)
  {
    int aantalOgen = dobbel();
    int index = aantalOgen - 1;
    waardes[index] = waardes[index] + 1;
  }
  
  return waardes;
}

int dobbel()
{
  return ceil(random(0,6));
}

int[] testTweeDobbelstenen(int aantal)
{
  int[] waardes = new int[11];
  
  for (int worp = 0; worp < aantal; worp++)
  {
    int aantalOgen = dobbel() + dobbel();
    int index = aantalOgen - 2;
    waardes[index] = waardes[index] + 1;
  }
  
  return waardes;
}

void tekenGrafiek(int[] dobbelWaardes, int x, int y, int breedte, int hoogte)
{
  float breedteStaaf = float(breedte) / dobbelWaardes.length;
  float zoomfactor = float(hoogte - 15) / max(dobbelWaardes);
  fill(100);
  rect(x, y, breedte, hoogte);
  
  for(int aantalStaaf = 0; aantalStaaf < dobbelWaardes.length; aantalStaaf++)
  {
    fill(willeKleurig());
    rect(aantalStaaf * breedteStaaf + x, y + hoogte, breedteStaaf, -dobbelWaardes[aantalStaaf] * zoomfactor);
  }
}

color willeKleurig() {
  int r = round(random(0, 255));
  int g = round(random(0, 255));
  int b = round(random(0, 255));
  
  return color(r, g, b);
}