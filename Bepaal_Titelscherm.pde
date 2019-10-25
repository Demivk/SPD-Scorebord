void bepaalGekliktKnop(float knopX, float knopY, float breedte, float hoogte, float offset) {
  //Verander kleur knop wanneer mousePressed: Start, Uitleg
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY - hoogte / 2 && mouseY < knopY + hoogte / 2 && tekst1 == "START" && scherm == 0) {
    kleur1 = #666666;
  }
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY + offset - hoogte / 2 && mouseY < knopY + offset + hoogte / 2 && tekst2 == "UITLEG" && scherm == 0) {
    kleur2 = #666666;
  }

  //Verander kleur knop uitleg scherm
  if (mouseX > knopX - windowBreedte / 16 && mouseX < knopX + windowBreedte / 16 && mouseY > windowHoogte / 1.2 - hoogte && mouseY < windowHoogte / 1.2 + hoogte && scherm == 1) {
    kleurUitleg = #999999;
  }

  //Verander kleur knop wanneer mousePressed: Best of 3/5/7, Terug
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY - hoogte / 2 && mouseY < knopY + hoogte / 2 && tekst1 == "BEST OF 3" && scherm == 0) {
    kleur1 = #666666;
  }
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY + offset - hoogte / 2 && mouseY < knopY + offset + hoogte / 2 && tekst2 == "BEST OF 5" && scherm == 0) {
    kleur2 = #666666;
  }
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY + offset * 2 - hoogte / 2 && mouseY < knopY + offset * 2 + hoogte / 2 && tekst3 == "BEST OF 7" && scherm == 0) {
    kleur3 = #666666;
  }
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY + offset * 3 - hoogte / 2 && mouseY < knopY + offset * 3 + hoogte / 2 && tekst4 == "TERUG" && scherm == 0) {
    kleur4 = #666666;
  }

  //Verander kleur knop wanneer mousePressed: Tot 11, Tot 21
  //Best of 3
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY - hoogte / 2 && mouseY < knopY + hoogte / 2 && tekst1 == "BEST OF 3: TOT 11, OM DE 2 SERVICEWISSEL" && scherm == 0) {
    kleur1 = #666666;
  }
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY + offset - hoogte / 2 && mouseY < knopY + offset + hoogte / 2 && tekst2 == "BEST OF 3: TOT 21, OM DE 5 SERVICEWISSEL" && scherm == 0) {
    kleur2 = #666666;
  }

  //Best of 5
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY - hoogte / 2 && mouseY < knopY + hoogte / 2 && tekst1 == "BEST OF 5: TOT 11, OM DE 2 SERVICEWISSEL" && scherm == 0) {
    kleur1 = #666666;
  }
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY + offset - hoogte / 2 && mouseY < knopY + offset + hoogte / 2 && tekst2 == "BEST OF 5: TOT 21, OM DE 5 SERVICEWISSEL" && scherm == 0) {
    kleur2 = #666666;
  }

  //Best of 7
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY - hoogte / 2 && mouseY < knopY + hoogte / 2 && tekst1 == "BEST OF 7: TOT 11, OM DE 2 SERVICEWISSEL" && scherm == 0) {
    kleur1 = #666666;
  }
  if (mouseX > knopX - breedte / 2 && mouseX < knopX + breedte / 2 && mouseY > knopY + offset - hoogte / 2 && mouseY < knopY + offset + hoogte / 2 && tekst2 == "BEST OF 7: TOT 21, OM DE 5 SERVICEWISSEL" && scherm == 0) {
    kleur2 = #666666;
  }
}

void bepaalReleasedKnop () {
  //Verander kleur knop en verander tekst wanneer mouseReleased: Start, Uitleg
  if (kleur1 == #666666 && tekst1 == "START" && scherm == 0) {
    kleur1 = #333333;
    tekst1 = "BEST OF 3";
    tekst2 = "BEST OF 5";
    tekst3 = "BEST OF 7";
    tekst4 = "TERUG";
  }
  if (kleur2 == #666666 && tekst2 == "UITLEG" && scherm == 0) {
    kleur2 = #333333;
    scherm = 1;
  }

  //Verander kleur knop en terug naar scherm 0
  if (kleurUitleg == #999999 && scherm == 1) {
    kleurUitleg = #555555;
    scherm = 0;
    tekst1 = "START";
    tekst2 = "UITLEG";
    tekst3 = "";
    tekst4 = "";
  }

  //Verander kleur knop en verander tekst wanneer mouseReleased: Best of 3/5/7, Terug
  if (kleur1 == #666666 && tekst1 == "BEST OF 3" && scherm == 0) {
    kleur1 = #333333;
    tekst1 = "BEST OF 3: TOT 11, OM DE 2 SERVICEWISSEL";
    tekst2 = "BEST OF 3: TOT 21, OM DE 5 SERVICEWISSEL";
    tekst3 = "";
    tekst4 = "TERUG";
  }
  if (kleur2 == #666666 && tekst2 == "BEST OF 5" && scherm == 0) {
    kleur2 = #333333;
    tekst1 = "BEST OF 5: TOT 11, OM DE 2 SERVICEWISSEL";
    tekst2 = "BEST OF 5: TOT 21, OM DE 5 SERVICEWISSEL";
    tekst3 = "";
    tekst4 = "TERUG";
  }
  if (kleur3 == #666666 && tekst3 == "BEST OF 7" && scherm == 0) {
    kleur3 = #333333;
    tekst1 = "BEST OF 7: TOT 11, OM DE 2 SERVICEWISSEL";
    tekst2 = "BEST OF 7: TOT 21, OM DE 5 SERVICEWISSEL";
    tekst3 = "";
    tekst4 = "TERUG";
  }
  if (kleur4 == #666666 && tekst4 == "TERUG" && scherm == 0) {
    kleur4 = #333333;
    tekst1 = "START";
    tekst2 = "UITLEG";
    tekst3 = "";
    tekst4 = "";
  }

  //Verander kleur knop en tekst wanneer mouseReleased: Tot 11, Tot 21
  //Best of 3
  if (kleur1 == #666666 && tekst1 == "BEST OF 3: TOT 11, OM DE 2 SERVICEWISSEL") {
    kleur1 = #333333;
    vergrootDiameter = true;
    verkleinDiameter = false;
    bestOf = 3;
    totPunten = 11;
    bepaalServiceStart();
  }
  if (kleur2 == #666666 && tekst2 == "BEST OF 3: TOT 21, OM DE 5 SERVICEWISSEL") {
    kleur2 = #333333;
    vergrootDiameter = true;
    verkleinDiameter = false;
    bestOf = 3;
    totPunten = 21;
    bepaalServiceStart();
  }

  //Best of 5
  if (kleur1 == #666666 && tekst1 == "BEST OF 5: TOT 11, OM DE 2 SERVICEWISSEL") {
    kleur1 = #333333;
    vergrootDiameter = true;
    verkleinDiameter = false;
    bestOf = 5;
    totPunten = 11;
    bepaalServiceStart();
  }
  if (kleur2 == #666666 && tekst2 == "BEST OF 5: TOT 21, OM DE 5 SERVICEWISSEL") {
    kleur2 = #333333;
    vergrootDiameter = true;
    verkleinDiameter = false;
    bestOf = 5;
    totPunten = 21;
    bepaalServiceStart();
  }

  //Best of 7
  if (kleur1 == #666666 && tekst1 == "BEST OF 7: TOT 11, OM DE 2 SERVICEWISSEL") {
    kleur1 = #333333;
    vergrootDiameter = true;
    verkleinDiameter = false;
    bestOf = 7;
    totPunten = 11;
    bepaalServiceStart();
  }
  if (kleur2 == #666666 && tekst2 == "BEST OF 7: TOT 21, OM DE 5 SERVICEWISSEL") {
    kleur2 = #333333;
    vergrootDiameter = true;
    verkleinDiameter = false;
    bestOf = 7;
    totPunten = 21;
    bepaalServiceStart();
  }
}