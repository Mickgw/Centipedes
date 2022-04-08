/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/

final int NULL = 0;
final int BACKGROUND_COLOR = #9e9e9e;
int currentScreen = 0;

void setup() {
  fullScreen();  
}

void draw() {
  drawActiveWindow(currentScreen);
}

void drawActiveWindow(int screen) {
  background(BACKGROUND_COLOR);

  switch(screen) {
  case 0:
    drawStartWindow();
    break;

  case 1:
    drawGameWindow();
    break;

  case 2:
    drawEndWindow();
    break;

  case 3: 
    //Highscore
  }
}

void keyPressed() {
  if (currentScreen == 1) {
    moveCentipede();   
  }
}

void mousePressed() {
  switch(currentScreen) {
  case 0:
    mousePressedStartWindow();
    break;

  case 2:
    mousePressedEndWindow();
    break;
  }
}
