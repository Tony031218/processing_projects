import peasy.*;

float x = 3.051522;
float y = 1.582542;
float z = 15.62388;
float t;

float sigma = 10;
float rho = 28;
float beta = 8.0 / 3.0;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup() {
  size(1280, 720, P3D);
  background(0);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = ( sigma * (y - x) ) * dt;
  float dy = (x * (rho - z) - y) * dt;
  float dz = ( x * y - beta * z) * dt;
  x += dx;
  y += dy;
  z += dz;

  points.add(new PVector(x, y, z));

  translate(0, 0, -80);
  scale(5);
  stroke(255);
  strokeWeight(0.75);
  noFill();
  
  float h = 0;
  beginShape();
  for (PVector p : points) {
    stroke(h, 255, 255);
    vertex(p.x, p.y, p.z);
    h += 0.1;
    if (h > 255) {
      h = 0;
    }
  }
  endShape();

  t += dt;
}
