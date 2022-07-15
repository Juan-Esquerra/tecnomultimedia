void probarBotones(){
   if(instancia==0){      //botones de pantalla 0
    if(chequearBotonCuadrado(width/2-100,3*height/4-60,200,100)){ //boton comenzar
      instancia=1;
      recursos=450;
      resetearTodo();
      generarEnemigos(1);
    }
    else if (chequearBotonCuadrado(480,20,100,100)){    //boton a creditos (pantalla 4)
      instancia=4;
      recursos=450;
      resetearTodo();
    }
  }
  
  else if(instancia>=1&&instancia<=3&&(chequearBotonCuadrado(480,20,100,100))){ //boton tramposo en pantallas 1 a 3
    if (instancia<=3){
      instancia++;
      resetearTodo();
      if(instancia==1){
        recursos=450; 
        generarEnemigos(1);
      }
      if(instancia==2){
        recursos=900;
        generarEnemigos(2);
      }
      if(instancia==3){
        recursos=2250;
        generarEnemigos(3);
      }
   }   
 }
 else if(instancia==1&&chequearBotonCuadrado(200,500,200,70)&&puntaje>=120){ //check boton de victoria pantalla 1
   instancia++;
   resetearTodo();
   recursos=450;
   generarEnemigos(2);
 }
 else if(instancia==2&&chequearBotonCuadrado(200,500,200,70)&&puntaje>=420){  //check boton de victoria pantalla 2
   instancia++;
   resetearTodo();
   recursos=900;
   generarEnemigos(3);
 }
 else if(instancia==3&&chequearBotonCuadrado(200,500,200,70)&&puntaje>=700){ //check boton de victoria pantalla 3
   instancia++;
   resetearTodo();
   recursos=2250;
 }
 else if(instancia>=4&&chequearBotonCuadrado(480,20,100,100)){ //Boton para volver al comienzo
     instancia=0;
   }
 
  if ((instancia>=1)&&(instancia<=3)){        //botones de seleccion para construccion
    if (chequearBotonCuadrado(10, 10, 50, 50)&&!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]){   //usar destruir
      seleccionado[0]=true;
      seleccionado[1]=false;
      seleccionado[2]=false;
      objSeleccionado=0;
    }
    else if (chequearBotonCuadrado(70, 10, 50, 50)&&!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]){  //colocar generador
      seleccionado[0]=false;
      seleccionado[1]=true;
      seleccionado[2]=false;
      objSeleccionado=1;
    }
    else if (chequearBotonCuadrado(130, 10, 50, 50)&&!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]){  //colocar torreta
      seleccionado[0]=false;
      seleccionado[1]=false;
      seleccionado[2]=true;
      objSeleccionado=2;
    }
    else if(seleccionado[0]||seleccionado[1]||seleccionado[2]) {    //si ya selecciono, construye
      construir();  
    }
    else if(!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]) {   //recoleccion de recursos
      for(int i=0;i<=4;i++){
        for(int j=0;j<=13;j++){
          if(chequearBotonCuadrado(0+j*width/14,250+i*height/14,width/14,height/14)){
            if(generadores[i][j][0]&&generadores[i][j][1]){
              recursos+=100;
              generadores[i][j][1]=false;
              
            }
          }
        }
      }
    }
  }
}
