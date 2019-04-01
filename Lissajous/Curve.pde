class Curve {
  ArrayList<PVector> path;
  PVector point;
  Curve() {
    path = new ArrayList<PVector>();
    point = new PVector();
  }
  void reset() {
    path.clear();
  }
  void setX(float x) {
    point.x = x;
  }
  void setY(float y) {
    point.y = y;
  }
  void addPoint() {
    path.add(point);
  }
  void show() {
    stroke(255);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector p : path) {
      vertex(p.x, p.y);
    }
    endShape();
    strokeWeight(5);
    point(point.x, point.y);
    point = new PVector();
  }
}
