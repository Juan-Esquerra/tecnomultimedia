boolean alternar (float coso){
  return((coso%30)==0);
}

void mouseDragged(){
  if (mouseX>=width-50){
    angulo=(map(mouseY,height,0,0,360));
  }
}

void mouseClicked(){
  if ((dist(50,height-50,mouseX,mouseY))<=25){
    angulo=0;
  }
}
