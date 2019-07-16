ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}

void setup() {
  size(800, 800);
  segments = new ArrayList<Segment>();
  PVector a = new PVector(100, 200);
  PVector b = new PVector(700, 200);
  PVector c = new PVector(400, 700);
  Segment s1 = new Segment(a, b);
  Segment s2 = new Segment(b, c);
  Segment s3 = new Segment(c, a);
  segments.add(s1);
  segments.add(s2);
  segments.add(s3);
}

void draw() {
  background(0);
  stroke(255);
  for (Segment s : segments) {
    s.show();
  }
}

void mousePressed() {
  ArrayList<Segment> children = new ArrayList<Segment>();
  for (Segment s : segments) {
    Segment[] child = s.getChildren();
    addAll(child, children);
  }
  segments = children;
}
