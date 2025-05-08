//week12_6_sound
//Sketch-Library-Managed Libraries找sound
//會看到Sound | Provides a simple way to work with audio
//選他右上角Install下載
//File-Example點開Libraries
//Soundfile看SimplePlayback
import processing.sound.*;
SoundFile mySound;
void setup(){
  size(400,400);
  mySound=new SoundFile(this,"music.mp3");
  mySound.play();//播放
}
void draw(){
  
}
