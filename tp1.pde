PImage miImagen;

void setup(){
  size(800,400);
  miImagen = loadImage("ElPartenon.jpg");
}

void draw(){
  background(70,140,209);
  image(miImagen, 0, 0, 400, 400);
  
  //coordenadas
//fill(255,255,255);
//textSize(15);
//text(mouseX+"-"+mouseY, mouseX, mouseY);
  
  //piso
  noStroke();
  fill(100, 95, 80);
  rect(400, 330, 400, 70);

 //templo
  stroke(120, 110, 90);
  strokeWeight(1.5);
  fill(245, 240, 220);
  
 //techo
  triangle(430, 140, 600, 90, 770, 140);
  fill(210, 200, 180);
  rect(435, 140, 330, 25);
  
 //columnas
  for (int x = 450; x < 750; x += 45) {
    fill(245, 240, 220); 
    rect(x, 165, 30, 165);
    
 //lineas
    stroke(180, 170, 150);
    line(x + 8, 165, x + 8, 330);
    line(x + 15, 165, x + 15, 330);
    line(x + 22, 165, x + 22, 330);

 //final columna
    fill(235, 230, 210);
    stroke(120, 110, 90);
    rect(x - 3, 165, 36, 8); 
  }
 //escalinata
  fill(190, 180, 160);
  rect(420, 330, 360, 10);
  fill(160, 150, 130);
  rect(410, 340, 380, 10);
}
