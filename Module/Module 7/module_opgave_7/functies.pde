int geefAantalToetsen(float[] cijfers)
{
  return cijfers.length;
}

float geefHoogste(float[] cijfers)
{
  float hoogste = cijfers[0];
  for(int cijferIndex = 1; cijferIndex < cijfers.length; cijferIndex++) {
    if(cijfers[cijferIndex] > hoogste) {
      hoogste = cijfers[cijferIndex];
    }
  }
  return hoogste;
}

float geefLaagste(float[] cijfers)
{
  float laagste = cijfers[0];
  for(int cijferIndex = 1; cijferIndex < cijfers.length; cijferIndex++) {
    if(cijfers[cijferIndex] < laagste) {
      laagste = cijfers[cijferIndex];
    }
  }
  return laagste;
}

float geefGemiddelde(float[] cijfers)
{
  float totaalCijfer = 0;
  for(int cijfer = 0; cijfer < cijfers.length; cijfer++)
  {
    totaalCijfer += cijfers[cijfer];
  }
  float gemiddelde = totaalCijfer / geefAantalToetsen(cijfers);
  return gemiddelde;
}

int geefAantalVoldoendes(float[] cijfers)
{
  int aantalVoldoendes = 0;
  for(int cijfer = 0; cijfer < cijfers.length; cijfer++)
  {
    if(cijfers[cijfer] >= 5.5) aantalVoldoendes++;
  }
  return aantalVoldoendes;
}

int geefAantalOnvoldoendes(float[] cijfers)
{
  int aantalOnvoldoendes = 0;
  for(int cijfer = 0; cijfer < cijfers.length; cijfer++)
  {
    if(cijfers[cijfer] < 5.5) aantalOnvoldoendes++;
  }
  return aantalOnvoldoendes;
}

float[] leesBestand(String[] string_cijferlijst)
{
  float[] float_cijferlijst = new float[stringCijferlijst.length];
  
  for(int cijfer = 0; cijfer < string_cijferlijst.length; cijfer++)
  {
    float_cijferlijst[cijfer] = float(string_cijferlijst[cijfer]);
  }
  
  return float_cijferlijst;
}

int[] deelCijfers(float[] cijfers, int aantalKolommen)
{
  int[] gedeeldeCijfer = new int[aantalKolommen];
  
  for (int cijfer = 0; cijfer < cijfers.length; cijfer++)
  {
    //int helftAfgerond = aantalKolommen / 2;
    //int afgerond = round((cijfers[cijfer] * aantalKolommen) / (aantalKolommen / 2));
    //int index = afgerond - 1;
    //gedeeldeCijfer[index] = gedeeldeCijfer[index] + 1;
    float aantalVerschil = aantalKolommen / 10;
    int cijferAfgerond = round(aantalVerschil * cijfers[cijfer]);
    int index = cijferAfgerond - 1;
    gedeeldeCijfer[index] = cijferAfgerond;
  }
  
  return gedeeldeCijfer;
}