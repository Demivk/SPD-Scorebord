//Demi van Kesteren //<>//
//I1F
//Beroepsproduct SPD: Tafeltennisscorebord

//General
final int windowBreedte = 800;
final int windowHoogte = (windowBreedte / 4) * 3;

final float middelpuntX = windowBreedte / 2;
final float middelpuntY = windowHoogte / 2;

int offsetX = 15;
int offsetY = 40;
int scherm;

//Kleuren
final int zwart = #000000;
final int wit = #ffffff;
final int rood = #ff0000;
final int blauw = #1F91FF;

int kleurP1, kleurP2;
int kleur1, kleur2, kleur3, kleur4;      //Verander kleur per knop na mousePressed
int kleurUitleg;

//Tekst sizes en fonts
int sizeTitel = 35;
int sizeKeuzemenu = 22;
int sizeUitlegTitel = 50;
int sizeUitlegTekst = 23;

int sizePunten = 175;
int sizeGames = 75;
int sizePlayer = 50;
int sizeService = 30;
int sizeTabelPunten = 18;

PFont pixel, scorebord, arial;

//Scherm 0 & 1
//Variabelen tafel
final float tafelBreedte = windowHoogte;
final float tafelHoogte = (tafelBreedte / 60) * 35;
final float streepDikte = tafelBreedte / 40;
final float netBreedte = streepDikte / 1.5;

//Variabelen batjes
final float batje1X = (middelpuntX - tafelBreedte / 2) + (streepDikte * 5);
final float batje2X = (middelpuntX + tafelBreedte / 2) - (streepDikte * 5);
final float batje1Y = middelpuntY + tafelHoogte / 3.5;
final float batje2Y = middelpuntY - tafelHoogte / 3.5;

PImage batje1, batje2;

//Variabelen knoppen titelscherm
float knopXTitelscherm = middelpuntX;
float knopYTitelscherm = windowHoogte / 1.2;
float knopBreedteTitelscherm = windowBreedte / 1.45;
float knopHoogteTitelscherm = sizeKeuzemenu;
float knopOffset = 28;

String tekst1 = "START";                 //Verander tekst per knop na mousePressed
String tekst2 = "UITLEG";
String tekst3 = "";
String tekst4 = "";

boolean uitleg = false;

//Variabelen balletje
float diameter;
float startXBal, startYBal;
float speedX, speedY;

boolean vergrootDiameter = false;
boolean verkleinDiameter = false;

//Scherm 2 & 3
//Variabelen lijnen
float lijn1Y = windowHoogte / 5;
float lijn2Y = windowHoogte / 1.2;

//Variabelen knoppen scorebord
int aantalKnoppen = 2;

float knopXScorebord = 0;
float knopYScorebord = windowHoogte / 1.2;
float knopBreedteScorebord = windowBreedte / aantalKnoppen;
float knopHoogteScorebord = windowHoogte / 20;

float knopMiddenX = knopXScorebord + knopBreedteScorebord / 2;
float knopMiddenY = knopYScorebord + knopHoogteScorebord / 2;

//Variabelen playernaam
String playerLinksNaam = "PLAYER 1";     //Max. 8 tekens incl. spaties
String playerRechtsNaam = "PLAYER 2";    //Max. 8 tekens incl. spaties

float playerLinksX, playerRechtsX;

//Variabelen service
float serviceRandom;

int serviceKleurP1 = 125;
int serviceKleurP2 = 125;

//Variabelen scoretabel
float tabelX = 25;
float tabelYP1 = knopYScorebord + knopHoogteScorebord + tabelX;    //P1 = Player 1
float tabelYP2 = windowHoogte - tabelX;                            //P2 = Player 2

//Variabelen punten en games
int[][] punten = new int [7][2];         //[Maximale 'Best of'][aantal players]
int maxPunten = 30;
int puntenP1, puntenP2;
int totaalPuntenPlayers;

float puntenP1X, puntenP2X;

int gamesP1, gamesP2;
int gameNummer;

float gamesP1X, gamesP2X; 

int totPunten, bestOf, benodigdeGames;

//Variabelen aangeven en bepalen winnaar game
boolean toonWinnaarGameP1 = false;
boolean toonWinnaarGameP2 = false;

boolean winnaarP1 = false;
boolean winnaarP2 = false;

int startTijd;
int tijdsduur = 1500;


void settings () {
  size(windowBreedte, windowHoogte);
}

void setup () {
  scherm = 0;                            //0 = titelscherm, 1 = uitlegscherm, 2 = scorebord, 3 = winscherm

  kleurP1 = rood;
  kleurP2 = blauw;

  kleur1 = #333333;
  kleur2 = #333333;
  kleur3 = #333333;
  kleur4 = #333333;

  kleurUitleg = #555555;

  pixel = createFont("VCR OSD Mono", sizeTitel);
  scorebord = createFont("Score Board", sizePlayer);
  arial = createFont("Arial", sizeTabelPunten);

  batje1 = loadImage("Rood_2.png");
  batje2 = loadImage("Blauw_2.png");

  diameter = (float)windowBreedte / 32;
  startXBal = middelpuntX;
  startYBal = middelpuntY;
  speedX = (startXBal - batje1X) / 100;
  speedY = (startYBal - batje1Y) / 100;

  playerLinksX = offsetX * 8;
  playerRechtsX = windowBreedte - offsetX * 8;

  serviceRandom = random(0, 1);

  puntenP1 = 0;
  puntenP2 = 0;
  puntenP1X = windowBreedte / 4;
  puntenP2X = windowBreedte - windowBreedte / 4;

  gamesP1 = 0;
  gamesP2 = 0;
  gameNummer = 0;

  gamesP1X = middelpuntX - offsetX * 2;
  gamesP2X = middelpuntX + offsetX * 2;

  bepaalServiceStart();
}

void draw () {
  if (scherm == 0) {
    background(#4E5B68);

    tekenTafel(tafelBreedte, tafelHoogte);
    tekenBatjes(batje1, batje2);
    tekenKnoppenTitelscherm(knopXTitelscherm, knopYTitelscherm, knopBreedteTitelscherm, knopHoogteTitelscherm, knopOffset, kleur1, kleur2, kleur3, kleur4);
    tekenTekstTitelscherm(knopYTitelscherm, knopOffset);
    tekenBalletje();
  }

  if (scherm == 1) {
    background(245);
    uitleg = true;

    if (uitleg == true) {
      tekenUitleg();
      tekenUitlegTerug(knopHoogteTitelscherm, kleurUitleg);
    }
  }

  if (diameter == 1500) {
    scherm = 2;
    if (scherm == 2) {
      background(125);
      noStroke();

      tekenLijnen(lijn1Y, lijn2Y);
      tekenKnoppenScorebord(knopXScorebord, knopYScorebord, knopBreedteScorebord, knopHoogteScorebord, knopMiddenX, knopMiddenY);
      tekenPlayerNaam(playerLinksNaam, playerRechtsNaam, playerLinksX, playerRechtsX);
      tekenService(serviceKleurP1, serviceKleurP2);
      tekenExitTekst();

      tekenPunten(puntenP1X, puntenP2X);
      tekenGames(gamesP1X, gamesP2X, puntenP1X, puntenP2X);
      tekenTabel(playerLinksNaam, playerRechtsNaam);

      bepaalWinnaar();
    }
  }

  //Controle
  println("Best of " + bestOf);
  println("Benodigde punten voor game: " + totPunten);
  println("Benodigde games om te winnen: " + benodigdeGames);
  println("Game: " + (gameNummer + 1) + " / " + bestOf);
  println("Totaal behaalde punten: " + totaalPuntenPlayers);
  println("Games Player 1: " + gamesP1 + " / " + benodigdeGames);
  println("Games Player 2: " + gamesP2 + " / " + benodigdeGames);
  println("Random service: " + serviceRandom);
  println("Player links X: " + playerLinksX);
  println("Player rechts X: " + playerRechtsX);
  println("----------");
  println("Scherm: " + scherm);
  println("SpeedX: " + speedX + "     " + "SpeedY: " + speedY);
  println("Diameter: " + diameter);
  println("MouseX: " + mouseX + " " + "MouseY: " + mouseY);
  println("----------");
  println("VERGROTEN:  " + vergrootDiameter);
  println("VERKLEINEN: " + verkleinDiameter);
  println("===================================");
}

void mousePressed () {
  bepaalGekliktKnop(knopXTitelscherm, knopYTitelscherm, knopBreedteTitelscherm, knopHoogteTitelscherm, knopOffset);

  if (scherm == 2) {
    if (bepaalGekliktLinks(knopXScorebord, knopYScorebord, knopBreedteScorebord, knopHoogteScorebord) == true) {
      if (puntenP1X == windowBreedte / 4 && puntenP2X == windowBreedte - windowBreedte / 4) {
        puntenP1++;
        berekenGamesP1();
      } else if (puntenP1X == windowBreedte - windowBreedte / 4 && puntenP2X == windowBreedte / 4) {
        puntenP2++;
        berekenGamesP2();
      }
      bepaalService();
    } 

    if (bepaalGekliktRechts(knopXScorebord, knopYScorebord, knopBreedteScorebord, knopHoogteScorebord) == true) {
      if (puntenP1X == windowBreedte / 4 && puntenP2X == windowBreedte - windowBreedte / 4) {
        puntenP2++;
        berekenGamesP2();
      } else if (puntenP1X == windowBreedte - windowBreedte / 4 && puntenP2X == windowBreedte / 4) {
        puntenP1++;
        berekenGamesP1();
      }
      bepaalService();
    } 

    totaalPuntenPlayers = puntenP1 + puntenP2;
  }
}

void mouseReleased () {
  bepaalReleasedKnop();
}

void keyPressed () {
  if (keyCode == BACKSPACE && scherm == 2) {
    vergrootDiameter = false;
    scherm = 0;
    verkleinDiameter = true;
    resetSpel();
  }
}