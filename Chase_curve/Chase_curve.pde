float dx = 0.1;
PVector A = new PVector(0, -400);
PVector B = new PVector( 200 * sqrt(3), 200);
PVector C = new PVector(-200 * sqrt(3), 200);
float h = 0;

void setup() {
  size(900, 900);
  background(0);
  colorMode(HSB);
  stroke(h, 255, 255);
  translate(width / 2, height / 2);
  Line(A, B); Line(A, C); Line(B, C);
}

void draw() {
  translate(width / 2, height / 2);
  stroke(h, 255, 255);
  
  PVector nC = PVector.add(C, PVector.sub(B, C).setMag(dx));
  PVector nB = PVector.add(B, PVector.sub(A, B).setMag(dx));
  PVector nA = PVector.add(A, PVector.sub(C, A).setMag(dx));
  C = nC; B = nB; A = nA;
  Line(A, B); Line(A, C); Line(B, C);
  
  h += 0.1;
  if (h > 255) {
    h = 0;
  }
}



void Line(PVector A, PVector B) {
  line(A.x, A.y, B.x, B.y);
}
