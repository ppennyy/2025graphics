//week11_2_postman_alpha_interpolation
//改至week11_1postman_saveString_loadStrings
//修改至week10_6_postman_many_angle_ID_saveStrings_loadStrings
PImage postman,head,body,uparm1,hand1,uparm2,hand2;
float[]angle=new float[20];
int ID = 0;
void mouseDragged(){
  angle[ID]+=mouseX-pmouseX;
}
void keyPressed(){
  if(key=='1')ID=1;
  if(key=='2')ID=2;
  if(key=='3')ID=3;
  if(key=='4')ID=4;
  if(key=='5')ID=5;
  if(key=='6')ID=6;
  if(key=='0')ID=0;
  
  if(key=='s'){//從這裡開始
    String now="";
    for(int i=0;i<20;i++){
      now+=angle[i]+" ";
    }
    lines.add(now);//把現在的這行，加到lines裡
    String[]arr=new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt",arr);
  }
  if(key=='r'){//replay
    if(R==0){
      String [] file=loadStrings("angles.txt");
      if(file!=null){
        for(int i=0;i<file.length;i++){
          lines.add(file[i]);//加到lines資料結構裡
        }
      }
    }
    if(R<lines.size()){
      float[]now=float(split(lines.get(R),' '));
      for(int i=0;i<20;i++)angle[i]=now[i];
      R=(R+1)%lines.size();
    }
  }
  if(key=='p'){
    int R2=(R+1)%lines.size();
    float[]oldAngle=float(split(lines.get(R),' '));
    float[]newAngle=float(split(lines.get(R2),' '));
    float alpha=(frameCount%30)/30.0;
    for(int i=0;i<20;i++)angle[i]=oldAngle[i]*(1-alpha)+newAngle[i]*alpha;
  }
}
int R=0;
String [] another;
ArrayList<String> lines=new ArrayList<String>();//放移動的 結果
void setup(){
  size(560,560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  hand1 = loadImage("hand1.png");
  uparm2 = loadImage("uparm2.png");
  hand2 = loadImage("hand2.png");
}
void draw(){
  background(#FFFFF2);
  image(postman,0,0);//基礎的郵差先生(全身)
  fill(255,0,255,128);//半透明的紫色
  rect(0,0,560,560);//蓋上去
  pushMatrix();
    translate(+185,+261);
    rotate(radians(angle[1]));
    translate(-185,-261);//把頭的旋轉中心
    image(uparm1,0,0);//在畫我們的頭
    pushMatrix();
      translate(+116,+265);
      rotate(radians(angle[2]));
      translate(-116,-265);
      image(hand1,0,0);
    popMatrix();
  popMatrix();
  
  pushMatrix();
    translate(+290,+262);
    rotate(radians(angle[3]));
    translate(-290,-262);
    image(uparm2,0,0);
    pushMatrix();
      translate(+357,+259);
      rotate(radians(angle[4]));
      translate(-357,-259);
      image(hand2,0,0);
    popMatrix();
  popMatrix();
  
  pushMatrix();
    translate(+236,+231);//再放回去正確的位置
    rotate(radians(angle[0]));
    translate(-236,-231);
    image(head,0,0);
  popMatrix();
  image(body,0,0);//在畫身體
}
