color[] colors = new color[8];
int[][] nums = new int[3000][3000];
int center = 500, index_center = 1000;
int frame = 0, nowr = 0, times = 0, r = 1;

void setup() {
  size(1000, 1000);
  background(0);
  rectMode(CENTER);
  colors[0] = color(  0,   0,   0);
  colors[1] = color( 25,  55,  63);
  colors[2] = color( 50, 111, 126);
  colors[3] = color( 75, 167, 189);
  colors[4] = color(111, 204, 189);
  colors[5] = color(159, 221, 126);
  colors[6] = color(207, 238,  63);
  colors[7] = color(255, 254,   0);
  for (int i = 0; i <= 2 * index_center; ++i) {
    for (int j = 0; j <= 2 * index_center; ++j) {
      nums[i][j] = 0;
    }
  }
}

void draw() {
  frame += 1;
  nums[index_center][index_center] += 8;
  while (!valid(nums)) {
    times += 1;
  }
  if (frame % 10 == 0) {
    for (int i = -nowr + index_center; i <= nowr + index_center; ++i) {
      for (int j = -nowr + index_center; j <= nowr + index_center; ++j) {
        int x = (i - index_center) * r + center;
        int y = (j - index_center) * r + center;
        fill(colors[nums[i][j]]);
        noStroke();
        rect(x, y, r, r);
      }
    }
  }
  //if (frame % 1000 == 0) {
  //  saveFrame("frame3/sand-########.jpg");
  //  println(str(frame)+", "+str(times));
  //}
}

boolean valid(int[][] nums) {
  boolean ok = true;
  int maxr = nowr;
  for (int i = -nowr + index_center; i <= nowr + index_center; ++i) {
     for (int j = -nowr + index_center; j <= nowr + index_center; ++j) {
       if (nums[i][j] >= 8) {
         nums[i][j] -= 8;
         nums[i][j + 1] += 1;
         nums[i + 1][j + 1] += 1;
         if (j - 1 >= 0) {
           nums[i][j - 1] += 1;
           nums[i + 1][j - 1] += 1;
         }
         nums[i + 1][j] += 1;
         if (i - 1 >= 0) {
           nums[i - 1][j] += 1;
           nums[i - 1][j + 1] += 1;
           if (j - 1 >= 0) {
             nums[i - 1][j - 1] += 1; 
           }
         }  
         ok = false;
         maxr = max(maxr, (i + 1) - index_center);
       }
     }
  }
  nowr = maxr;
  return ok;
}
