//https://youtu.be/Gb49VE63Cu8
//Juan Esquerra
//legajo 85104/0
//Tecno multimedia Com 4
//Tp3
//
int instancia;      //num de pantalla
int objSeleccionado;//que objeto selecciono para construir 
int recursos;       //recursos necesarios para construir
int puntaje;        //puntaje necesario para pasar al siguiente nivel
int tiempoenInstancia;    //para llevar cuenta de cuanto tiempo lleva en el nivel

float posicionDisparos; // posicion de los pew pew
float posicionOleada;   //posicion de la oleada de enemigos

boolean[]seleccionado= new boolean [3];    //que edificio selecciono el jugador para construir
boolean[][]lineaOcupada= new boolean [5][14]; //que lineas tienen un objeto construido
boolean[][]disparos= new boolean [5][14];// que disparos estan activos
boolean[][][]generadores=new boolean[5][14][2];//llevar cuenta de en que linea hay un generador y si tiene recursos que recoger
boolean[][]torretas=new boolean [5][14]; //llevar cuenta de en que linea hay una torreta
boolean[][]hayEnemigos=new boolean[5][30];//llevar cuenta de en que posiciones hay enemigos

int []costes= new int [3];          //costes de las construcciones
int[][]lineaObjeto= new int[5][14]; //llevar cuentas de que tipo de edificio hay en cada casilla
int[][]vidaEnemigos=new int[5][30]; //lleva cuenta de la vida de cada enemigo

PImage torreta;
PImage[] generador=new PImage [2];
PImage[] enemigo=new PImage [6];

void setup(){
size (600,600);
instancia=0;
costes[0]=0;
costes[1]=100;
costes[2]=250;
recursos=450;
resetearTodo();
textSize(12);
cargarImagenes();
}

void draw (){
  background(0);
  noFill();
  stroke(255);
  
  if (instancia==0){    //pantalla 0
    dibujarInicio();
  }
  else if (instancia==1){ //pantalla 1
    dibujar_layout (instancia); 
    dibujarEstructuras();
    generacionRecursos();
    if (tiempoenInstancia>=20){
      disparar();
      dibujarEnemigosyProyectiles();
      colisiones();
    }
    if(frameCount%60==0){
      tiempoenInstancia++;
    }
    if  (puntaje>=120){
      botonVictoria();
    }
  }
  else if (instancia==2){ //pantalla 2
    dibujar_layout (instancia);
    dibujarEstructuras ();
    generacionRecursos();
    if (tiempoenInstancia>=20){
      disparar();
      dibujarEnemigosyProyectiles();
      colisiones();
    }
    if(frameCount%60==0){
      tiempoenInstancia++;
    }
    if  (puntaje>=420){
      botonVictoria();
    }
  }
  else if (instancia==3){ //pantalla 3
    dibujar_layout (instancia);
    dibujarEstructuras ();
    generacionRecursos();
    if (tiempoenInstancia>=20){
      disparar();
      dibujarEnemigosyProyectiles();
      colisiones();
    }
    if(frameCount%60==0){
      tiempoenInstancia++;
    }
    if  (puntaje>=700){
      botonVictoria();
    }
  }
  else if (instancia==4){ // pantalla 4
    dibujarCreditos();
  }
}

void mouseClicked(){
  probarBotones();
}
