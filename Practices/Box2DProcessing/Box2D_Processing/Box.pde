class Box
{
  Body body;
  
  //float x, y; when body take care about x, y location
  float w, h;
  
  Box(float _x, float _y)
  {
    w = 16;
    h = 16;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));
    
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dw = box2d.scalarPixelsToWorld(w/2);
    float box2dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw, box2dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1.0;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  }
  
  void killBody()
  {
    box2d.destroyBody(body);
  }
  
  void display()
  {
    fill(175);
    stroke(0);
    
    pushMatrix();
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    translate(pos.x, pos.y);
    rotate(-a);    
    rectMode(CENTER);
    rect(0, 0, w, h);
    
    popMatrix();
  }
}
