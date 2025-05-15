//week13_3_texture_textureMode_beginShape_vertex_endShape
//先交貼圖之後再加進去
//https://processing.org/reference/texture_.html
PImage img;
void setup(){
  size(400,400,P3D);//要加P3D才有OpenGL 3D功能
  img=loadImage("chessboard.png");
  textureMode(NORMAL);
}
void draw(){
  background(128);//灰背景
  beginShape();//開始畫
  texture(img);//把圖片當貼圖
  vertex(40,80,0,0);//4個頂點vertex的四邊形，會截出2個三角形
  vertex(320,20,1,0);
  vertex(380,360,1,1);
  vertex(160,380,0,1);
  endShape();
}
