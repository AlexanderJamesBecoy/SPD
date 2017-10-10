void tekenTekst(String tekst, float data, int positie)
{
  fill(255);
  noStroke();
  textSize(fontGrootte);
  textAlign(LEFT, CENTER);
  text(tekst + ": " + data, marge, marge + (fontGrootte * positie));
}

void tekenData(float[] cijfers)
{
  tekenTekst("Aantal cijfers", geefAantalToetsen(cijfers), 0);
  tekenTekst("Hoogste cijfer", geefHoogste(cijfers), 1);
  tekenTekst("Laagste cijfer", geefLaagste(cijfers), 2);
  tekenTekst("Gemiddelde", geefGemiddelde(cijfers), 3);
  tekenTekst("Aantal voldoende", geefAantalVoldoendes(cijfers), 4);
  tekenTekst("Aantal onvoldoende", geefAantalOnvoldoendes(cijfers), 5);
}

void tekenStatistiek(float[] cijfers, int aantalKolommen)
{
  noStroke();
  fill(200);
  float topMarge = fontGrootte * 6 + marge;
  float bottomMarge = fontGrootte + marge;
  
  float breedte = width - marge * 2;
  float hoogte = height - topMarge - bottomMarge;
  
  float breedteCijfer = breedte / 10;
  float breedteKolom = breedte / aantalKolommen;
  rect(marge, topMarge, breedte, hoogte);
  
  textAlign(LEFT, TOP);
  fill(255);
  for(int cijfer = 0; cijfer <= 10; cijfer++)
  {
    text(cijfer + ",0", breedteCijfer * cijfer, topMarge + hoogte);
  }
  
  int[] gedeeldeCijferlijst = deelCijfers(cijfers, aantalKolommen);
  float zoomfactor = (hoogte - 15) / max(gedeeldeCijferlijst);
  
  stroke(0);
  for(int aantalStaaf = 0; aantalStaaf < aantalKolommen; aantalStaaf++)
  {
    fill(willeKleurig());
    rect(aantalStaaf * breedteKolom + marge, topMarge + hoogte, breedteKolom, -gedeeldeCijferlijst[aantalStaaf] * zoomfactor);
  }
}

color willeKleurig() {
  int r = ceil(random(0, 255));
  int g = ceil(random(0, 255));
  int b = ceil(random(0, 255));
  return color(r, g, b);
}