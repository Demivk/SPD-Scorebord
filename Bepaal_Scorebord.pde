void bepaalServiceStart () {  //Randomized service begin v.d. wedstrijd
  if (serviceRandom < 0.5) {
    serviceKleurP1 = wit;
    serviceKleurP2 = 125;
  }
  if (serviceRandom >= 0.5) {
    serviceKleurP1 = 125;
    serviceKleurP2 = wit;
  }
}

void bepaalService () {
  if (totPunten == 11) {
    if (totaalPuntenPlayers % 1 == 0 && puntenP1 >= 10 && puntenP2 >= 10) {    //Om en om serveren
      if (serviceKleurP1 == wit && serviceKleurP2 == 125) {
        serviceKleurP1 = 125;
        serviceKleurP2 = wit;
      } else {
        serviceKleurP1 = wit;
        serviceKleurP2 = 125;
      }
    } else {
      if (totaalPuntenPlayers % 2 == 0) {                                      //Om de twee serveren
        if (serviceKleurP1 == wit && serviceKleurP2 == 125) {
          serviceKleurP1 = 125;
          serviceKleurP2 = wit;
        } else {
          serviceKleurP1 = wit;
          serviceKleurP2 = 125;
        }
      }
    }
  }

  if (totPunten == 21) {
    if (totaalPuntenPlayers % 1 == 0 && puntenP1 >= 20 && puntenP2 >= 20) {    //Om en om serveren
      if (serviceKleurP1 == wit && serviceKleurP2 == 125) {
        serviceKleurP1 = 125;
        serviceKleurP2 = wit;
      } else {
        serviceKleurP1 = wit;
        serviceKleurP2 = 125;
      }
    } else {
      if (totaalPuntenPlayers % 5 == 0) {                                      //Om de vijf serveren
        if (serviceKleurP1 == wit && serviceKleurP2 == 125) {
          serviceKleurP1 = 125;
          serviceKleurP2 = wit;
        } else {
          serviceKleurP1 = wit;
          serviceKleurP2 = 125;
        }
      }
    }
  }
}

boolean bepaalGekliktLinks (float knopX, float knopY, float breedte, float hoogte) {
  if (mouseX > knopX && mouseX < knopX + breedte && mouseY > knopY && mouseY < knopY + hoogte) {
    return true;
  } else {
    return false;
  }
}

boolean bepaalGekliktRechts (float knopX, float knopY, float breedte, float hoogte) {
  if (mouseX > knopX + breedte && mouseX < windowBreedte && mouseY > knopY && mouseY < knopY + hoogte) {
    return true;
  } else {
    return false;
  }
}

void wisselKant(int kleurP1, int kleurP2) {
  if (scherm == 2) {

    //Wissel player namen
    if (playerLinksX == offsetX * 8 && playerRechtsX == windowBreedte - offsetX * 8) {
      playerLinksX = windowBreedte - offsetX * 8;
      playerRechtsX = offsetX * 8;
    } else {
      playerLinksX = offsetX * 8;
      playerRechtsX = windowBreedte - offsetX * 8;
    }

    //Wissel kleuren scores
    if (kleurP1 == rood && kleurP2 == blauw) {
      kleurP1 = blauw;
      kleurP2 = rood;
    } else {
      kleurP1 = rood;
      kleurP2 = blauw;
    }

    //Wissel punten
    if (puntenP1X == windowBreedte / 4 && puntenP2X == windowBreedte - windowBreedte / 4) {
      puntenP1X = windowBreedte - windowBreedte / 4;
      puntenP2X = windowBreedte / 4;
    } else {
      puntenP1X = windowBreedte / 4;
      puntenP2X = windowBreedte - windowBreedte / 4;
    }

    //Wissel games
    if (gamesP1X == middelpuntX - offsetX * 2 && gamesP2X == middelpuntX + offsetX * 2) {
      gamesP1X = middelpuntX + offsetX * 2;
      gamesP2X = middelpuntX - offsetX * 2;
    } else {
      gamesP1X = middelpuntX - offsetX * 2;
      gamesP2X = middelpuntX + offsetX * 2;
    }

    //Wissel service
    if (serviceKleurP1 == wit && serviceKleurP2 == 125) {
      serviceKleurP1 = 125;
      serviceKleurP2 = wit;
    } else {
      serviceKleurP1 = wit;
      serviceKleurP2 = 125;
    }
    puntenP1 = 0;
    puntenP2 = 0;
  }
}

void bepaalWinnaar () {
  benodigdeGames = (bestOf + 1) / 2;

  textFont(arial);
  textSize(sizePlayer);
  textAlign(CENTER, CENTER);

  if (gamesP1 == benodigdeGames) {
    winnaarP1 = true;
    if (winnaarP1 == true ) {
      scherm = 3;
      if (scherm == 3) {
        vergrootDiameter = false;
        fill(0, 200);
        rect(0, 0, windowBreedte, windowHoogte);

        fill(wit);       
        text("PLAYER 1 WINS!", middelpuntX, middelpuntY);

        if (millis() - startTijd > tijdsduur * 2) {    //Na 3.0 seconde terug naar startscherm
          scherm = 0;
          resetSpel();
          winnaarP1 = false;
        }      
        verkleinDiameter = true;
      }
    }
  }

  if (gamesP2 == benodigdeGames) {
    winnaarP2 = true;
    if (winnaarP2 == true) {
      scherm = 3;
      if (scherm == 3) {
        vergrootDiameter = false;
        fill(0, 200);
        rect(0, 0, windowBreedte, windowHoogte);

        fill(wit);
        text("PLAYER 2 WINS!", middelpuntX, middelpuntY);

        if (millis() - startTijd > tijdsduur * 2) {    //Na 3.0 seconde terug naar startscherm
          scherm = 0;
          resetSpel();
          winnaarP2 = false;
        }
        verkleinDiameter = true;
      }
    }
  }
}