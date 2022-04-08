/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/

int xGameWindow, yGameWindow, tileSize;
boolean gameHasStarted = false;

void drawGameWindow() {

  xGameWindow = width / 2;
  yGameWindow = height / 2;
  tileSize = xGameWindow / getGameTileMap()[0].length - 1;

  drawTileMap(xGameWindow / 2, yGameWindow / 2, tileSize);

  drawPlayerScore(xGameWindow / 2, yGameWindow / 2 - 30);

  if (amountOfPlayers == 2) {
    //drawCentipede(xGameWindow / 2 + (tileDiameter / 2) + 1, yGameWindow / 2 + (tileDiameter / 2));
  } else {
    drawCentipede(xGameWindow / 2 + (tileSize / 2) + 1, yGameWindow / 2 + (tileSize / 2) + 1, tileSize);
  }

  if (!gameHasStarted) {
    setBananaLocation();
    setCherryLocation();
    setChameleonLocation();

    gameHasStarted = true;
  }

  showamountOfChameleonsHit();
  showAmountOfBananasEaten();
  showAmountOfCherrysEaten();

  if (amountOfChameleonsHit == 9) {
    currentScreen++;
  }

  //Deze uncommenten om de chameleon en fruit te tekenen in de gameTileMap
  //drawFruit(xGameWindow / 2 + (tileSize / 2) + 1, yGameWindow / 2 + (tileSize / 2) + 1, tileSize);  
  //drawChameleons(xGameWindow / 2 + (tileSize / 2) + 1, yGameWindow / 2 + (tileSize / 2) + 1, tileSize);

  debugTileMap();
  //checkIfCentipedeIsStuck();
}

int getTileSize() {
  return tileSize;
}

int getXgameWindow() {
  return xGameWindow;
}

int getYgameWindow() {
  return yGameWindow;
}
