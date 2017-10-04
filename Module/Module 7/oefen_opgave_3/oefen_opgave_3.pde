String topMeisjesNamen2015[] = {
  "Emma",
  "Julia",
  "Sophie",
  "Anna",
  "Mila"
};

String topJongensNamen2015[] = {
  "Liam",
  "Sem",
  "Lucas",
  "Luuk",
  "Noah"
};

void setup() {
  drukAf("Top 5 meisjes: ", topMeisjesNamen2015);
  drukAf("Top 5 jongens: ", topJongensNamen2015);
}

void drukAf(String soortArray, String array[]) {
  println(soortArray);
  for(int arrayIndex = 0; arrayIndex < array.length; arrayIndex++) {
    println((arrayIndex + 1) + ". " + array[arrayIndex]);
  }
}