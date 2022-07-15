
boolean chequearBotonCuadrado(float bordX, float bordY, float ancho, float alto) { //chequea botones con pasarle coordenadas y largo y alto
  if ((mouseX>=bordX)&&(mouseX<=bordX+ancho)&&(mouseY>=bordY)&&(mouseY<=bordY+alto)) {
    return (true);
  } 
  else {
    return (false);
  }
}

void dibujarEstructuras(){        //dibuja los datos guardados en lineaObjeto[][], chequeando si esta en true la misma casilla de lineaOcupada[][]
  for(int i=0;i<=4;i++){
    for(int j=0;j<=13;j++){
      if(lineaOcupada[i][j]&&lineaObjeto[i][j]==0){          //si la casilla de lineaOcupada[][] esta encendida, pero el lineaObjeto[][] es un vacio, apaga esa casilla de LineaOcupada[][]
        lineaOcupada[i][j]=false;
      }
      else if(lineaOcupada[i][j]&&lineaObjeto[i][j]==1){        //si es un generador
        pushStyle();
        imageMode(CENTER);
        if(generadores[i][j][1]){     //si tiene recursos para recoger pinta el circulo de color
          image(generador[1],0+width/14*j+(width/14)/2,250+(height/14)*i+(height/14)/2);        
        }
        else{
          image(generador[0],0+width/14*j+(width/14)/2,250+(height/14)*i+(height/14)/2);
        }
        fill(255);
        popStyle();
      }
      else if (lineaOcupada[i][j]&&lineaObjeto[i][j]==2){    //si es una torreta
        pushStyle();
        imageMode(CENTER);
       image(torreta,0+width/14*j+(width/14)/2,250+(height/14)*i+(height/14)/2);
        popStyle();
      }
    }
  }
}
void generacionRecursos(){        //funcion para generar recursos
  for(int i=0;i<=4;i++){
    for(int j=0;j<=13;j++){
      if(generadores[i][j][0]&&!generadores[i][j][1]){
        if((frameCount%600==0)){
          generadores[i][j][1]=true;
        }
      }
    }
  }
  if(frameCount%600==0){
          recursos+=50;
          puntaje+=5;
  }
}
void resetearTodo(){    //devuelve todos los valores a su posicion inicial
   for(int i=0;i<=4;i++){ 
     for (int j=0;j<=13;j++){
       lineaOcupada[i][i]=false;
       lineaObjeto[i][j]=0;
       generadores[i][j][0]=false;
       generadores[i][j][1]=false;
       torretas[i][j]=false;
       torretas[i][j]=false;
     }
     for(int k=0;k<=29;k++){
       hayEnemigos[i][k]=false;
       vidaEnemigos[i][k]=0;
     }
   }
   seleccionado[0]=false;
   seleccionado[1]=false;
   seleccionado[2]=false;
   objSeleccionado=0;
   tiempoenInstancia=0;
   posicionDisparos=0;
   posicionOleada=width+50;
   puntaje=0;
}
void cuadraos(){      //dibujar los botones de construir
  text("eliminar",10,75);
  text("generador",70,75);
  text("torreta",140,75);
  text("coste",15,90);
  text("coste",75,90);
  text("coste",145,90);
  text(costes[0],15,105);
  text(costes[1],75,105);
  text(costes[2],145,105);
  text("recursos:  "+recursos,10,150);
  line(10,155,170,155);
  text("puntaje:  "+puntaje,10,180);
  line(10,185,170,185);
  if (chequearBotonCuadrado(10, 10, 50, 50)||seleccionado[0]) {
      fill (130);
    } else {
      noFill();
    }
    rect (10, 10, 50, 50);
    noFill();
    if (chequearBotonCuadrado(10, 10, 50, 50)||seleccionado[0]) {
      stroke (0);
    }
    else {
      stroke(255);
    }
    line(10,10,60,60);
    line(10,60,60,10);
    stroke(255);
    if (chequearBotonCuadrado(70, 10, 50, 50)||seleccionado[1]) {
      fill (130);
    } else {
      noFill();
    }
    rect (70, 10, 50, 50);
    noFill();
    imageMode(CENTER);
    image(generador[1],95,40);
    if (chequearBotonCuadrado(130, 10, 50, 50)||seleccionado[2]) {
      fill (130);
    } else {
      noFill();
    }
    rect (130, 10, 50, 50);
    pushStyle();
    imageMode(CORNER);
    image(torreta,135, 20);
    popStyle();
    pushStyle();
    fill(255);
    stroke(255);
    noFill();
    if(chequearBotonCuadrado(480,20,100,100)){
      fill(255);
    }
    else{
      noFill();
    }
    rect(480,20,100,100,20);
    popStyle();
    if(chequearBotonCuadrado(480,20,100,100)){
      fill(0);
    }
    else{
      noFill();
    }
    triangle(510,45,560,70,510,95);
    fill(255);    
    text("boton del tramposo",470,135);

}

void botonVictoria(){
  pushStyle();

  if (chequearBotonCuadrado(200,500,200,70)){
    fill(255);
  }
  else {
    noFill();
  }
  rect(200,500,200,70,15);
  noFill();
  popStyle();
  if (chequearBotonCuadrado(200,500,200,70)){
    fill(0);
  }
  else {
    fill(255);
  }
  text("siguiente nivel",250,550);
  fill(255);
}
void cargarImagenes(){
  torreta=loadImage("torreta.png");
  generador[0]=loadImage("generador0.png");
  generador[1]=loadImage("generador1.png");
  for(int i=0;i<=5;i++){
    enemigo[i]=loadImage("enemigo"+i+".png");
  }
}

  //cuando alcance un puntaje que aparezca un boton para pasar al siguiente level
