PVector v0 = new PVector(0, -400);
PVector v1 = new PVector( 200 * sqrt(3), 200);
PVector v2 = new PVector(-200 * sqrt(3), 200);
PVector v = new PVector(-200 * sqrt(3), 200);

void setup() {
  size(900, 900);
  background(0);
  fill(255); stroke(255);
  strokeWeight(10);
  translate(height / 2, width / 2);
  point(v0.x, v0.y);
  point(v1.x, v1.y);
  point(v2.x, v2.y);
  strokeWeight(1);
}

void draw() {
  translate(height / 2, width / 2);
  int opt = (int)random(3);
  //println(opt);
  if (opt == 0) {
    PVector dv = PVector.sub(v0, v);
    v.add(dv.div(2));
  } else if (opt == 1) {
    PVector dv = PVector.sub(v1, v);
    v.add(dv.div(2));
  } else {
    PVector dv = PVector.sub(v2, v);
    v.add(dv.div(2));
  }
  point(v.x, v.y);
}
