import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
Boundary[] boundaries = new Boundary[2];
Box2DProcessing box2d;

void setup()
{
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  size(400, 300);
  boxes = new ArrayList<Box>();  
  
  //for(int i = 0; i< boundaries.length; i++)
  {
    boundaries[0] = new Boundary(100, 150, 200, 20);
    boundaries[1] = new Boundary(300, 250, 200, 10);
  }
}

void draw()
{
  box2d.step();
  background(255); 
  
  if(mousePressed)
  {
    Box box = new Box(mouseX, mouseY);
    boxes.add(box);
  }
  
  for(Box b : boxes)
  {
    b.display();
  }
  
  for(Boundary bound : boundaries)
  {
    bound.display();
  }
}
