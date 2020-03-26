Planet Sun;
Planet Earth;

void setup() {
  size(1000, 1000);
  Sun = new Planet(1000, 50, 0);
  Earth = new Planet(10, 25, 400);
}

void draw() {
  background(0);
  fill(255);
  translate(width / 2, height / 2);
  Sun.show();
  Earth.show();
  Earth.calcForce(Sun);
  Earth.calcOmega();
  Earth.move();
}
