//week13_6_combine_all_Movie_Capture_camera_sin_cos_P3D
//把今天教的全部加進去
//street.mov及chessboard.png都拉進來
import processing.video.*;
Movie movie;
PImage img;
void setup(){
  size(400,400,P3D);
  movie=new Movie(this,"street.mov");//720x480
  movie.loop();//要記得把視訊循環撥放
  img=loadImage("chessboard.png");
  textureMode(NORMAL);
  video=new Capture(this,640,480);
  video.start();//要記得開始撥放
}
Capture video;//有鏡頭在加它
void draw(){
  camera(200,200,200,200+cos(radians(frameCount)),200,200+sin(radians(frameCount)),0,1,0);
  background(128);
  if(movie.available())movie.read();
  beginShape();//正前方的牆
  texture(img);
     vertex(0,0,0,0,0);//x,y,z,u,v
     vertex(400,0,0,1,0);
     vertex(400,400,0,1,1);
     vertex(0,400,0,0,1);
   endShape();
   translate(0,0,1);
   image(movie,0,0,360,240);
   if(video.available())video.read();//有畫面，就讀入畫面
   beginShape();//左邊的牆直接放視訊畫面
   texture(video);//把視訊，也當成一面牆的貼圖
     vertex(0,0,0,0,0);//x,y,z,u,v
     vertex(0,4000,0,1,0);
     vertex(0,400,400,1,1);
     vertex(0,0,400,0,1);
   endShape();
}
