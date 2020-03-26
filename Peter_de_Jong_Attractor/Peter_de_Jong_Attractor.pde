float a = -2;
float b = -2;
float c = -1.2;
float d = 2;

float x = 0, y = 0.5;


void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  translate(width / 2, height / 2);
}

void draw() {
  translate(width / 2, height / 2);
  float nx = sin(a * y) - cos(b * x);
  float ny = sin(c * x) - cos(d * y);
  x = nx; y = ny;
  point(x * 150, y * 150);
}
