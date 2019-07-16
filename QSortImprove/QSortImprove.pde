public static int[] values = new int[200];
public static int[] states = new int[200];
int w;

void setup() {
  size(1280, 720);
  w = width / 200;
  for (int i = 0; i < values.length; ++i) {
    values[i] = (int)random(2, height);
    states[i] = -1;
  }
  QSort(values, 0, values.length - 1);
}

void QSort(int[] numbers, int left, int right) {
  if (left >= right) return;
  int index = partition(numbers, left, right);
  states[index] = -1;
  QSort(numbers, left, index - 1);
  QSort(numbers, index + 1, right);
}

int partition(int[] numbers, int left, int right) {
  for (int i = left; i < right; ++i) {
    states[i] = 1;
  }
  int pivotValue = numbers[right];
  int pivotIndex = left;
  states[pivotIndex] = 0;
  for (int i = left; i < right; ++i) {
    if (numbers[i] < pivotValue) {
      swap(numbers, i, pivotIndex);
      states[pivotIndex] = -1;
      pivotIndex++;
      states[pivotIndex] = 0;
    }
  }
  swap(numbers, pivotIndex, left);
  for (int i = left; i < right; ++i) {
    if (i != pivotIndex) {
      states[i] = -1;
    }
  }
  return pivotIndex;
}

void swap(int[] numbers, int a, int b) {
  int tmp = numbers[a];
  numbers[a] = numbers[b];
  numbers[b] = tmp;
}

void draw() {
  background(0);
  for (int i = 0; i < values.length; ++i) {
    noStroke();
    if (states[i] == 0) {
      fill(#E0777D);
    } else if (states[i] == 1) {
      fill(#D6FFB7);
    } else {
      fill(255);
    }
    rect(i * w, height - values[i], w, values[i]);
  }
}
