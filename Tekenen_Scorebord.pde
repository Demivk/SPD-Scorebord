void tekenLijnen (float lijn1Y, float lijn2Y) {
  stroke(zwart);
  strokeWeight(2);

  line(0, lijn1Y, windowBreedte, lijn1Y);
  line(0, lijn2Y, windowBreedte, lijn2Y);
  line(middelpuntX, lijn1Y + 1, middelpuntX, lijn2Y - 1);
}

void tekenKnoppenScorebord (float knopX, float knopY, float breedte, float hoogte, float middenX, float middenY) {
  stroke(zwart);
  fill(80);

  rectMode(CORNER);
  for (int i = 0; i < aantalKnoppen; i++) {
    rect(knopX + breedte * i, knopY, breedte, hoogte);
  }

  textFont(arial);
  textSize(sizeTabelPunten);
  textAlign(CENTER, CENTER);
  fill(zwart);

  for (int i = 0; i < aantalKnoppen; i++) {
    text("+", middenX + breedte * i, middenY);
  }
}

void tekenPlayerNaam (String playerLinksNaam, String playerRechtsNaam, float playerLinksX, float playerRechtsX) {
  textFont(scorebord);
  textSize(sizePlayer);
  textAlign(CENTER, CENTER);
  fill(wit);

  text(playerLinksNaam, playerLinksX, offsetY);
  text(playerRechtsNaam, playerRechtsX, offsetY);
}

void tekenService (int kleurP1, int kleurP2) {
  float y1 = 28;
  float y2 = 63;
  float y3 = y1 + ((y2 - y1) / 2);

  textFont(scorebord);
  textSize(sizeService);
  textAlign(CENTER, CENTER);

  fill(wit);
  text("SERVICE", middelpuntX, offsetY);

  noStroke();
  fill(kleurP1);
  triangle(windowBreedte / 2 - 125, y1, windowBreedte / 2 - 125, y2, windowBreedte / 2 - 155, y3);    //Player 1

  fill(kleurP2);
  triangle(windowBreedte / 2 + 125, y1, windowBreedte / 2 + 125, y2, windowBreedte / 2 + 155, y3);    //Player 2
}

void tekenPunten (float p1X, float p2X) {
  textFont(scorebord);
  textSize(sizePunten);
  textAlign(CENTER, CENTER);

  fill(kleurP1);
  text(puntenP1, p1X, middelpuntY);

  fill(kleurP2);
  text(puntenP2, p2X, middelpuntY);
}

void tekenGames (float p1GamesX, float p2GamesX, float p1PuntenX, float p2PuntenX) {
  float gamesY = windowHoogte / 5;

  textFont(scorebord);
  textSize(sizeGames);

  fill(kleurP1);
  textAlign(CENTER, TOP);
  text(gamesP1, p1GamesX, gamesY);

  fill(kleurP2);
  textAlign(CENTER, TOP);
  text(gamesP2, p2GamesX, gamesY);

  if (toonWinnaarGameP1) {
    textSize(sizeGames - 5);
    textAlign(CENTER, TOP);
    fill(wit);
    text("GAME", p1PuntenX, gamesY);

    if (millis() - startTijd > tijdsduur) {
      toonWinnaarGameP1 = false;
    }
  }
  if (toonWinnaarGameP2) {
    textSize(sizeGames - 5);
    textAlign(CENTER, TOP);
    fill(wit);
    text("GAME", p2PuntenX, gamesY);

    if (millis() - startTijd > tijdsduur) {
      toonWinnaarGameP2 = false;
    }
  }
}

void tekenTabel(String playerLinksNaam, String playerRechtsNaam) {
  textFont(arial);
  textSize(sizeTabelPunten);
  textAlign(LEFT, CENTER);
  fill(zwart);

  text(playerLinksNaam + "        ", tabelX, tabelYP1);
  text(playerRechtsNaam + "        ", tabelX, tabelYP2);

  for (int i = 0; i < bestOf; i++) {
    text(punten[i][0], (tabelX + 125) + ((offsetX * 2.5) * i), tabelYP1);
    text(punten[i][1], (tabelX + 125) + ((offsetX * 2.5) * i), tabelYP2);
  }
}

void tekenExitTekst () {
  textFont(arial);
  textSize(sizeTabelPunten);
  textAlign(RIGHT, CENTER);

  fill(zwart);
  text("DRUK OP BACKSPACE", windowBreedte - tabelX, tabelYP1);
  text("OM TERUG TE GAAN", windowBreedte - tabelX, tabelYP2);
}