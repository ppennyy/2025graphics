//week13_1_processing_video
//Libraies-video
import processing.video.*;
//有視訊鏡頭的，用這個版本(沒視訊鏡頭，老師會在加幾行)
Capture video;//有視訊鏡頭的，用這個版本
Movie movie;//沒有鏡頭改用這個
void setup(){
  size(640,960);//常見的視訊
  //video=new Capture(this,640,480);
  //video.start();//打開視訊
  movie=new Movie(this,"street.mov");//讀檔案
  movie.loop();
}
void draw(){
  //if(video.available())video.read();
  //image(video,0,480);
  if(movie.available())movie.read();
  image(movie,0,0);
}
