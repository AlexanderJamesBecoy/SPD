void setup() {
  float getal1 = 7.56;
  float getal2 = 7.498;
  float getal3 = 4.999;
  float getal4 = -2.00001;
  
  String tekst1 = formatteer(getal1);
  println(tekst1);
  
  String tekst2 = formatteer(getal2, 3);
  println(tekst2);
  
  String tekst3 = formatteer(getal3, 4);
  println(tekst3);
  
  String tekst4 = formatteer(getal4, 2);
  println(tekst4);
}

String formatteer(float getal, int aantalDecimalen) {
  
  int aantalDecimalenMacht = (int)pow(10, aantalDecimalen);
  int totaal = round(getal * 10);
  int basis = totaal / 10;
  int decimal = totaal % 10;
  String decimalen = "";
  
  decimal = decimal * aantalDecimalenMacht;
  if(decimal == 0) {
    for(int aantalDecimal = 0; aantalDecimal < aantalDecimalen - 1; aantalDecimal++) {
      decimalen += "0";
    }
  }
  return basis + "," + decimal + decimalen;
}

String formatteer(float getal) {
  return formatteer(getal, 1);
}