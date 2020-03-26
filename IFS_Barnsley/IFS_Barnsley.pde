PVector v = new PVector(0, 0);

void setup() {
  size(1100, 1100);
  background(0);
  fill(255); stroke(255);
  translate(width / 2, height);
  strokeWeight(1);
}

void draw() {
  translate(width / 2, height);
  int opt = (int)random(100);
  //println(opt);
  float nx, ny;
  if (opt == 0) {
    nx = 0;
    ny = 0.16 * v.y;
  } else if (opt > 0 && opt <= 85) {
    nx = 0.85 * v.x + 0.04 * v.y;
    ny = -0.04 * v.x + 0.85 * v.y + 1.6;
  } else if (opt > 85 && opt <= 92) {
    nx = 0.2 * v.x - 0.26 * v.y;
    ny = 0.23 * v.x + 0.22 * v.y + 1.6;
  } else {
    nx = -0.15 * v.x + 0.28 * v.y;
    ny = 0.26 * v.x + 0.24 * v.y + 0.44;
  }
  v.x = nx; v.y = ny;
  point(v.x * 100, -v.y * 100);
}
