/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/

final int CENTIPEDE_HEAD_COLOR = #2e2e2e;
final int PLAYER_ONE_COLOR = #00FF00;
final int CENTIPEDE_TRAIL_COLOR = #e3e3e3;

final int[] CENTIPEDE_COLORS = {
  #2E2E2E, //[0] = CENTIPEDE_HEAD_COLOR
  #00FF00, //[1] = PLAYER_ONE_COLOR
  #E3E3E3  //[2] = CENTIPEDE_TRAIL_COLOR
};

void drawCentipede(int x, int y, int tileSize) {
  int[][] gameTileMap = getGameTileMap();
  
  for (int row = 0; row < gameTileMap.length; row++) {
    for (int colomn = 0; colomn < gameTileMap[row].length; colomn++) {
      switch (getGameTileMap()[row][colomn]) {
      case 1:
        //Centipede head
        drawCentipedeHead(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[0]);
        break;

      case 2:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 3:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 4:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 5:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 6:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 7:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 8:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 9:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 10:
        //Centipede body
        drawCentipedeBody(x + (colomn * tileSize), y +  (row * tileSize), tileSize, CENTIPEDE_COLORS[1]);
        break;

      case 14:
        //Centipede tail
        drawSquare(x + (colomn * tileSize) - (tileSize / 2) - 1, y +  (row * tileSize) - (tileSize / 2) - 1, tileSize + 1, CENTIPEDE_COLORS[2]);
        break;
      }
    }
  }
}

void drawCentipedeTrail(int x, int y, int tileSize, int fillColor) {
  drawSquare(x, y, tileSize, fillColor);
}

void drawCentipedeHead(int x, int y, int tileSize, int fillColor) {
  drawCircle(x, y, tileSize, fillColor);
}

void drawCentipedeBody(int x, int y, int tileSize, int fillColor) {
  drawCircle(x, y, tileSize, fillColor);
}
