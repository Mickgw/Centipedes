/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/

int amountOfPlayers = 1;

int buttonWidth, buttonHeight, plusButton_Xpos, minusButton_Xpos, yPosButtonAndText, amountOfPlayersCount_Xpos;

void drawAmountOfPlayersOption(int x, int y) {
  buttonWidth = 40;
  buttonHeight = 40;
  plusButton_Xpos = x - TEXTMARGINRIGHT + (buttonWidth * 3);
  minusButton_Xpos = x - TEXTMARGINRIGHT;
  amountOfPlayersCount_Xpos = x + (buttonWidth * 2) - buttonWidth / 4;
  yPosButtonAndText = y + buttonHeight + (buttonHeight / 2);

  drawText(x, y, "Aantal spelers: ", FONTSIZE, TEXTMARGINRIGHT, FONTCOLOR);  
  drawButton("-", minusButton_Xpos, yPosButtonAndText, buttonWidth, buttonHeight, BUTTONPROPERTIES[1], BUTTONPROPERTIES[0], false);
  drawText(amountOfPlayersCount_Xpos, yPosButtonAndText + buttonHeight / 2, str(getAmountOfPlayers()), FONTSIZE, TEXTMARGINRIGHT, FONTCOLOR);  
  drawButton("+", plusButton_Xpos, yPosButtonAndText, buttonWidth, buttonHeight, BUTTONPROPERTIES[1], BUTTONPROPERTIES[0], false);
}

int getAmountOfPlayers() {
  return amountOfPlayers;
}

int[] getAmountOfPlayerButton_Coordinates() {
  int[] coordinates = new int[3];

  coordinates[0] = plusButton_Xpos;
  coordinates[1] = minusButton_Xpos;
  coordinates[2] = yPosButtonAndText;

  return coordinates;
}

void amountOfPlayersPressed() {
  if ((mouseX >= getAmountOfPlayerButton_Coordinates()[0] && mouseX <= getAmountOfPlayerButton_Coordinates()[0] + buttonWidth) && (mouseY >= getAmountOfPlayerButton_Coordinates()[2] && mouseY <= getAmountOfPlayerButton_Coordinates()[2] + buttonHeight)) {
    if (getAmountOfPlayers() == 1) {
      amountOfPlayers++;
    }
  }  
  if ((mouseX >= getAmountOfPlayerButton_Coordinates()[1] && mouseX <= getAmountOfPlayerButton_Coordinates()[1] + buttonWidth) && (mouseY >= getAmountOfPlayerButton_Coordinates()[2] && mouseY <= getAmountOfPlayerButton_Coordinates()[2] + buttonHeight)) {
    if (getAmountOfPlayers() == 2) {
      amountOfPlayers--;
    }
  }
}
