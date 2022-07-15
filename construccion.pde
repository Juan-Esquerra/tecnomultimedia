void construir () {        //funcion para ingresar las construcciones del jugador 
  for (int i=0; i<=2; i++) {
    if (seleccionado[i]) {
      for (int j=0; j<=4; j++) {
        for (int k=0; k<=13; k++) {
          if ((i==0)&&(lineaOcupada[j][k])&&chequearBotonCuadrado(0+k*height/14, 250+j*height/14, width/14, height/14)) {
            lineaObjeto[j][k]=0;
            lineaOcupada[j][k]=false;
            seleccionado[0]=false;
            seleccionado[1]=false;
            seleccionado[2]=false;
          } else if ((i==1)&&(!lineaOcupada[j][k])&&chequearBotonCuadrado(0+k*height/14, 250+j*height/14, width/14, height/14)&&recursos>=costes[1]) {
            lineaObjeto[j][k]=1;
            lineaOcupada[j][k]=true;
            generadores[j][k][0]=true;
            seleccionado[0]=false;
            seleccionado[1]=false;
            seleccionado[2]=false;
            recursos-=costes[1];
          } else if ((i==2)&&(!lineaOcupada[j][k])&&chequearBotonCuadrado(0+k*height/14, 250+j*height/14, width/14, height/14)&&recursos>=costes[2]) {
            lineaObjeto[j][k]=2;
            lineaOcupada[j][k]=true;
            torretas[j][k]=true;
            seleccionado[0]=false;
            seleccionado[1]=false;
            seleccionado[2]=false;
            recursos-=costes[2];
          }
        }
      }
    }
  }
  seleccionado[0]=false;
  seleccionado[1]=false;
  seleccionado[2]=false;
}
void dibujar_layout (int ins) {
  if (ins==1) {

    cuadraos();
    for (int i=0; i<=13; i++) {
      stroke(255);
      noFill();
      rect(0+i*width/14, 250, width/14, height/14);
    }
  }
  if (ins==2) {
    cuadraos();
    for (int i=0; i<=2; i++) {
      for (int j=0; j<=13; j++) {
        stroke(255);
        noFill();
        rect(0+j*width/14, 250+i*height/14, width/14, height/14);
      }
    }
  }
  if (ins==3) {
    cuadraos();
    for (int i=0; i<=4; i++) {
      for (int j=0; j<=13; j++) {
        stroke(255);
        noFill();
        rect(0+j*width/14, 250+i*height/14, width/14, height/14);
      }
    }
  }
}
void dibujarInicio() {
  pushStyle();
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(36);
  if (chequearBotonCuadrado(width/2-100, 3*height/4-60, 200, 100)) {
    fill(240);
  } else {
    noFill();
  }
  rect(width/2, 3*height/4-10, 200, 100, 45);
  if (chequearBotonCuadrado(width/2-100, 3*height/4-60, 200, 100)) {
    fill(0);
  } else {
    fill(255);
  }
  text("Comenzar", width/2, 3*height/4);

  popStyle();
  fill(255);
  rectMode(CORNER);
  textAlign(CORNER);
  textSize(12);
  if (chequearBotonCuadrado(480, 20, 100, 100)) {
    fill(255);
  } else {
    noFill();
  }
  rect(480, 20, 100, 100, 20);
  if (chequearBotonCuadrado(480, 20, 100, 100)) {
    fill(0);
  } else {
    noFill();
  }
  triangle(510, 45, 560, 70, 510, 95);
  text("creditos", 520, 110);
  fill(255);
  text("instrucciones: haga clic en los botones de la esquina superior izquierda\npara seleccionar lo que desea construir y haga clic en la casilla donde\ndesee hacerlo, si uno de los enemigos que aparecen por la derecha luego\nde 20 segundos llegan al lado izquierdo, pierde.\nal alcanzar un puntaje determinado podra pasar al siguiente nivel\n\ncuando un generador se torne verde haga clic en el para\nconseguir sus recursos", 20, 20);
}

void dibujarCreditos() {
  textAlign(CENTER);
  text("creditos:\nJuan Esquerra\nLegajo:85104/0", width/2, height/2);
  textAlign(CORNER);
  if (chequearBotonCuadrado(480, 20, 100, 100)) {
    fill(255);
  } else {
    noFill();
  }
  rect(480, 20, 100, 100, 20);

  if (chequearBotonCuadrado(480, 20, 100, 100)) {
    fill(0);
  } else {
    noFill();
  }
  triangle(510, 45, 560, 70, 510, 95);
  text("restart", 530, 110);
  fill(255);
}
