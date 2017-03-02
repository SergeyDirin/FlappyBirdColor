class Button{
 
  int x;
  int y;
  String capt;
  
  int weight = 4;
  int padding = 10;
  
  int w;
  int h;
  
  
  PImage bgImage;
  
  Button(String _capt){
    capt = _capt;
    w = floor(textWidth(capt)) + padding * 2;
    h = textSize + padding * 2;
    x = width - w - padding * 3;
    y = padding * 2;
    println(x);
    println(y);
    bgImage = loadImage("but.png");
    
  }
  
  void show(){
    pushStyle();
    stroke(255);
    //strokeWeight(weight);
    fill(0);
    if (mousePressed && isOver()){
      rect(x - padding, y - padding, w + padding * 2, h + padding * 2, 10);
    }
    
    image(bgImage, x, y, w, h);
    
    fill(50, 50, 0);
    textAlign(CENTER, CENTER);
    text(capt, x + (w / 2), y + (h / 2));
    popStyle();
  }
  
  boolean isOver(){
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      return true;
    } else {
      return false;
    }
  }
}