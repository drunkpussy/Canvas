class Ball
{
  
  PVector position;
  PVector velocity;
  PShape ball;
  
  float diameter;
  
  Ball(float x, float y, float z, float d, PImage t)
  {
    position = new PVector();
    position.x = x;
    position.y = y;
    position.z = z;
    this.diameter = d;
    ball = createShape(SPHERE, diameter);
    ball.setTexture(t);
    ball.setStroke(false);
    
    
    velocity = new PVector();
    velocity.x = random(-10, 10);
    velocity.y = random(-15, 15);
    velocity.z = random(-10, 0);
    
    
  }
  
  void update()
  {
    velocity.y += gravity;
    position.add(velocity);
    
    
    if (position.x > (bounds/2-diameter))
    {
      position.x = bounds/2-diameter;
      velocity.x*=-1;
    }else if(position.x < -(bounds/2-diameter))
    {
      position.x = -(bounds/2-diameter);
      velocity.x*=-1;
    }
    
    if (position.y > (bounds/2-diameter))
    {
      position.y = (bounds/2-diameter);
      velocity.y*=-1;
    }else if(position.y < -(bounds/2-diameter))
    {
      position.y = -(bounds/2-diameter);
      velocity.y*=-1 + 0.98;
    }
    if (position.z > (bounds/2-diameter)) {
      position.z = (bounds/2-diameter);
      velocity.z*=-1;
    }else if(position.z < -(bounds/2-diameter))
    {
      position.z = -(bounds/2-diameter);
      velocity.z*=-1;
    }

  }
  
  
  void display()
  {
    pushMatrix();
    translate(position.x, position.y, -position.z);
    shape(ball);
    popMatrix();
  }
}