//week13_4_camera_chessboard_texture_front_left
//把貼圖根camera整合在一起
PImage img;
void setup(){
  size(400,400,P3D);
  img=loadImage("chessboard.png");
  textureMode(NORMAL);
}
void draw(){//攝影機往前方看，左右移動
  camera(mouseX,200,mouseY,mouseX,200,mouseY-10,0,1,0);
   background(128);//灰背景
   beginShape();//正前方，z座標都放0
     texture(img);
     vertex(0,0,0,0,0);//x,y,z,u,v
     vertex(400,0,0,1,0);
     vertex(400,400,0,1,1);
     vertex(0,400,0,0,1);
   endShape();
   beginShape();//左方，x座標都放0
     texture(img);
     vertex(0,0,0,0,0);//x,y,z,u,v
     vertex(0,400,0,1,0);
     vertex(0,400,400,1,1);
     vertex(0,0,400,0,1);
   endShape();
}
