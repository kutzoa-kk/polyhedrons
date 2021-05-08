// 多面体のベースクラス
class Polyhedron{
  float radius;
  PVector[] vertices;
  ArrayList<ArrayList<Integer>> face_vs = new ArrayList<ArrayList<Integer>>();
  
  Polyhedron(float r){
    radius = r;
  }
  void printdata(){
    println(vertices);
    println(face_vs);
  }
  void showVertices(){
    strokeWeight(10);
    for(int i = 0; i < vertices.length; i++){
      Ipoint(i);
    }
    strokeWeight(1);
  }
  
  void showFaces(){
    for(ArrayList<Integer> face_v : face_vs){
      Ipolygon2(face_v);
    }
  }
  
  void show(){
    showVertices();
    showFaces();
  }
  // 頂点を描く
  void Ipoint(int i){
    point(vertices[i]);
  }
  
  // 多面体を描く
  void Ipolygon(int ... is){
    beginShape();
    for(int index : is){
      vertex(vertices[index]);
    }
    endShape(CLOSE);
  }

  void Ipolygon2(ArrayList<Integer> fv){
    beginShape();
    for(int f : fv){
      vertex(vertices[f]);
    }
    endShape(CLOSE);
  }
  
  void create_facevs(int[][] facev){
    for(int[] te : facev){
      ArrayList<Integer> temp = new ArrayList<Integer>();
      for(int t : te){
        temp.add(t);
      }
      face_vs.add(temp);
    }
  }
  
  void load_polyhedron(String filename){
    ArrayList<ArrayList<Float>> v = new ArrayList<ArrayList<Float>>();
    ArrayList<ArrayList<Integer>> f = new ArrayList<ArrayList<Integer>>();

    String[] lines = loadStrings(filename);
    for(int i = 0; i < lines.length; i++){
      String[] result = lines[i].split("  | ");
      if(result[0].equals("v")){
        ArrayList<Float> ve = new ArrayList<Float>();
        for(int j = 1; j < result.length; j++){
          ve.add(float(result[j])*radius);
        }
        v.add(ve);
      }else if(result[0].equals("f")){
        ArrayList<Integer> fa = new ArrayList<Integer>();
        for(int j = 1; j < result.length; j++){
          fa.add(int(result[j])-1);
        }
        f.add(fa);
      }
    }
    
    int v_size = v.size();
    vertices = new PVector[v_size];
    for(int i = 0; i < v_size; i++){
      Float[] vf = v.get(i).toArray(new Float[3]);
      vertices[i] = new PVector(vf[0], vf[1], vf[2]);
    }
    face_vs = f;
    
    println("Vertices");
    for(int i = 0; i < v.size(); i++){
      print(i); print(" : "); println(v.get(i));
    }
    //println(v);
    //println(vertices);
    println("各面を構成する点の組み合わせ");
    println(f);
  }

}
