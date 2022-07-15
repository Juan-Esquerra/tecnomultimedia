void disparar() {    //funcion que cada 5 segundos dispara de  todas las torretas
  if (frameCount%300==0){
    for (int i=0; i<=4; i++) {
      for (int j=0; j<=13; j++) {
        if (lineaOcupada[i][j]&&torretas[i][j]) {
          disparos[i][j]=true;
          posicionDisparos=0;
        }
      }
    }
  }
}
void colisiones() {
  for (int i=0; i<=4; i++) {
    for (int j=0; j<=13; j++) {
      for(int k=0;k<=29;k++){    
        if(disparos[i][j]&&hayEnemigos[i][k]&&(dist(posicionDisparos+j*width/14+(width/14)/2,250+i*height/14+(height/14)/2,posicionOleada+k*width/14+(width/14)/2,250+i*height/14+(height/14)/2))<19){// posicionDisparos posicionOleada
          vidaEnemigos[i][k]=vidaEnemigos[i][k]-1;
          disparos[i][j]=false; 
        }
        if (vidaEnemigos[i][k]<=0&&hayEnemigos[i][k]){
          hayEnemigos[i][k]=false;
          puntaje=puntaje+10;
        }
        if(hayEnemigos[i][k]&&dist(0+j*width/14+(width/14)/2,250+i*height/14+(height/14)/2,posicionOleada+k*width/14+(width/14)/2,250+i*height/14+(height/14)/2)<2){
          lineaOcupada[i][j]=false;
          lineaObjeto[i][j]=0;
          generadores[i][j][0]=false;
          generadores[i][j][1]=false;
          torretas[i][j]=false;
          
        }
        
      }
    }
  }
  if(posicionDisparos>=width){
    for(int i=0;i<=4;i++){
      for(int j=0;j<13;j++){
        disparos[i][j]=false;
      }
    }
  }
  for(int i=0;i<=4;i++){
     for(int j=0;j<29;j++){
       if (hayEnemigos[i][j]&&(posicionOleada+j*width/14+(width/14)/2)<=0){
         instancia=0;
         resetearTodo();
       }
     }
  }
  posicionDisparos=posicionDisparos+2;
  posicionOleada=posicionOleada-0.2;
}
