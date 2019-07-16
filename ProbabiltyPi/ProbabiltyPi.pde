ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<PVector> curve  = new ArrayList<PVector>();
int inside = 0;
float t = 50;

void setup() {
  size(540, 960);
  PFont myFont = createFont("Monaco for Powerline", 10);
  textFont(myFont);
}

void draw() {
  if (t <= 500) {
    background(0);
    textSize(10);
    stroke(255);
    noFill();
    rect(10, 100, 250, 250);
    ellipse(135, 225, 250, 250);
    int a = (int)random(10, 260); 
    int b = (int)random(100, 350);
    points.add(new PVector(a, b));
    if ((a - 135) * (a - 135) + (b - 225) * (b - 225) < 125 * 125) {
      inside++;
    }
    for (PVector p : points) {
      point(p.x, p.y);
    }
    text("Points: " + points.size(), 300, 200);
    text("Inside: " + inside, 300, 230);
    float pi = 4 * (float)inside / (float)points.size();
    text("π = 4*Inside/Points = " + pi, 80, 400);
    curve.add(new PVector(t, 900 - pi * 100));

    stroke(255, 50);
    line(50, 450, 50, 750);
    line(45, 460, 50, 450);
    line(55, 460, 50, 450);
    text("π", 45, 440);
    //line(50, 700, 500, 700);
    //line(490, 695, 500, 700);
    //line(490, 705, 500, 700);
    //text("t", 500, 700);
    stroke(255);
    beginShape();
    for (PVector p : curve) {
      vertex(p.x, p.y); 
    }
    endShape();
    textSize(5);
    text("3.1415", 10, 900 - 3.1415 * 100);
    stroke(255, 50);
    line(50, 900 - 3.1415 * 100, 500, 900 - 3.1415 * 100);
    text("3", 10, 900 - 3 * 100);
    stroke(255, 50);
    line(50, 900 - 3 * 100, 500, 900 - 3 * 100);
    text("3.3", 10, 900 - 3.3 * 100);
    stroke(255, 50);
    line(50, 900 - 3.3 * 100, 500, 900 - 3.3 * 100);
    t += 0.1;
  }
}
