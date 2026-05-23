void setup() {

  size(640, 480);
  frameRate(60);

  fondoX = 0;
  velocidad = 0.8;
  textoY = 0;
  textoAlpha = 0;
  pantalla = -1;
  duracion = 7500;
  corriendo = false;

  colorTitulo = color(255, 220, 0);
  colorSubtitulo = color(255, 255, 255);
  colorBoton = color(50, 180, 80);
  colorBotonHover = color(255, 220, 0);
  colorOverlay = color(0, 170);
  colorBarra = color(255, 220, 0);

  btnW = 300;
  btnH = 75;

  btnX = (width - btnW) / 2;
  btnY = height - btnH - 25;

  tamanoLetraBoton = 20;

  fondo = loadImage("fondo.jpg");

  logoInicio = loadImage("logo.png");

  img0 = loadImage("pajaro.png");
  img1 = loadImage("juego.png");
  img2 = loadImage("borrado.png");
  img3 = loadImage("clones.jpg");
  img4 = loadImage("creador.jpg");

  fuenteGrande = createFont("fuente.TTF", 62);
  fuenteChica = createFont("fuente.TTF", 40);

  titulo0 = "2013: EL NACIMIENTO";
  titulo1 = "2014: FAMA MUNDIAL";
  titulo2 = "2014: EL COLAPSO";
  titulo3 = "2014: LA INVASION";
  titulo4 = "HOY: EL MITO VIVE";

  sub0 = "Dong Nguyen, un programador vietnamita,\nhizo el juego en 2-3 dias y lo subio\na la App Store. Nadie lo descargo por meses.";
  sub1 = "En enero de 2014 se volvio viral de un dia\npara el otro. 50 millones de descargas.\nDong ganaba $50.000 por dia y se sentia culpable.";
  sub2 = "El 9 de febrero Dong tuiteó que borraba\nel juego. Lo borro. Los celulares con\nel juego se vendian en eBay por $10.000.";
  sub3 = "En 48hs habia 273 clones en la App Store.\nFlappy Bee, Flappy Doge, Flappy Trump...\nNinguno funciono igual. El publico no compro la copia.";
  sub4 = "Dong volvio con nuevos juegos pero\nnunca busco la fama. Un solo tipo,\nun finde, paralizo al mundo entero.";

  textAlign(CENTER, CENTER);
}

void draw() {

  background(0);
  dibujarFondo();
  if (corriendo == false && pantalla == -1) {
    dibujarInicio();
    return;
  }

  if (corriendo == true && pantalla >= 0 && pantalla < 5) {

    dibujarPantalla();
    int tiempoPasado = millis() - tiempoInicio;
    if (tiempoPasado >= duracion) {
      avanzarPantalla();
    }
  }

  if (pantalla >= 5) {
    dibujarFin();
  }
}

void dibujarFondo() {

  fondoX = fondoX + velocidad;

  if (fondoX >= 640) {

    fondoX = 0;
  }

  image(fondo, fondoX - 640, 0, 640, 480);
  image(fondo, fondoX, 0, 640, 480);
}

void dibujarInicio() {

  fill(0, 120);
  noStroke();
  rect(0, 0, width, height);
  image(logoInicio, 130, 120, 380, 120);
  textFont(fuenteChica);
  textSize(20);
  fill(colorSubtitulo);
  text("La historia mas corta y traumatica del gaming", width/2, height/2 + 60);

  tamanoLetraBoton = 25;

  dibujarBoton(" INICIAR ");
}

void dibujarPantalla() {

  if (pantalla == 0) {
    image(img0, 170, 40, 300, 300);
  }

  if (pantalla == 1) {
    image(img1, 170, 40, 300, 300);
  }

  if (pantalla == 2) {
    image(img2, 170, 40, 300, 300);
  }

  if (pantalla == 3) {
    image(img3, 170, 40, 300, 300);
  }

  if (pantalla == 4) {
    image(img4, 170, 40, 300, 300);
  }

  fill(colorOverlay);

  noStroke();

  rect(0, height - 160, width, 160);

  int tiempoPasado = millis() - tiempoInicio;

  if (tiempoPasado < 600) {

    textoAlpha = textoAlpha + 5;

    if (textoAlpha > 255) {
      textoAlpha = 255;
    }

    textoY = textoY - 0.3;
  }

  if (tiempoPasado > duracion - 600) {

    textoAlpha = textoAlpha - 5;

    if (textoAlpha < 0) {
      textoAlpha = 0;
    }
  }

  textFont(fuenteGrande);
  textSize(24);
  fill(255, 220, 0, textoAlpha);

  if (pantalla == 0) {
    text(titulo0, width/2, textoY);
  }

  if (pantalla == 1) {
    text(titulo1, width/2, textoY);
  }

  if (pantalla == 2) {
    text(titulo2, width/2, textoY);
  }

  if (pantalla == 3) {
    text(titulo3, width/2, textoY);
  }

  if (pantalla == 4) {
    text(titulo4, width/2, textoY);
  }

  textFont(fuenteChica);
  textSize(16);
  fill(255, 255, 255, textoAlpha);

  if (pantalla == 0) {
    text(sub0, width/2, height - 70);
  }

  if (pantalla == 1) {
    text(sub1, width/2, height - 70);
  }

  if (pantalla == 2) {
    text(sub2, width/2, height - 70);
  }

  if (pantalla == 3) {
    text(sub3, width/2, height - 70);
  }

  if (pantalla == 4) {
    text(sub4, width/2, height - 70);
  }

  float progreso = (tiempoPasado * width) / duracion;
  noStroke();
  fill(255, 40);
  rect(0, height - 6, width, 6);
  fill(colorBarra);
  rect(0, height - 6, progreso, 6);
  textFont(fuenteChica);
  textSize(14);
  fill(255, 180);
  textAlign(LEFT, TOP);
  text((pantalla + 1) + " / 5", 12, 12);
  textAlign(CENTER, CENTER);
}

void dibujarFin() {
  fill(0, 180);
  noStroke();
  rect(0, 0, width, height);
  textFont(fuenteGrande);
  textSize(36);
  fill(colorTitulo);
  text("FIN DE LA HISTORIA", width/2, height/2 - 40);
  textFont(fuenteChica);
  textSize(20);
  fill(colorSubtitulo);
  text("Dong: 'Solo queria hacer un juego relajante...' c:", width/2, height/2 + 30);
  tamanoLetraBoton = 35;
  dibujarBoton("[ REINICIAR ]");
}

void dibujarBoton(String textoBoton) {

  boolean encimaBoton = (mouseX >= btnX) && (mouseX <= btnX + btnW) &&
                        (mouseY >= btnY) && (mouseY <= btnY + btnH);
  if (encimaBoton == true) {
    fill(colorBotonHover);

  } else {
    fill(colorBoton);
  }

  stroke(255);
  strokeWeight(2);
  rect(btnX, btnY, btnW, btnH, 8);
  noStroke();
  textFont(fuenteChica);
  textSize(tamanoLetraBoton);
  if (encimaBoton == true) {

    fill(0);

  } else {
    fill(255);
  }

  text(textoBoton, btnX + btnW/2, btnY + btnH/2);
  strokeWeight(1);
}

void avanzarPantalla() {
  pantalla = pantalla + 1;

  if (pantalla >= 0 && pantalla < 5) {
    tiempoInicio = millis();
    textoAlpha = 0;
    textoY = height - 100;
  }

  if (pantalla >= 5) {
    corriendo = false;
  }
}

void reiniciarPresentacion() {
  pantalla = 0;
  corriendo = true;
  tiempoInicio = millis();
  textoAlpha = 0;
  textoY = height - 100;
}

void mousePressed() {
  boolean sobreBoton = (mouseX >= btnX) && (mouseX <= btnX + btnW) &&
                       (mouseY >= btnY) && (mouseY <= btnY + btnH);

  if (corriendo == false && pantalla == -1 && sobreBoton == true) {
    reiniciarPresentacion();
    return;
  }

  if (pantalla >= 5 && sobreBoton == true) {
    pantalla = -1;
    corriendo = false;
    return;
  }

  if (corriendo == true && pantalla >= 0 && pantalla < 5) {
    avanzarPantalla();
  }
}

void mouseClicked() {
}
