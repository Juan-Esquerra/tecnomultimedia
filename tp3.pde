//https://youtu.be/GrOcOSwbzrc
//Juan Esquerra
//legajo 85104/0
//Tecno multimedia Com 4
//Tp3

int instancia;
int objSeleccionado;
int segundos;
int comida;
int puntaje;

boolean[] seleccionado= new boolean [3];
boolean[][] lineaOcupada= new boolean [5][14];

boolean[][][]generadores=new boolean[5][14][2];
boolean[][][]torretas=new boolean [5][14][2];

int [] costes= new int [3];
int[][] lineaObjeto= new int[5][14];


void setup(){
size (600,600);
instancia=0;
costes[0]=0;
costes[1]=100;
costes[2]=250;
comida=10000;
cambiarTodo(0,false);
textSize(12);
}

void draw (){
  background(0);
  noFill();
  stroke(255);
  segundos=second();
  
  if (instancia==0){
    pushStyle();
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(36);
    if(chekar_boton_cuadrado(width/2-100,3*height/4-60,200,100)){
      fill(240);
    }
    else{
      noFill();
    }
    rect(width/2,3*height/4-10,200,100,45);
    if(chekar_boton_cuadrado(width/2-100,3*height/4-60,200,100)){
      fill(0);
    }
    else{
      fill(255);
    }
    text("Comenzar",width/2,3*height/4);
    
    popStyle();
    fill(255);
    rectMode(CORNER);
    textAlign(CORNER);
    textSize(12);
    if(chekar_boton_cuadrado(480,20,100,100)){
      fill(255);
    }
    else{
      noFill();
    }
    rect(480,20,100,100,20);
    if(chekar_boton_cuadrado(480,20,100,100)){
      fill(0);
    }
    else{
      noFill();
    }
    triangle(510,45,560,70,510,95);
    text("creditos",520,110);
    fill(255);
  }
  else if (instancia==1){
    dibujar_layout (instancia); 
    dibujarEstructuras();
    generacionComida();
  }
  else if (instancia==2){
    dibujar_layout (instancia);
    dibujarEstructuras ();
    generacionComida();
  }
  else if (instancia==3){
    dibujar_layout (instancia);
    dibujarEstructuras ();
    generacionComida();
  }
  else if (instancia==4){
    textAlign(CENTER);
    text("creditos:\nJuan Esquerra\nLegajo:85104/0",width/2,height/2);
    textAlign(CORNER);
    if(chekar_boton_cuadrado(480,20,100,100)){
      fill(255);
    }
    else{
      noFill();
    }
    rect(480,20,100,100,20);
   
    if(chekar_boton_cuadrado(480,20,100,100)){
      fill(0);
    }
    else{
      noFill();
    }
    triangle(510,45,560,70,510,95);
    text("restart",530,110);
    fill(255);
  }
}

void mouseClicked(){
  if(instancia>=1&&instancia<=4&&(chekar_boton_cuadrado(480,20,100,100))){
    if (instancia<=3){
    instancia++;
   cambiarTodo(0,false);
   comida=450;
   
   println(instancia);}
   if(instancia>=4&&chekar_boton_cuadrado(480,20,100,100)){
     instancia=0;
   }
 }
  if(instancia==0){
    if(chekar_boton_cuadrado(width/2-100,3*height/4-60,200,100)){
      instancia=1;
      comida=450;
      cambiarTodo(0,false);
    }
    else if (chekar_boton_cuadrado(480,20,100,100)){
      instancia=4;
      comida=450;
      cambiarTodo(0,false);
    }
  }
  if ((instancia>=1)&&(instancia<=3)){
    if (chekar_boton_cuadrado(10, 10, 50, 50)&&!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]){
      seleccionado[0]=true;
      seleccionado[1]=false;
      seleccionado[2]=false;
      objSeleccionado=0;
    }
    else if (chekar_boton_cuadrado(70, 10, 50, 50)&&!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]){
      seleccionado[0]=false;
      seleccionado[1]=true;
      seleccionado[2]=false;
      objSeleccionado=1;
    }
    else if (chekar_boton_cuadrado(130, 10, 50, 50)&&!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]){
      seleccionado[0]=false;
      seleccionado[1]=false;
      seleccionado[2]=true;
      objSeleccionado=2;
    }
    else if(seleccionado[0]||seleccionado[1]||seleccionado[2]) {
      construir();  
    }
    else if(!seleccionado[0]&&!seleccionado[1]&&!seleccionado[2]) {
      for(int i=0;i<=4;i++){
        for(int j=0;j<=13;j++){
          if((mouseY>=250+i*height/14)&&(mouseY<=250+height/14+i*height/14)&&(mouseX>=0+j*height/14)&&(mouseX<=height/14+j*height/14)){
            if(generadores[i][j][0]&&generadores[i][j][1]){
              comida+=50;
              generadores[i][j][1]=false;
            }
          }
        }
      }
 
    }
  }
  
}
