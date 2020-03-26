class Planet {
  float m;
  float r;
  float R;
  float omega;
  float theta;
  PVector Force;
  PVector pos;
  
  Planet(float mass, float radius, float dis) {
    m = mass;
    r = radius;
    R = dis;
    omega = 0;
    theta = 0;
  }
  
  void DrawVector(PVector v) {
    stroke(255);
    line(0, 0, v.x, v.y);
  }
  
  void calcForce(Planet sun) {
    float data = sun.m * m / (R * R);
    Force = new PVector(-data * cos(theta), data * sin(theta));
    PVector v = new PVector();
    PVector.mult(Force, 1000, v);
    DrawVector(v);
    println(Force);
  }
  
  void calcOmega() {
    omega = sqrt(Force.mag() / (m * R));
    //println(omega);
  }
  
  void move() {
    theta += omega;
  }
  
  void show() {
     ellipse(R * cos(theta), R * sin(theta), r * 2, r * 2);
     pos = new PVector(R * cos(theta), R * sin(theta));
  }
}
