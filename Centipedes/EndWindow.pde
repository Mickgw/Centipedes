/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/
final int BUTTONWIDTH_PLAYAGAIN = 400;
final int BUTTONHEIGHT_PLAYAGAIN = 75;

int playAgain_Xpos, playAgain_Ypos;

void drawEndWindow() {
  Roboto = createFont("Roboto-Medium.ttf", 100); //Font
  Background = loadImage("AchtergrondStartscherm.jpg"); //Achtergrond afbeelding

  image(Background, 0, 0, displayWidth, displayHeight);

  int xTextPos = width / 2;
  int yTextPos = height / 3;
  
  playAgain_Xpos = xTextPos - (BUTTONWIDTH_PLAYAGAIN / 2);
  playAgain_Ypos = height / 2;

  int gameOverTextXpos = xTextPos - 45;
  int endScoreXpos = xTextPos - (TEXTMARGINRIGHT / 3) + 10;

  drawText(gameOverTextXpos, yTextPos, "GAME OVER", FONTSIZE + 10, 100, #FFFFFF);
  drawText(endScoreXpos, yTextPos + 100, "Jouw score was: " + playerScore, FONTSIZE - 5, 100, #FFFFFF);

  //Knop waardoor het spel opnieuw gespeeld kan worden
  drawButton("Speel opnieuw", playAgain_Xpos, playAgain_Ypos, BUTTONWIDTH_PLAYAGAIN, BUTTONHEIGHT_PLAYAGAIN, BUTTONPROPERTIES[1], 30, false);
}

void mousePressedEndWindow() {
  if (mouseX >= playAgain_Xpos && mouseX <= playAgain_Xpos + BUTTONWIDTH_PLAYAGAIN && mouseY >= playAgain_Ypos && mouseY <= playAgain_Ypos + BUTTONHEIGHT_PLAYAGAIN) {
    resetPlayerScore();
    resetAmountOfChameleonsHit();
    resetAmountOfBananasEaten();
    resetAmountOfCherrysEaten();

    currentScreen = 0;
  }
}
