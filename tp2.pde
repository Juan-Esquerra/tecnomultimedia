//  https://youtu.be/hIgCnlCHUoY
/*Juan Esquerra
Legajo 85104/0
Tp2 comision 4
*/
float angulo=0;

void setup(){
  size(500,500);
}

void draw (){
  background (0);
  fill(50);
  rect((width-50),0,50,height);
  ellipse(50,height-50,50,50);
  
  pushStyle();
  
  fill(255);
  text("haga clic y arrastre el mouse en esa franja para cambiar la rotacion ->",0,10);
  text("reset",35,height-45);
  
  pushMatrix();
  translate(width/2,height/2);
  
  for (int i=300;i>0;i-=15){
    rotate(radians(angulo-6));
    rectMode(CENTER);
    
    if (!alternar(i)){
      fill(255);
    }
    else{
      fill(0); 
    }
    
    rect (0,0,i,i);
  }
  popMatrix();
  popStyle();
  
}
