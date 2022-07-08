void construir (){
  for(int i=0;i<=2;i++){
    if(seleccionado[i]){
      for(int j=0;j<=4;j++){
        for(int k=0;k<=13;k++){
          if((i==0)&&(lineaOcupada[j][k])&&(mouseY>250+j*height/14)&&(mouseY<250+height/14+j*height/14)&&(mouseX>0+k*height/14)&&(mouseX<height/14+k*height/14)){
            lineaObjeto[j][k]=0;
            lineaOcupada[j][k]=false;
            seleccionado[0]=false;
            seleccionado[1]=false;
            seleccionado[2]=false;
          }
          else if ((i==1)&&(!lineaOcupada[j][k])&&(mouseY>250+j*height/14)&&(mouseY<250+height/14+j*height/14)&&(mouseX>0+k*height/14)&&(mouseX<height/14+k*height/14)&&(comida>=costes[i])){
            lineaObjeto[j][k]=1;
            lineaOcupada[j][k]=true;
            generadores[j][k][0]=true;
            seleccionado[0]=false;
            seleccionado[1]=false;
            seleccionado[2]=false;
            comida-=costes[1];
          }
          else if ((i==2)&&(!lineaOcupada[j][k])&&(mouseY>250+j*height/14)&&(mouseY<250+height/14+j*height/14)&&(mouseX>0+k*height/14)&&(mouseX<height/14+k*height/14)&&(comida>=costes[i])){
            lineaObjeto[j][k]=2;
            lineaOcupada[j][k]=true;
            torretas[j][k][0]=true;
            seleccionado[0]=false;
            seleccionado[1]=false;
            seleccionado[2]=false;
            comida-=costes[2];
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
   if(ins==1){
     
     cuadraos();
     for(int i=0;i<=13;i++){
       stroke(255);
       noFill();
       rect(0+i*width/14,250,width/14,height/14); 
     } 
   }
   if(ins==2){
     cuadraos();
     for(int i=0;i<=2;i++){
       for(int j=0;j<=13;j++){
         stroke(255);
         noFill();
         rect(0+j*width/14,250+i*height/14,width/14,height/14); 
       }
       if (chekar_boton_cuadrado(10, 10, 50, 50)||seleccionado[0]) {
      fill (255);
    } else {
      noFill();
    }
    rect (10, 10, 50, 50);
    line(10,10,60,60);
    line(10,60,60,10);
    if (chekar_boton_cuadrado(70, 10, 50, 50)||seleccionado[1]) {
      fill (255);
    } else {
      noFill();
    }
    rect (70, 10, 50, 50);
    ellipse (95,35,40,40);
    if (chekar_boton_cuadrado(130, 10, 50, 50)||seleccionado[2]) {
      fill (255);
    } else {
      noFill();
    }
    rect (130, 10, 50, 50);
    rect (140,20,30,30);
     }
   }
   if(ins==3){
     cuadraos();
     for(int i=0;i<=4;i++){
       for(int j=0;j<=13;j++){
         stroke(255);
         noFill();
         rect(0+j*width/14,250+i*height/14,width/14,height/14); 
       }
     }if (chekar_boton_cuadrado(10, 10, 50, 50)||seleccionado[0]) {
      fill (255);
    } else {
      noFill();
    }
    rect (10, 10, 50, 50);
    line(10,10,60,60);
    line(10,60,60,10);
    if (chekar_boton_cuadrado(70, 10, 50, 50)||seleccionado[1]) {
      fill (255);
    } else {
      noFill();
    }
    rect (70, 10, 50, 50);
    ellipse (95,35,40,40);
    if (chekar_boton_cuadrado(130, 10, 50, 50)||seleccionado[2]) {
      fill (255);
    } else {
      noFill();
    }
    rect (130, 10, 50, 50);
    rect (140,20,30,30);
   }
}
