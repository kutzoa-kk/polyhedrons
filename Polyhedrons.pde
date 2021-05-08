import processing.opengl.*;

float r = 100;
int dispType = 0;
int formType = 0;
boolean fill_flag = true;
boolean depth_flag = true;
String filename =  "polyhedrons_obj/r01.obj";
String now_ph = "正四面体";
String select_file_name = "sキーでobjファイルを選択";

Tetrahedron tetrahedron = new Tetrahedron(r);
Hexahedron hexahedron = new Hexahedron(r);
Octahedron octahedron = new Octahedron(r);
Dodecahedron dodecahedron = new Dodecahedron(r);
Icosahedron icosahedron = new Icosahedron(r);
Polyhedron others = new Polyhedron(r);

void settings(){
  size(500, 500, OPENGL);
  //fullScreen(P3D);
}
void setup(){
  PFont font = createFont("HiraginoSans-W0", 50);
  textFont(font);
 //printArray(PFont.list());
  others.load_polyhedron(filename);
   //hint(DISABLE_DEPTH_TEST);//show hidden face
   //hint(ENABLE_STROKE_PERSPECTIVE);
}

void draw(){
  background(255);
  lights();
  translate(width/2, height/2); // 原点変更
  // rotateX((float)frameCount/500); // x方向に図形を回転し続ける
  // rotateY((float)frameCount/500);
  // rotateZ((float)frameCount/500);
  rotateY(radians(mouseX));    //Y軸に対してマウスのX軸の動きによって角度を変える
  rotateX(radians(mouseY));
  
  //sphere(r);
  if(fill_flag){
    fill(255, 120);
  }else{
    noFill();
  }
  //fill(255,255,255,255); // 図形の色
  switch(dispType){
    case 0:
      tetrahedron.show();
      break;
    case 1:
      hexahedron.show();
      break;
    case 2:
      octahedron.show();
      break;
    case 3:
      dodecahedron.show();
      break;
    case 4:
      icosahedron.show();
      break;
    case 5:
      others.show();
      break;
  }
  
  // 現在の図形をテキスト表示
  fill(0);
  textSize(20);
  showText3d(now_ph, 5, 25);
  showText3d("k or jキーで多面体変更，lキーで現在の多面体の変形", 5, 45);
  showText3d("fキーで多面体の面の透明度の変更", 5, 65);
  showText3d("dキーで視差効果のON,OFF", 5, 85);
}

void keyPressed(){
  if(key == 'k'){
    dispType = (dispType + 1) % 6;
  }else if(key == 'j'){
    dispType--;
    if(dispType < 0){
      dispType = 5;
    }
  }else if(key == 'l'){
    formType = (formType + 1) % 6;
  }else if(key == 's'){
    selectInput("select a file", "objfileSelected");
    dispType = 5;
  }else if(key == 'f'){
    fill_flag = !fill_flag;
  }else if(key=='d'){
    depth_flag = !depth_flag;
    if(depth_flag){
      perspective();
    }else{
      ortho();
    }
  }

  switch(dispType){
    case 0:
      switch(formType){
        case 0:
          now_ph = "正四面体";
          filename = "polyhedrons_obj/r01.obj";
          break;
        case 1:
          now_ph = "正四面体:切頂";
          filename = "polyhedrons_obj/s03.obj";
          break;
        case 2:
          now_ph = "正四面体:中央切";
          filename = "polyhedrons_obj/r02.obj";
          break;
        case 3:
          now_ph = "正四面体:面出";
          filename = "polyhedrons_obj/s01.obj";
          break;
        case 4:
          now_ph = "正四面体:切頂＋面出";
          filename = "polyhedrons_obj/s04.obj";
          break;
        case 5:
          now_ph = "正四面体:面出＋捻り";
          filename = "polyhedrons_obj/s12L.obj";
          break;
        default:
          now_ph = "正四面体";
          filename = "polyhedrons_obj/r01.obj";
          break;
      }
      tetrahedron.load_polyhedron(filename);
      break;
    case 1:
      switch(formType){
        case 0:
          now_ph = "正六面体";
          filename = "polyhedrons_obj/r03.obj";
          break;
        case 1:
          now_ph = "正六面体:切頂";
          filename = "polyhedrons_obj/s05.obj";
          break;
        case 2:
          now_ph = "正六面体:中央切";
          filename = "polyhedrons_obj/s01.obj";
          break;
        case 3:
          now_ph = "正六面体:面出";
          filename = "polyhedrons_obj/s08.obj";
          break;
        case 4:
          now_ph = "正六面体:切頂＋面出";
          filename = "polyhedrons_obj/s10.obj";
          break;
        case 5:
          now_ph = "正六面体:面出＋捻り";
          filename = "polyhedrons_obj/s12L.obj";
          break;
      }
      hexahedron.load_polyhedron(filename);
      break;
    case 2:
      switch(formType){
        case 0:
          now_ph = "正八面体";
          filename = "polyhedrons_obj/r02.obj";
          break;
        case 1:
          now_ph = "正八面体:切頂";
          filename = "polyhedrons_obj/s04.obj";
          break;
        case 2:
          now_ph = "正八面体:中央切";
          filename = "polyhedrons_obj/s01.obj";
          break;
        case 3:
          now_ph = "正八面体:面出";
          filename = "polyhedrons_obj/s08.obj";
          break;
        case 4:
          now_ph = "正八面体:切頂＋面出";
          filename = "polyhedrons_obj/s10.obj";
          break;
        case 5:
          now_ph = "正八面体:面出＋捻り";
          filename = "polyhedrons_obj/s12R.obj";
          break;
      }
      octahedron.load_polyhedron(filename);
      break;
    case 3:
      switch(formType){
        case 0:
          now_ph = "正十二面体";
          filename = "polyhedrons_obj/r04.obj";
          break;
        case 1:
          now_ph = "正十二面体:切頂";
          filename = "polyhedrons_obj/s07.obj";
          break;
        case 2:
          now_ph = "正十二面体:中央切";
          filename = "polyhedrons_obj/s02.obj";
          break;
        case 3:
          now_ph = "正十二面体:面出";
          filename = "polyhedrons_obj/s09.obj";
          break;
        case 4:
          now_ph = "正十二面体:切頂＋面出";
          filename = "polyhedrons_obj/s11.obj";
          break;
        case 5:
          now_ph = "正十二面体:面出＋捻り";
          filename = "polyhedrons_obj/s13L.obj";
          break;
      }
      dodecahedron.load_polyhedron(filename);
      break;
    case 4:
      switch(formType){
        case 0:
          now_ph = "正二十面体";
          filename = "polyhedrons_obj/r05.obj";
          break;
        case 1:
          now_ph = "正二十面体:切頂";
          filename = "polyhedrons_obj/s06.obj";
          break;
        case 2:
          now_ph = "正二十面体:中央切";
          filename = "polyhedrons_obj/s02.obj";
          break;
        case 3:
          now_ph = "正二十面体:面出";
          filename = "polyhedrons_obj/s09.obj";
          break;
        case 4:
          now_ph = "正二十面体:切頂＋面出";
          filename = "polyhedrons_obj/s11.obj";
          break;
        case 5:
          now_ph = "正二十面体:面出＋捻り";
          filename = "polyhedrons_obj/s13R.obj";
          break;
      }
      icosahedron.load_polyhedron(filename);
      break;
    case 5:
      now_ph = select_file_name;
      break;
  }
}

void objfileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    String name = selection.getName();
    String extension = name.substring(name.lastIndexOf("."));
    if(extension.equals(".obj")){
      others.load_polyhedron(selection.getAbsolutePath());
      now_ph = name;
    }else{
      now_ph = "選択したファイルの拡張子が異なります : " + name;
    }
  }
}
