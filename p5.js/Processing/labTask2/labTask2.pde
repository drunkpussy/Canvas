float bounds = 380;
ArrayList<PImage> texture;
ArrayList<Ball> balls;
float gravity = 0.98;

void setup()
{
  size(700, 700, P3D);
  texture = new ArrayList<PImage>();
  balls = new ArrayList<Ball>();
  PImage texture1 = loadImage("texture.jpg"); 
  PImage texture2 = loadImage("texture2.jpg");
  PImage texture3 = loadImage("texture3.jpg");
  PImage texture4 = loadImage("texture4.jpg");
  PImage texture5 = loadImage("texture5.jpg");
  PImage texture6 = loadImage("texture6.jpg");
  PImage texture7 = loadImage("texture7.jpg");
  PImage texture8 = loadImage("texture8.jpg");
  texture.add(texture1);
  texture.add(texture2);
  texture.add(texture3);
  texture.add(texture4);
  texture.add(texture5);
  texture.add(texture6);
  texture.add(texture7);
  texture.add(texture8);
  
  
  
}

void draw()
{
  translate(width/2, height/2, 0);
  
  background(50);
  lights();
  
  stroke(255);
  
  noFill();
  box(bounds);
  
  for(int i=0; i<balls.size(); i++)
  {
    balls.get(i).display();
    balls.get(i).update();
  }
}

void mouseClicked()
{
  Ball ball = new Ball(mouseX-width/2, mouseY-width/2, -width/2+200, random(20, 45), texture.get((int)random(texture.size())));
  balls.add(ball);
}