class Boundary
{
  Body body;
  
  float x, y, w, h;
  
  Boundary(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));
    
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dw = box2d.scalarPixelsToWorld(w/2);
    float box2dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw, box2dh);
    
    body.createFixture(ps, 1);
  }
  
  void display()
  {
    fill(0);
    stroke(0);
    
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}
