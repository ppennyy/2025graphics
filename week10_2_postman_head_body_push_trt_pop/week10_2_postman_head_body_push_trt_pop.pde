//week10_2_postman_head_body_push_trt_pop
PImage postman,head,body;
void setup(){
  size(560,560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
}
void draw(){
  background(#FFFFF2);
  image(postman,0,0);//基礎的 郵差先生(全身)
  fill(255,0,255,128);//半透明的紫色
  rect(0,0,560,560);//蓋上去
  pushMatrix();
    translate(+236,+231);
    rotate(radians(mouseX));
    translate(-236,-231);//把頭的旋轉中心
    image(head,0,0);//在畫我們的頭
  popMatrix();
  image(body,0,0);//在畫身體
}
