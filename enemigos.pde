void generarEnemigos(int nivel) {
  if (nivel==1) {      //generacion de enemigos en el nivel 1
    for (int j=0; j<=29; j++) {
      if (random(0, 4)>=1.5) {
        hayEnemigos[0][j]=true;
        vidaEnemigos[0][j]=5;
      } else {
        hayEnemigos[0][j]=false;
        vidaEnemigos[0][j]=0;
      }
    }
  } else if (nivel==2) {    //generacion de enemigos en el nivel 2
    for (int i=0; i<=2; i++) {
      for (int k=0; k<=29; k++) {
        if (random(0, 4)>=1.5) {
          hayEnemigos[i][k]=true;
          vidaEnemigos[i][k]=5;
        } else {
          hayEnemigos[i][k]=false;
          vidaEnemigos[i][k]=0;
        }
      }
    }
  } else if (nivel==3) {        //generacion de enemigos en el nivel 3
    for (int i=0; i<=4; i++) {
        for (int k=0; k<=29; k++) {
          if (random(0, 4)>=1.5) {
            hayEnemigos[i][k]=true;
            vidaEnemigos[i][k]=5;
          } else {
            hayEnemigos[i][k]=false;
            vidaEnemigos[i][k]=0;
          }
        }
      
    }
  } else { //en cualquier otra pantalla resetea los datos
    for (int i=0; i<=4; i++) {
        for (int k=0; k<=29; k++) { 
          hayEnemigos[i][k]=false;
          vidaEnemigos[i][k]=0;
        }
      
    }
  }
}


void dibujarEnemigosyProyectiles() {
  pushStyle();
  for (int i=0; i<=4; i++) {
    for (int k=0; k<=29; k++) {
      if (hayEnemigos[i][k]){
        imageMode(CENTER);
        image(enemigo[vidaEnemigos[i][k]],posicionOleada+k*width/14+(width/14)/2,250+i*height/14+(height/14)/2);
        noFill();
        fill(255);
      }
    }
  }
  for (int i=0; i<=4; i++) {
    for (int j=0; j<=13; j++) {
      if (disparos[i][j]){
        stroke(50,255,50);
        strokeWeight(4);
        line(posicionDisparos+j*width/14+(width/14)/2,250+i*height/14+(height/14)/2,posicionDisparos+10+j*width/14+(width/14)/2,250+i*height/14+(height/14)/2);
      }
    }
  }
  popStyle();
}
/*colocarlo en dibujar enemigos
 if(frameCount%60==0){ 
 tiempoenInstancia++
 }
 */
