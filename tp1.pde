//Juan Esquerra
//85104/0
//Tecnologia Multimedia
//Comision 4b
//TP1

PImage fondo;
PImage cursor;

float postext;
float speed=1;

PFont fuente1;
PFont fuente2;

int pantalla=0;

void setup(){
  noCursor();
  fuente1=createFont ("SilianRailLight.otf",32);
  fuente2=createFont ("TypoSlab_demo.otf",32);
  fondo=loadImage("fondo1.jpg");
  cursor=loadImage("cursor.png");
  size (660,353);
  background (0);
  
}

void draw(){
  
  image (fondo,0,0);        //fondo
  stroke (215,217,182);
  fill (215,217,182);
  line(0,130,width,130);   
  
  if (pantalla==0){              //pantalla introduccion
    textFont(fuente1,32);
    textSize(40);
    noStroke();
    
    if ((mouseX>=410) && (mouseX<=630) &&(mouseY>=60)&&(mouseY<=105)){        //colores del boton de comienzo
       fill(50);
    }
    else{    
      fill (10);
    }
    rect(410,45,220,60,8,8,8,8);            //dibujado del boton comienzo
    fill (215,217,182);
    text("Comienzo",420,90);
    
    if ((mousePressed)&&(mouseX>=410) && (mouseX<=630) &&(mouseY>=60)&&(mouseY<=105)){      //trigger del boton comienzo
      pantalla=1;
      postext=width+150;
    }
    textFont(fuente2,32);
    textSize(18);
    text("Durante los creditos puede mantener presionado el boton izquierdo \ndel raton para aumentar la velocidad",20,300);
  }
  
    if(!(pantalla==0)){            //boton de back
    noStroke();
    if((mouseX>=470)&&(mouseX<=570)&&(mouseY>=300)&&(mouseY<=330)){
      fill(50);
    }
    else{
      fill(20);
    }
    rect(470,300,100,30,8,8,8,8);
   
    fill (205,207,172);
    textSize(18);
    text("back",500,320);
    if((mousePressed)&&(mouseX>=470)&&(mouseX<=570)&&(mouseY>=300)&&(mouseY<=330)){
      pantalla=0;
    }
    stroke (215,217,182);
  }
  if (pantalla==1){    //pantalla 1
     textFont(fuente1,32);
     textSize (28);
     text("ALICE",postext,203);
     
     textSize (18);
     text("MADNESS RETURNS",postext-110,230);
     
     line (postext+160,100,postext+160,310);
     textFont(fuente2,20);
     
     pushMatrix();                  //guardo las configuraciones de geometria para a continuacion hacer el texto en vertical
     translate(postext,130);
     rotate(radians(90));
     
     text("Spicy horse Games",-25,-165);
     popMatrix();                  //revertir la config de geometria
     
     textSize(12);                //titulos
     text("Story",postext+220,155);
     text("Original Concept",postext+220,220);
     
     textSize(18);                //nombre de las personas
     text("R J Berg",postext+220,180);
     text("American McGee",postext+220,240);
     
     postext=postext-speed;      
     if (postext<=-400){            //trigger para pasar a siguiente pantalla
        pantalla++;
        println("pasar a 2");
        postext=width+50;
    }
  }
  if (pantalla==2){
     textFont (fuente2, 20);
     line (postext,100,postext,310);
     pushMatrix();
     translate(postext,130);
     rotate(radians(90));
     textSize(20);
     text("Animation",-25,-5);
     popMatrix();
     
     textSize(12);
     text("Animation Director",postext+70,155);
     text("Technical Animator",postext+70,200);
     text("Senior Animators",postext+70,250);
     text("Senior Cinematic Animator",postext+250,155);
     text("Animators",postext+250,200);
     
     textSize(18);
     text("Tang Yeping",postext+70,175);
     text("Bai Yanbing",postext+70,220);
     text("Lu Jun\nZhang Yu",postext+70,270);
     text("Chris Magovern",postext+250,175);
     text("Ding Xiaojun\nLü Haicao\nShao Weijin\nYu Tunghua",postext+250,220);
     
     if (postext<=-420){
        pantalla++;
        postext=width+50;
        println("pasar a 3");
     }
     postext=postext-speed;
  }
  if (pantalla==3){
  
     textFont (fuente2, 20);
     line (postext,100,postext,310);
     pushMatrix();
     translate(postext,130);
     rotate(radians(90));
     textSize(20);
     text("Art",-25,-5);
     text("3D Art",10,-200);
     popMatrix();
    
     textSize(12);
     text("Art Director",postext+70,155);
     text("Lead 3D Artist",postext+260,155);
     text("3D Artist",postext+380,155);
   
     textSize(18);
     text("Ken Wong",postext+70,175);
     text("Lin Xiao",postext+260,175);
     text("Cheng Qinning\nJohn Mah\nShen Fei\nTian Cuidong\nWang Ying\nXiang Jin\nZhao Ying",postext+380,175);
     
    if (postext<=-550){
       pantalla++;
       postext=width+50;
       println("pasar a 4");
    }
    postext=postext-speed;
  }
  if (pantalla==4){ 
   
     textFont (fuente2, 20);
     line (postext,100,postext,310);
     pushMatrix();
     translate(postext,130);
     rotate(radians(90));
     textSize(20);
     text("Audio",-25,-5);
     popMatrix();
     
     textSize(12);
     text("Audio Director",postext+70,155);
     text("Composer (Main Theme)",postext+70,200);
     text("Audio Designer",postext+70,250);
     text("Composer",postext+70,300);
     text("Audio Assistant",postext+260,155);
     
     textSize(18);
     text("Jason Tai",postext+70,175);
     text("Marshall Crutcher",postext+70,220);
     text("Roland Shaw",postext+70,270);
     text("Chris Vrenna",postext+70,320);
     text("Laura Lau",postext+260,175);
   
    if (postext<=-430){
       pantalla++;
       postext=width+50;
       println("pasar a 5");
    }
    postext=postext-speed;
  }
  if (pantalla==5){
   
     textFont (fuente2, 20);
     line (postext,100,postext,310);
     pushMatrix();
     translate(postext,130);
     rotate(radians(90));
     textSize(20);
     text("Level Design",-25,-5);
     popMatrix();;
     
     textSize(12);
     text("Lead Level Designers",postext+70,155);
     text("Senior Level Artists",postext+260,155);
     text("Level Designers",postext+420,155);
     
     textSize(18);
     text("Tomasz Dzierza\nChristope Garnier",postext+70,180);
     text("Cascha\nZhao Xu",postext+260,180);
     text("Greg Garrahan\nJi Feng\nGuillaume Le Bris\nLong Chengyun\nShen Xinghao\nSun Yiming",postext+420,180);
   
    if (postext<=-600){
      pantalla=0;
      postext=width+10;
      println("pasar a 0");
    }
    postext=postext-speed;
  }
image(cursor,mouseX,mouseY,30,30);
}


void mousePressed (){
  speed=3;
}
void mouseReleased(){
  speed=1;
}
