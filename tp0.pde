//Juan Esquerra 85104/0
//Trabajo Practico 0
//dibujo de un pato

void setup(){
  size (600,600);
  background (0);

  //patas
  stroke(220,140,0);
  strokeWeight(10);
  fill(220,140,0);
  
  line(270,324,261,395
);
  line(317,306,314,396
);

  noStroke();
  triangle(266,400,223,381,219,401
);
  triangle(319,400,282,389,289,415
);

  //cuerpo
  noStroke();
  fill (240);
  ellipse(width/2,height/2,180,100);
  triangle(321,254,370,323,425,262
);
  
  //cuello
  noFill();
  stroke(240);
  strokeWeight(20);
  bezier(254,336,150,301,280,262,173,206
);
  line(172,220,201,229
);

  //cabeza
  strokeWeight(1);
  fill(240);
  ellipse(173,216,40,40);
  
  //pico
  noStroke();
  fill(220,140,0); 
  ellipse(157,220,15,25);
  quad(151,212,159,231,137,243,127,227
);
  ellipse(134,233,10,20);
  ellipse(134,228,15,12);
  
  //ojo
  strokeWeight(10);
  stroke(0);
  point(174,207);


}

//use este evento para ayudarme a encontrar las coordenadas donde colocar las figuras
void draw() {}

void mousePressed(){
    println(mouseX,mouseY);
}
