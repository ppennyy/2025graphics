//week13_2_camera_movie_eye_center_up
//電腦圖學繪圖時，會設定camera的相關係數
import processing.video.*;//要使用影片的外掛喔
Movie movie;//要放影片的變數
void setup(){
  size(720,480,P3D);
  movie=new Movie(this,"street.mov");
  movie.loop();//迴圈係數
}
void draw(){
  background(128);
  //https://processing.org/reference/camera_.html
  camera(mouseX,mouseY,500,360,240,0,0,1,0);
  //很多參數 eyeX,eyeY,eyeZ,centerX,centerY,centerZ,upX,upY,upZ
  
  if(movie.available())movie.read();//有新畫面，就讀入
  image(movie,0,0);
}
