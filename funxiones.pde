
boolean chekar_boton_cuadrado (float bordX, float bordY, float ancho, float alto) { //chequea botones con pasarle coordenadas y largo y alto
  if ((mouseX>=bordX)&&(mouseX<=bordX+ancho)&&(mouseY>=bordY)&&(mouseY<=bordY+alto)) {
    return (true);
  } 
  else {
    return (false);
  }
}
void dibujarEstructuras (){
  for(int i=0;i<=4;i++){
    for(int j=0;j<=13;j++){
      if(lineaOcupada[i][j]&&lineaObjeto[i][j]==0){
        lineaOcupada[i][j]=false;
      }
      else if(lineaOcupada[i][j]&&lineaObjeto[i][j]==1){
        pushStyle();
        if(generadores[i][j][1]){ 
          fill(255);        
        }
        else{
          noFill();
        }
        ellipse(0+width/14*j+(width/14)/2,250+(height/14)*i+(height/14)/2,width/14-20,height/14-20);
        popStyle();
      }
      else if (lineaOcupada[i][j]&&lineaObjeto[i][j]==2){
        pushStyle();
        if(torretas[i][j][1]){ 
          fill(255);        
        }
        else{
          noFill();
        }
        rectMode(CENTER);
        rect(0+width/14*j+(width/14)/2,250+(height/14)*i+(height/14)/2,width/14-20,height/14-20);
        popStyle();
      }
    }
  }
}
void generacionComida (){
  for(int i=0;i<=4;i++){
    for(int j=0;j<=13;j++){
      if(generadores[i][j][0]&&!generadores[i][j][1]){
        if((segundos%10==0)||(segundos==59)){
          generadores[i][j][1]=true;
        }
      }
    }
  }
  if(segundos%6==0){
          comida+=1;
  }
}
void cambiarTodo(int enteros,boolean bureanos){
   for(int j=0;j<=4;j++){ 
     for (int i=0;i<=13;i++){
       lineaOcupada[j][i]=bureanos;
       lineaObjeto[j][i]=enteros;
       generadores[j][i][0]=bureanos;
       generadores[j][i][1]=bureanos;
       torretas[j][i][0]=bureanos;
       torretas[j][i][1]=bureanos;
       seleccionado[0]=bureanos;
       seleccionado[1]=bureanos;
       seleccionado[2]=bureanos;
       objSeleccionado=enteros;
     }
   }
}
void cuadraos(){
  text("eliminar",10,75);
  text("generador",70,75);
  text("torreta",140,75);
  text("coste",15,90);
  text("coste",75,90);
  text("coste",145,90);
  text(costes[0],15,105);
  text(costes[1],75,105);
  text(costes[2],145,105);
  text("recursos:",10,150);
  text(comida,150,150);
  line(10,155,170,155);
  if (chekar_boton_cuadrado(10, 10, 50, 50)||seleccionado[0]) {
      fill (255);
    } else {
      noFill();
    }
    rect (10, 10, 50, 50);
    noFill();
    if (chekar_boton_cuadrado(10, 10, 50, 50)||seleccionado[0]) {
      stroke (0);
    }
    else {
      stroke(255);
    }
    line(10,10,60,60);
    line(10,60,60,10);
    stroke(255);
    if (chekar_boton_cuadrado(70, 10, 50, 50)||seleccionado[1]) {
      fill (255);
    } else {
      noFill();
    }
    rect (70, 10, 50, 50);
    if (chekar_boton_cuadrado(70, 10, 50, 50)||seleccionado[1]) {
      fill (0);
    } 
    else {
      noFill();
    }
    ellipse (95,35,40,40);
    if (chekar_boton_cuadrado(130, 10, 50, 50)||seleccionado[2]) {
      fill (255);
    } else {
      noFill();
    }
    rect (130, 10, 50, 50);
    if (chekar_boton_cuadrado(130, 10, 50, 50)||seleccionado[2]) {
      fill (0);
    } 
    else {
      noFill();
    }
    rect (140,20,30,30);
    noFill();
    rectMode(CORNER);
    pushStyle();
    fill(255);
    stroke(255);
    if(chekar_boton_cuadrado(480,20,100,100)){
      fill(255);
    }
    else{
      noFill();
    }
    rect(480,20,100,100,20);
    popStyle();
    if(chekar_boton_cuadrado(480,20,100,100)){
      fill(0);
    }
    else{
      noFill();
    }
    triangle(510,45,560,70,510,95);
    text("next",540,110);
    fill(255);    
}

  //cuando alcance un puntaje que aparezca un boton para pasar al siguiente level
