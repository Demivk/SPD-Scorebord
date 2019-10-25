void tekenTafel (float breedte, float hoogte) {
  noStroke();
  rectMode(CENTER);

  fill(wit);
  rect(middelpuntX, middelpuntY, breedte, hoogte);

  fill(#EE364C);
  rect(middelpuntX, middelpuntY, breedte - 2 * streepDikte, hoogte - 2 * streepDikte);

  fill(wit);
  rect(middelpuntX, middelpuntY, breedte, streepDikte);

  fill(#253647);
  rect(middelpuntX, middelpuntY, netBreedte, hoogte);
}

void tekenBatjes (PImage batje1, PImage batje2) {
  imageMode(CENTER);
  image(batje1, batje1X, batje1Y);    //Links onder (rood)
  image(batje2, batje2X, batje2Y);    //Rechts boven (blauw)
}

void tekenKnoppenTitelscherm (float knopX, float knopY, float breedte, float hoogte, float offset, int kleur1, int kleur2, int kleur3, int kleur4) {
  rectMode(CENTER);

  if (tekst3 == "" && scherm == 0) {
    kleur3 = #4E5B68;
  }
  if (tekst4 == "" & scherm == 0) {
    kleur4 = #4E5B68;
  }

  fill(kleur1);
  rect(knopX, knopY, breedte, hoogte);

  fill(kleur2);
  rect(knopX, knopY + offset, breedte, hoogte);

  fill(kleur3);
  rect(knopX, knopY + offset * 2, breedte, hoogte);

  fill(kleur4);
  rect(knopX, knopY + offset * 3, breedte, hoogte);
}

void tekenTekstTitelscherm(float knopY, float offset) {
  textFont(pixel);
  textAlign(CENTER, CENTER);
  fill(zwart);

  textSize(sizeTitel);
  text("TAFELTENNIS", middelpuntX, windowHoogte / 11);
  text("SCOREBORD", middelpuntX, windowHoogte / 11 + sizeTitel);

  textSize(sizeKeuzemenu);
  text(tekst1, middelpuntX, knopY + offset * 0 - 1);
  text(tekst2, middelpuntX, knopY + offset * 1 - 2);
  text(tekst3, middelpuntX, knopY + offset * 2 - 3);
  text(tekst4, middelpuntX, knopY + offset * 3 - 4);
}

void tekenBalletje () {
  stroke(150);
  fill(245);

  //x-positie en y-positie van balletje
  startXBal = startXBal + speedX;
  startYBal = startYBal + speedY;

  if (startXBal == batje2X && startYBal == batje2Y) {
    speedX = -speedX;
    speedY = -speedY;
  }
  if (startXBal == batje1X && startYBal == batje1Y) {
    speedX = -speedX;
    speedY = -speedY;
  }

  if (vergrootDiameter == true) {
    diameter = diameter + 12;
    if (diameter > 1500) {
      diameter = 1500;
      tekst1 = "START";
      tekst2 = "UITLEG";
      tekst3 = "";
      tekst4 = "";
    }
  }
  if (verkleinDiameter == true) {
    diameter = diameter - 12;
    if (diameter < (float)windowBreedte / 32) {
      diameter = (float)windowBreedte / 32;
    }
  }

  ellipse(startXBal, startYBal, diameter, diameter);
}

//Uitleg
void tekenUitleg () {
  float offset = 25;

  textFont(pixel);
  textAlign(CENTER, CENTER);
  fill(zwart);

  textSize(sizeUitlegTitel);
  text("UITLEG", middelpuntX, windowHoogte / 8);

  textSize(sizeUitlegTekst);
  text("Zodra er op de start-knop wordt geklikt, kan er een", middelpuntX, windowHoogte / 8 + offset * 2);
  text("keuze gemaakt worden uit verschillende spelvarianten.", middelpuntX, windowHoogte / 8 + offset * 3);
  text("Ten eerste kan er bepaald worden hoeveel games de", middelpuntX, windowHoogte / 8 + offset * 4);
  text("spelers moeten winnen. Er kan gekozen worden uit:", middelpuntX, windowHoogte / 8 + offset * 5);
  text("Best of 3: 2 games", middelpuntX, windowHoogte / 8 + offset * 6);
  text("Best of 5: 3 games", middelpuntX, windowHoogte / 8 + offset * 7);
  text("Best of 7: 4 games", middelpuntX, windowHoogte / 8 + offset * 8);
  text("Ook kan het aantal punten vooraf worden ingesteld.", middelpuntX, windowHoogte / 8 + offset * 9);
  text("Hierbij kan er gekozen worden tussen 11 en 21 punten,", middelpuntX, windowHoogte / 8 + offset * 10);
  text("waarbij de servicewissel plaatsvindt om de 2 of 5 punten.", middelpuntX, windowHoogte / 8 + offset * 11);
  text("De punten zijn gemakkelijk te bedienen met behulp van", middelpuntX, windowHoogte / 8 + offset * 12);
  text("een simpele plus-knop. De service, het wisselen van kant", middelpuntX, windowHoogte / 8 + offset * 13);
  text("en weergeven van de punten per game wordt automatisch", middelpuntX, windowHoogte / 8 + offset * 14);
  text("gedaan. Er kunnen max. 30 punten worden gescoord.", middelpuntX, windowHoogte / 8 + offset * 15);
}

void tekenUitlegTerug (float hoogte, int kleur) {
  rectMode(CENTER);
  fill(kleur);
  rect(middelpuntX, windowHoogte / 1.2, windowBreedte / 8, hoogte * 2);

  textFont(pixel);
  textSize(sizeUitlegTekst);
  textAlign(CENTER, CENTER);

  fill(zwart);
  text("TERUG", middelpuntX, windowHoogte / 1.2 - 2);
}