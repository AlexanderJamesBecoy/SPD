color[] colors = {#FF0000, #FFFF00, #00FF00, #00FFFF, #0000FF, #FF00FF, #FF0000, #FFFF00, #00FF00, #00FFFF, #0000FF, #FF00FF};  

void setup() {
  size(800, 800);
  //background(0);
  
  
  int[] dobbelWaardes = testDobbelsteen(1000);
  //println(dobbelWaardes);
  
  int[] dobbelWaardes2 = testTweeDobbelstenen(1000);
  //println(dobbelWaardes2);
  
  tekenGrafiek(dobbelWaardes2, 10, 10, 400, 300);
  tekenGrafiek(dobbelWaardes, 225, 325, 550, 450);
}