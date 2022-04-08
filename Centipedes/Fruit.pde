/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/

final int[] AMOUNT_OF_BANANAS = { 10, 15, 20, 25, 30 };  

int amountOfBananas = 20; //Standard option
int amountOfCherrys = 0;

PImage banana, cherry;


void drawFruit(int x, int y, int tileSize) { 
  int[][] gameTileMap = getGameTileMap();

  for (int row = 0; row < gameTileMap.length; row++) {
    for (int colomn = 0; colomn < gameTileMap[row].length; colomn++) {
      switch (getGameTileMap()[row][colomn]) {
      case 11: 
        drawBanana(x + (colomn * tileSize) - (tileSize / 2), y +  (row * tileSize) - (tileSize / 2), tileSize);
        break;
      case 12: 
        drawCherry(x + (colomn * tileSize) - (tileSize / 2), y +  (row * tileSize) - (tileSize / 2), tileSize);
        break;
      }
    }
  }
}

//============Draw fruit methods============================================//

void drawBanana(int x, int y, int tileSize) {
  banana = loadImage("banana.png");
  image(banana, x, y, tileSize - 1, tileSize - 1);
}

void drawCherry(int x, int y, int tileSize) {
  cherry = loadImage("cherry.png");
  image(cherry, x, y, tileSize - 1, tileSize - 1);
}

//===========Set fruit locations=============================================//
void setBananaLocation() {
  int bananasInGame = 0;

  while (bananasInGame < getAmountOfBananas()) {
    int row = getRndRowLocation();
    int colomn = getRndColomnLocation();

    //Tekent de hoeveelheid gekozen bananen op een random plek
    if (getGameTileMap()[row][colomn] == 0) {
      getGameTileMap()[row][colomn] = 11;
      bananasInGame++;
    }
  }
  println("Aantal geplaatste bananen zijn: " + bananasInGame);
}

void setCherryLocation() {
  int CherrysInGame = 0;

  while (CherrysInGame < getAmountOfCherrys()) {
    int row = getRndRowLocation();
    int colomn = getRndColomnLocation();

    //Tekent de hoeveelheid gekozen bananen op een random plek
    if (getGameTileMap()[row][colomn] == 0) {
      getGameTileMap()[row][colomn] = 12;
      CherrysInGame++;
    }
  }
  println("Aantal geplaatste cherrys zijn: " + CherrysInGame);
}

//===============Get amount of Cherrys===================================================//
int getAmountOfCherrys() {
  int[][] gameTileMap = getGameTileMap();
  int amountOfZeros = 0;

  for (int row = 0; row < gameTileMap.length; row++) {
    for (int colomn = 0; colomn < gameTileMap[row].length; colomn++) {
      if (gameTileMap[row][colomn] == 0) {
        amountOfZeros++;
      }
    }
  }
  amountOfCherrys = amountOfZeros / 8;
  round(amountOfCherrys);

  return amountOfCherrys;
}

//===================Get random locatie in de gameTileMap=======================================//
//Kiest een random row
int getRndRowLocation() {
  int row = int(random(0, getGameTileMap().length));
  return row;
}

//Kiest een random locatie in de row
int getRndColomnLocation() {
  int colomn = int(random(0, getGameTileMap()[0].length));
  return colomn;
}


/*===========================================================================Fruit opties in het startscherm===============================================================================================*/

int[] getButtonXpos_Ypos_FruitOptions() {

  int x = width / 2 - (TEXTMARGINRIGHT);
  int y = height / 4;

  int[] coordinates = new int[2];

  coordinates[0] = x - BUTTONPROPERTIES[3] - (BUTTONPROPERTIES[3] / 3);
  coordinates[1] = y + TEXTMARGINTOP + FONTSIZE;

  return coordinates;
} 

void drawFruitOptions(int x, int y) { 
  drawText(x, y, "Aantal bananen: ", FONTSIZE, TEXTMARGINRIGHT, FONTCOLOR);

  for (int i = 0; i < AMOUNT_OF_BANANAS.length; i++) {
    if (amountOfBananas == AMOUNT_OF_BANANAS[i]) {
      drawButton(str(AMOUNT_OF_BANANAS[i]), getButtonXpos_Ypos_FruitOptions()[0] + (i * BUTTONPROPERTIES[3]), getButtonXpos_Ypos_FruitOptions()[1], BUTTONPROPERTIES[3], BUTTONPROPERTIES[4], #00FF00, 30, false);
    } else {
      drawButton(str(AMOUNT_OF_BANANAS[i]), getButtonXpos_Ypos()[0] + (i * BUTTONPROPERTIES[3]), getButtonXpos_Ypos_FruitOptions()[1], BUTTONPROPERTIES[3], BUTTONPROPERTIES[4], #FFFFFF, 30, false);
    }
  }
}

void fruitOptionsPressed() {  
  for (int i = 0; i < AMOUNT_OF_BANANAS.length; i++) {
    if (mouseX >= getButtonXpos_Ypos()[0] + BUTTONPROPERTIES[3] * i && mouseX <= getButtonXpos_Ypos()[0] + BUTTONPROPERTIES[3] + (i * BUTTONPROPERTIES[3]) && mouseY >= getButtonXpos_Ypos_FruitOptions()[1] && mouseY <= getButtonXpos_Ypos_FruitOptions()[1] + BUTTONPROPERTIES[4]) {
      amountOfBananas = AMOUNT_OF_BANANAS[i];
      println(amountOfBananas);
    }
  }
}

int getAmountOfBananas() {
  return amountOfBananas;
}
