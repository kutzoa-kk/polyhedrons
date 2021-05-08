// 正八面体
class Octahedron extends Polyhedron {

  Octahedron(float r) {
    super(r);
    vertices = new PVector[6];
    vertices[0] = new PVector(-r, 0, 0);
    vertices[1] = new PVector(r, 0, 0);
    vertices[2] = new PVector(0, -r, 0);
    vertices[3] = new PVector(0, r, 0);
    vertices[4] = new PVector(0, 0, -r);
    vertices[5] = new PVector(0, 0, r);
    int[][] facev = {{0, 2, 4}, {0, 2, 5}, {0, 3, 4}, {0, 3, 5}, {1, 2, 4}, {1, 2, 5}, {1, 3, 4}, {1, 3, 5}};
    create_facevs(facev);
  }
  
  void show(){
    showVertices();
    showFaces();
  }
}
