int n = 3;
float[] x  = new float[n];
float[] y  = new float[n];
float[] vx = new float[n];
float[] vy = new float[n];
float[] ax = new float[n];
float[] ay = new float[n];
float[] m  = new float[n];
float[] e  = new float[n];
float dt = 0.005;

void setup() {
  size(900, 900);
  x[0]  = -1;        x[1]  = 1;       x[2]  = 0;
  y[0]  = 0;         y[1]  = 0;       y[2]  = 1.732;
  vx[0] = 1*0.35;         vx[1] = 1*0.35;       vx[2] = -2*0.35;
  vy[0] = -1.732*0.35;    vy[1] = 1.732*0.35;   vy[2] = 0;
  m[0]  = 1;          m[1] = 1;       m[2]  = 1;
  e[0]  = 1;          e[1] = 1;       e[2]  = 1;
  background(0);
}

void draw() {
  translate(width / 2, height / 2);
  scale(50);
  fill(255); stroke(255);
  strokeWeight(0.1);
  point(x[0], -y[0]);
  point(x[1], -y[1]);
  point(x[2], -y[2]);
  for (int i = 0; i < n; ++i) {
    ax[i] = 0; ay[i] = 0;
    for (int j = 0; j < n; ++j) {
      if (i != j) {
        ax[i] = ax[i] + e[j] * e[i] * (x[j] - x[i]) * pow((x[j] - x[i]) * (x[j] - x[i]) + (y[j] - y[i]) * (y[j] - y[i]), -1.5) / m[i];
        ay[i] = ay[i] + e[j] * e[i] * (y[j] - y[i]) * pow((x[j] - x[i]) * (x[j] - x[i]) + (y[j] - y[i]) * (y[j] - y[i]), -1.5) / m[i];
      }
    }
    x[i] = x[i] + vx[i] * dt + 0.5 * ax[i] * dt * dt;
    y[i] = y[i] + vy[i] * dt + 0.5 * ay[i] * dt * dt;
    vx[i] = vx[i] + ax[i] * dt;
    vy[i] = vy[i] + ay[i] * dt;
  }
}
