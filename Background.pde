class Background{
PImage bgImage;
int bgX = 0;

int w = width * 3;

  Background(){
    bgImage = loadImage("bg-sky.jpg");
  }

  void show(){
    image(bgImage, bgX, 0, w, height);
    image(bgImage, w + bgX, 0, w, height);
  }

  void update(){
    bgX += speed;
    if(-bgX >= w) {
      bgX = 0;
    }
  }

}