// 正四面体
class Tetrahedron extends Polyhedron{
  
  Tetrahedron(float r){
    super(r);
    vertices = new PVector[4];
    vertices[0] = new PVector(radius*sqrt(6)/3, radius/3, -radius*sqrt(2)/3);
    vertices[1] = new PVector(-radius*sqrt(6)/3, radius/3, -radius*sqrt(2)/3);
    vertices[2] = new PVector(0, radius/3, radius*2*sqrt(2)/3);
    vertices[3] = new PVector(0, -radius, 0);
    //println(vertices);
    ArrayList<Integer> temp = new ArrayList<Integer>();
    temp.add(0);temp.add(1);temp.add(2);
    face_vs.add(temp);
    ArrayList<Integer> temp2 = new ArrayList<Integer>();
    temp2.add(0);temp2.add(1);temp2.add(3);
    face_vs.add(temp2);
    ArrayList<Integer> temp3 = new ArrayList<Integer>();
    temp3.add(1);temp3.add(2);temp3.add(3);
    face_vs.add(temp3);
    ArrayList<Integer> temp4 = new ArrayList<Integer>();
    temp4.add(2);temp4.add(0);temp4.add(3);
    face_vs.add(temp4);
    //println(face_vs);
  }
  
  void show(){
    showVertices();
    showFaces();
    // Ipolygon(0, 1, 2);
    // Ipolygon(0, 1, 3);
    // Ipolygon(1, 2, 3);
    // Ipolygon(2, 0, 3);
  }
}
