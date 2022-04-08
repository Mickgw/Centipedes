/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/

int amountOfChameleons;
PImage chameleon;

void drawChameleons(int x, int y, int tileSize) {
  int[][] gameTileMap = getGameTileMap();

  for (int row = 0; row < gameTileMap.length; row++) {
    for (int colomn = 0; colomn < gameTileMap[row].length; colomn++) {
      switch (getGameTileMap()[row][colomn]) {
      case 13: 
        drawChameleon(x + (colomn * tileSize) - (tileSize / 2), y +  (row * tileSize) - (tileSize / 2), tileSize);
        break;
      }
    }
  }
}

void drawChameleon(int x, int y, int tileSize) { 
  chameleon = loadImage("chameleon.png");
  image(chameleon, x, y, tileSize - 1, tileSize - 1);
}

void setChameleonLocation() {
  int ChamleonsInGame = 0;

  while (ChamleonsInGame < getAmountOfChameleons()) {
    int row = getRndRowLocation();
    int colomn = getRndColomnLocation();

    if (getGameTileMap()[row][colomn] == 0) {
      getGameTileMap()[row][colomn] = 13;
      ChamleonsInGame++;
    }
  }
  println("Aantal geplaatste chameleons zijn: " + ChamleonsInGame);
}


//Kijkt hoeveel nul posities er nog zijn en plaatst door een berekening een aantal chameleons
int getAmountOfChameleons() {
  int[][] gameTileMap = getGameTileMap();

  int amountOfZeros = 0;

  for (int row = 0; row < gameTileMap.length; row++) {
    for (int colomn = 0; colomn < gameTileMap[row].length; colomn++) {
      if (gameTileMap[row][colomn] == 0) {
        amountOfZeros++;
      }
    }
  }

  //Ik heb gekozen om op een hoger procent dan 10 chameleons te tekenen. Als je alle blokjes had gehad had je niet genoeg chameleons geraakt en was je centipede nog te lang
  amountOfChameleons = amountOfZeros / 8;
  round(amountOfChameleons);

  return amountOfChameleons;
}
