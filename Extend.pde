void point(PVector p){
  point(p.x, p.y, p.z);
}

void text(String str, PVector p){
  text(str, p.x, p.y, p.z);
}

void vertex(PVector p){
  vertex(p.x, p.y, p.z);
}

void polygon(PVector ... ps){
  beginShape();
  for(PVector p : ps){
    vertex(p);
  }
  endShape(CLOSE);
}

void showText3d(String str1, int x, int y) {
  pushMatrix();
  camera();
  hint(DISABLE_DEPTH_TEST);
  noLights();
  textMode(MODEL);
  text(str1, x, y);
  hint(ENABLE_DEPTH_TEST);
  popMatrix();
}
