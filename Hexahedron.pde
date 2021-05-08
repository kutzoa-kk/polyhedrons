// 正六面体
class Hexahedron extends Polyhedron{
  
  Hexahedron(float r){
    super(r);
    vertices = new PVector[8];
    float l = r/sqrt(3);
    vertices[0] = new PVector(-l, -l, -l);
    vertices[1] = new PVector(-l, -l, l);
    vertices[2] = new PVector(-l, l, l);
    vertices[3] = new PVector(-l, l, -l);
    vertices[4] = new PVector(l, -l, -l);
    vertices[5] = new PVector(l, -l, l);
    vertices[6] = new PVector(l, l, l);
    vertices[7] = new PVector(l, l, -l);

    int[][] facev = {{0, 1, 2, 3}, {4, 5, 6, 7}, {0, 1, 5, 4}, {0, 4, 7, 3}, {1, 2, 6, 5}, {2, 3, 7, 6}};
    create_facevs(facev);
  }
  
  void show(){
    showVertices();
    showFaces();
    // Ipolygon(0, 1, 2, 3);
    // Ipolygon(4, 5, 6, 7);
    // for(int i = 0; i < 4; i++){
    //   Ipolygon(i, (i+1)%4, (i+1)%4+4, i+4);
    // }
  }
}
