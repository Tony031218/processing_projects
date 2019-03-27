class Segment {
  PVector a, b;
  
  Segment(PVector a_, PVector b_) {
    a = a_.copy();
    b = b_.copy();
  }
  
  Segment[] getChildren() {
    Segment[] children = new Segment[4];
    PVector v = PVector.sub(b, a);
    v.div(3);
    
    PVector a1 = PVector.add(a, v);
    children[0] = new Segment(a, a1);
    
    PVector b1 = PVector.sub(b, v);
    children[3] = new Segment(b1, b);
    
    v.rotate(-PI / 3);
    PVector c = PVector.add(v, a1);
    children[1] = new Segment(a1, c);
    children[2] = new Segment(c, b1);
    
    return children;
  }
  
  void show() {
    stroke(255);
    line(a.x, a.y, b.x, b.y);
  }
}
