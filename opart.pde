//*variables globales*
PImage imgReferencia;
float escalaInteraccion = 1.0;
float anguloRotacion = 0.0;
boolean invertirColores = false;

float botonX = 600;
float botonY = 75;
float botonAncho = 120;
float botonAlto = 25;

void setup() {
  size(800, 400);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  imgReferencia = loadImage("02.jpg");
}

void draw() {
  background(40);
  image(imgReferencia, 200, 200, 400, 400);
  
  stroke(100);
  strokeWeight(2);
  line(400, 0, 400, height);
  
  //dibujo opart
  pushMatrix();
  translate(600, 200);
  rotate(anguloRotacion);
  
  //mouse
  float distanciaMouse = dist(mouseX, mouseY, 600, 200);
  escalaInteraccion = map(distanciaMouse, 0, 300, 0.6, 1.4);
  escalaInteraccion = constrain(escalaInteraccion, 0.4, 1.5);
  
  dibujarFigura(14, escalaInteraccion); 
  popMatrix();
  mostrarInterfaz();
}

//*funciones propias*
//funcion 1
void dibujarFigura(int cantidadCapas, float multiplicador) {
  float grosorCapa = 14.3 * multiplicador; 
  float anchoBandaCruzada = grosorCapa * 4;

  for (int i = cantidadCapas; i > 0; i--) {
    float tamanoCuadrado = i * grosorCapa * 2;
    
    //altrernar blanco y negro
    int colorBase = (i % 2 == 0) ? 0 : 255;
    int colorInvertido = (colorBase == 255) ? 0 : 255;
    if (invertirColores) {
      colorBase = (colorBase == 255) ? 0 : 255;
      colorInvertido = (colorInvertido == 255) ? 0 : 255;
    }
    
    noStroke();
    fill(colorBase);
    rect(0, 0, tamanoCuadrado, tamanoCuadrado);
    if (tamanoCuadrado > anchoBandaCruzada) {
      fill(colorInvertido);
      for (int eje = 0; eje < 2; eje++) {
        if (eje == 0) {
          rect(0, 0, anchoBandaCruzada, tamanoCuadrado);
        } else {
          rect(0, 0, tamanoCuadrado, anchoBandaCruzada); 
        }
      }
    }
  }
  //render
  fill(invertirColores ? 0 : 255);
  rect(0, 0, grosorCapa * 4, grosorCapa * 4);
  
  fill(invertirColores ? 255 : 0);
  rect(0, 0, grosorCapa * 2, grosorCapa * 2);
  
  int colorCentro = obtenerColorCentro(invertirColores);
  fill(colorCentro);
  rect(0, 0, grosorCapa, grosorCapa);
}

//funcion 2
int obtenerColorCentro(boolean invertido) {
  return invertido ? 0 : 255; 
}

//interfaz
void mostrarInterfaz() {
  fill(0, 200);
  noStroke();
  rect(600, 30, 360, 35, 8);
  
  fill(255);
  textSize(11);
  text("MOUSE: mover cambia tamano | click rota", 600, 22);
  text("TECLADO: presiona [I] para invertir color", 600, 38);
  
  //botonn y hover
  if (mouseX > botonX - botonAncho/2 && mouseX < botonX + botonAncho/2 &&
      mouseY > botonY - botonAlto/2 && mouseY < botonY + botonAlto/2) {
    fill(200, 50, 50);
  } else {
    fill(150, 30, 30);
  }
  
  stroke(255, 100);
  strokeWeight(1);
  rect(botonX, botonY, botonAncho, botonAlto, 5); 
  
  fill(255);
  textSize(10);
  text("REINICIAR", botonX, botonY);
}

//interaccion

void mousePressed() {
  if (mouseX > botonX - botonAncho/2 && mouseX < botonX + botonAncho/2 &&
      mouseY > botonY - botonAlto/2 && mouseY < botonY + botonAlto/2) {
    
    //reiniciar
    escalaInteraccion = 1.0;
    anguloRotacion = 0.0;
    invertirColores = false;
    
  } else {
    //click dibujo rota
    if (mouseX > 400) {
      anguloRotacion += random(PI/12, PI/4); 
    }
  }
}

void keyPressed() {
  if (key == 'i' || key == 'I') {
    invertirColores = !invertirColores; 
  }
}
