/*println("Hard coded");

println("89 + 17 = ", (89 + 17));
println("125 - 23 = ", (125 - 23));
println("75 * 3 = ", (75 * 3));
println("45 % 7 = ", (45 % 7));
println("45 / 7 = ", (45 / 7));
println("45.0 / 7 = ", (45.0 / 7));

println("\nNu met een float array");
*/

float[] antwoorden = {
  (int)(89 + 17),
  (int)(125 - 23),
  (int)(75 * 3),
  (int)(45 % 7),
  (int)(45 / 7),
  45.0 / 7
};

void setup() {
  size(640, 480);
  background(255);
  stroke(5);
  fill(0);
  color(0);
  
  textSize(16);
  for(int i = 0; i < antwoorden.length; i++) {
    text(antwoorden[i], 16, 16 * (i + 1));
  }
}

void draw() {
  
}

/*for (int i = 0; i < antwoorden.length; i++) {
  println(antwoorden[i]);
}*/