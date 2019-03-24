/**
 * From https://www.bilibili.com/read/cv2239616
 */
import gifAnimation.*;
GifMaker gif;

float x, y;
int r, g, b;
ArrayList<PVector> colors = new ArrayList<PVector>();
public static int[] numbers = new int[90];
public static ArrayList<ArrayList<Integer>> arrIntegers = new ArrayList<ArrayList<Integer>>();

void createNumbers() {
  for (int i = 0; i < numbers.length; ++i) {
    numbers[i] = (int)random(2, 400);
    r = (int)random(256);
    g = (int)random(256);
    b = (int)random(256);
    //r = 256; g = 256; b = 256;
    colors.add(new PVector(r, g, b));
  }
}

void setup() {
  size(1000, 600);
  background(0);
  createNumbers();
  printArr(numbers);
  bubbleSort(numbers);
  printArr(numbers);
  //setup_();
}

int n = 0, index = 0, speed = 1;
void draw() {
  n++;
  if (n % speed == 0 && index < arrIntegers.size()) {
    background(0);
    ArrayList<Integer> arr = arrIntegers.get(index);
    index++;
    for (int j = 0; j < arr.size(); ++j) {
      x = j * 10 + 50;
      y = 500 - arr.get(j);
      PVector c = colors.get(j);
      fill(c.x, c.y, c.z);
      rect(x, y, 4, arr.get(j));
    }
    fill(255);
    textSize(20);
    text("Time: " + millis() / 1000.0 + "s", 60, 60);
  }
  //saveFrame("frames/####.tif");
  //draw_();
}

public static void bubbleSort(int[] numbers) {
  int temp = 0;
  int size = numbers.length;
  for (int i = 0; i < size - 1; ++i) {
    for (int j = 0; j < size - 1 - i; ++j) {
      if (numbers[j] > numbers[j + 1]) {
        temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
        printArr(numbers);
      }
    }
  }
}

public static void printArr(int[] numbers) {
  System.out.println("\nswap");
  ArrayList<Integer> arr = new ArrayList<Integer>();
  for (int i = 0; i < numbers.length; ++i) {
    System.out.print(" " + numbers[i]);
    arr.add(numbers[i]);
  }
  arrIntegers.add(arr);
}

void setup_() {
  gif = new GifMaker(this,"QSort.gif"); 
  gif.setRepeat(0);
  gif.setDelay(40);
} 

void draw_() {
  if(frameCount % 10 == 0) {
    gif.addFrame();
  }
}
//void mousePressed() {
//  gif.finish();
//}
