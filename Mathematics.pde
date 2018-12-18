Game game;

void setup(){
  size(1000,1000);
  textAlign(CENTER,CENTER);
  textSize(48);
  
  game = new Game("DIVISION",10,100,1,10);
  game.background = color(250,250,100);
}

void draw(){
  game.display();
}

void keyPressed(){
  game.interact();
}