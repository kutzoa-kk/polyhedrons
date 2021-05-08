// 正二十面体
class Dodecahedron extends Polyhedron{
  Hexahedron hexahedron;
  Dodecahedron(float r){
    super(r);
    hexahedron = new Hexahedron(r);
    vertices = new PVector[20];
    float l = r/sqrt(3);
    float phi = l*(1+sqrt(5))/2;
    float Dphi = l*(sqrt(5)-1)/2;
    vertices[0] = hexahedron.vertices[0];
    vertices[1] = hexahedron.vertices[1];
    vertices[2] = hexahedron.vertices[2];
    vertices[3] = hexahedron.vertices[3];
    vertices[4] = hexahedron.vertices[4];
    vertices[5] = hexahedron.vertices[5];
    vertices[6] = hexahedron.vertices[6];
    vertices[7] = hexahedron.vertices[7];
    vertices[8] = new PVector(0, -phi, -Dphi);
    vertices[9] = new PVector(0, -phi, Dphi);
    vertices[10] = new PVector(0, phi, Dphi);
    vertices[11] = new PVector(0, phi, -Dphi);
    vertices[12] = new PVector(-Dphi, 0, -phi);
    vertices[13] = new PVector(Dphi, 0, -phi);
    vertices[14] = new PVector(Dphi, 0, phi);
    vertices[15] = new PVector(-Dphi, 0, phi);
    vertices[16] = new PVector(-phi, -Dphi, 0);
    vertices[17] = new PVector(-phi, Dphi, 0);
    vertices[18] = new PVector(phi, Dphi, 0);
    vertices[19] = new PVector(phi, -Dphi, 0);
    int[][] facev = {
      {0, 8, 9, 1, 16},
      {4, 8, 9, 5, 19},
      {1, 16, 17, 2, 15},
      {5, 19, 18, 6, 14},
      {2, 10, 11, 3, 17},
      {6, 10, 11, 7, 18},
      {3, 17, 16, 0, 12},
      {7, 18, 19, 4, 13},
      {0, 12, 13, 4, 8},
      {3, 12, 13, 7, 11},
      {1, 15, 14, 5, 9},
      {2, 15, 14, 6, 10}
    };
    create_facevs(facev);
  }
  
  void show(){
    showVertices();
    // hexahedron.show();
    // fill(255, 0, 0, 100);Ipolygon(8, 9, 10, 11);
    // fill(0, 255, 0, 100);Ipolygon(12, 13, 14, 15);
    // fill(0, 0, 255, 100);Ipolygon(16, 17, 18, 19);
    // fill(255, 100);
    showFaces();
  }
}
