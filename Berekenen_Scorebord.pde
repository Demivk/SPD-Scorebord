void resetSpel () {
  //Alles naar 0
  for (int i = 0; i < punten.length; i++) {
    for (int j = 0; j < punten[0].length; j++) {
      punten[i][j] = 0;
    }
  }
  puntenP1 = 0;
  puntenP2 = 0;
  gamesP1 = 0;
  gamesP2 = 0;
  totaalPuntenPlayers = 0;

  gameNummer = 0;
  bestOf = 0;
  totPunten = 0;
  benodigdeGames = 0;

  //Randomize service opnieuw
  serviceRandom = random(0, 1);

  //Terug naar eerste positie
  playerLinksX = offsetX * 8;
  playerRechtsX = windowBreedte - offsetX * 8;

  puntenP1X = windowBreedte / 4;
  puntenP2X = windowBreedte - windowBreedte / 4;
  gamesP1X = middelpuntX - offsetX * 2;
  gamesP2X = middelpuntX + offsetX * 2;

  kleurP1 = rood;
  kleurP2 = blauw;
}

void berekenGamesP1 () {
  if (puntenP1 == totPunten && puntenP2 <= totPunten - 2) {
    punten[gameNummer][0] = puntenP1;
    punten[gameNummer][1] = puntenP2;
    gameNummer++;
    gamesP1++;
    wisselKant(kleurP1, kleurP2);

    toonWinnaarGameP1 = true;
    startTijd = millis();

    puntenP1 = 0;
    puntenP2 = 0;
  }
  if (puntenP1 > totPunten && puntenP1 - puntenP2 == 2) {
    punten[gameNummer][0] = puntenP1;
    punten[gameNummer][1] = puntenP2;
    gameNummer++;
    gamesP1++;
    wisselKant(kleurP1, kleurP2);

    toonWinnaarGameP1 = true;
    startTijd = millis();

    puntenP1 = 0;
    puntenP2 = 0;
  }
  if (puntenP1 == maxPunten) {
    punten[gameNummer][0] = puntenP1;
    punten[gameNummer][1] = puntenP2;
    gameNummer++;
    gamesP1++;
    wisselKant(kleurP1, kleurP2);

    toonWinnaarGameP1 = true;
    startTijd = millis();

    puntenP1 = 0;
    puntenP2 = 0;
  }
}

void berekenGamesP2 () {
  if (puntenP2 == totPunten && puntenP1 <= totPunten - 2) {
    punten[gameNummer][0] = puntenP1;
    punten[gameNummer][1] = puntenP2;
    gameNummer++;
    gamesP2++;
    wisselKant(kleurP1, kleurP2);

    toonWinnaarGameP2 = true;
    startTijd = millis();

    puntenP1 = 0;
    puntenP2 = 0;
  }
  if (puntenP2 > totPunten && puntenP2 - puntenP1 == 2) {
    punten[gameNummer][0] = puntenP1;
    punten[gameNummer][1] = puntenP2;
    gameNummer++;
    gamesP2++;
    wisselKant(kleurP1, kleurP2);

    toonWinnaarGameP2 = true;
    startTijd = millis();

    puntenP1 = 0;
    puntenP2 = 0;
  }
  if (puntenP2 == maxPunten) {
    punten[gameNummer][0] = puntenP1;
    punten[gameNummer][1] = puntenP2;
    gameNummer++;
    gamesP2++;
    wisselKant(kleurP1, kleurP2);

    toonWinnaarGameP2 = true;
    startTijd = millis();

    puntenP1 = 0;
    puntenP2 = 0;
  }
}