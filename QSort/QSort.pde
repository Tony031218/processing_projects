float x, y;
int r, g, b;
ArrayList<PVector> colors = new ArrayList<PVector>();
public static int[] numbers = new int[500];
public static ArrayList<ArrayList<Integer>> arrIntegers = new ArrayList<ArrayList<Integer>>();

void createNumbers() {
  for (int i = 0; i < numbers.length; ++i) {
    numbers[i] = (int)random(2, 800);
    r = 256; g = 256; b = 256;
    colors.add(new PVector(r, g, b));
  }
}

void setup() {
  size(1920, 1080);
  background(0);
  createNumbers();
  printArr(numbers);
  QSort(numbers, 0, 499);
  printArr(numbers);
  //setup_();
}

int n = 0, index = 0, speed = 1;
void draw() {
  n++;
  noStroke();
  if (n % speed == 0 && index < arrIntegers.size()) {
    background(0);
    ArrayList<Integer> arr = arrIntegers.get(index);
    index++;
    for (int j = 0; j < arr.size(); ++j) {
      x = j * 3.7 + 30;
      y = 1000 - arr.get(j);
      PVector c = colors.get(j);
      fill(c.x, c.y, c.z);
      rect(x, y, 3, arr.get(j));
    }
    fill(255);
    textSize(20);
    text("Time: " + (millis() - 1) / 1000.0 + "s", 60, 60);
  }
}

public static void Swap(int[] numbers, int i, int j) {
  int tmp    = numbers[j];
  numbers[j] = numbers[i];
  numbers[i] = tmp;
  printArr(numbers);
}

public static void QSort(int[] numbers, int left, int right) {
  int i, j, k, tmp;
  if (left > right) return;
  i = left; j = right;
  k = numbers[left];
  while (i < j) {
    while (k <= numbers[j] && i < j) j--;
    Swap(numbers, i, j);
    while (k >= numbers[i] && i < j) i++;
    Swap(numbers, i, j);
  }
  QSort(numbers, left, i - 1);
  QSort(numbers, j + 1, right);
}

public static void printArr(int[] numbers) {
  ArrayList<Integer> arr = new ArrayList<Integer>();
  for (int i = 0; i < numbers.length; ++i) {
    arr.add(numbers[i]);
  }
  arrIntegers.add(arr);
}
