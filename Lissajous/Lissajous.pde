float angle = 0;
int w = 50;
int cols, rows;
Curve[][] curves;

void setup() {
  fullScreen(P2D);
  //size(800, 800);
  cols = width / w - 1;
  rows = height / w - 1;
  curves = new Curve[rows][cols];
  for (int i = 0; i < rows; ++i) {
    for (int j = 0; j < cols; ++j) {
      curves[i][j] = new Curve();
    }
  }
}

void draw() {
  background(0);
  float d = w - 15;
  float r = d / 2;
  stroke(255);
  noFill();
  for (int i = 0; i < cols; ++i) {
    float cx = w + i * w + w / 2;
    float cy = w / 2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x = r * cos(angle * (i + 1) - PI / 2);
    float y = r * sin(angle * (i + 1) - PI / 2);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy + y);
    stroke(255, 50);
    strokeWeight(1);
    line(cx + x, 0, cx + x, height);
    for (int j = 0; j < rows; ++j) {
      curves[j][i].setX(cx + x);
    }
  }
  for (int i = 0; i < rows; ++i) {
    float cy = w + i * w + w / 2;
    float cx = w / 2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x = r * cos(angle * (i + 1) - PI / 2);
    float y = r * sin(angle * (i + 1) - PI / 2);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy + y);
    stroke(255, 50);
    strokeWeight(1);
    line(0, cy + y, width, cy + y);
    for (int j = 0; j < cols; ++j) {
      curves[i][j].setY(cy + y);
    }
  }
  
  for (int i = 0; i < rows; ++i) {
    for (int j = 0; j < cols; ++j) {
      curves[i][j].addPoint();
      curves[i][j].show();
    }
  }
  
  angle -= 0.1;
  
  if (angle < -TWO_PI) {
    for (int i = 0; i < rows; ++i) {
      for (int j = 0; j < cols; ++j) {
        curves[i][j].reset();
      }
    }
    saveFrame("frames/Lissajous-####.png");
    angle = 0;
  }
  
}
