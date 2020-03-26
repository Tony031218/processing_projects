
color[] colors = new color[15];
int r = 1;
int[][] nums = new int[3000][3000];
boolean[][] vis = new boolean[3000][3000];
int center = 500;
int index_center = 1000;
int frame = 0;

void setup() {
  size(1000, 1000);
  background(0);
  rectMode(CENTER);
  colors[0] = color(  0,   0,   0);
  colors[1] = color( 85,  84,   0);
  colors[2] = color(170, 169,   0);
  colors[3] = color(255, 254,   0);
  for (int i = 4; i < 15; ++i) {
    colors[i] = color(255, 255, 255);
  }
  for (int i = 0; i <= 2 * index_center; ++i) {
    for (int j = 0; j <= 2 * index_center; ++j) {
      nums[i][j] = int(random(4));
      vis[i][j] = false;
      nums[i][j] = 0;
    }
  }
}

void draw() {
  frame+=1;
  nums[index_center][index_center] += 4;
  //nums[int(random(2*index_center+1))][int(random(2*index_center+1))] += 1;
  //nums[int(random(2*index_center+1))][int(random(2*index_center+1))] += 4;
  int times = 0;
  while (!valid(nums)) {
    //update(nums, times);
    times += 1;
  }
  if (frame % 100 == 0) {
    for (int i = 0; i <= 2 * index_center; ++i) {
      for (int j = 0; j <= 2 * index_center; ++j) {
        int x = (i - index_center) * r + center;
        int y = (j - index_center) * r + center;
        fill(colors[nums[i][j]]);
        //if (vis[i][j]) {
        //  fill(color(255, 255, 255));
        //}
        noStroke();
        rect(x, y, r, r);
        if (vis[i][j]) {
          vis[i][j] = false;
        }
      }
    }
  }
  //saveFrame("frames2/sand-#####.jpg");
}

boolean valid(int[][] nums) {
  boolean ok = true;
  for (int i = 0; i <= 2 * index_center; ++i) {
     for (int j = 0; j <= 2 * index_center; ++j) {
       if (nums[i][j] >= 4) {
         nums[i][j] -= 4;
         nums[i][j + 1] += 1;
         if (j - 1 >= 0) {
           nums[i][j - 1] += 1;
         }
         nums[i + 1][j] += 1;
         if (i - 1 >= 0) {
           nums[i - 1][j] += 1;
         }  
         ok = false;
       }
     }
  }
  return ok;
}

void update(int[][] nums, int times) {
  for (int i = 0; i <= 2 * index_center; ++i) {
    for (int j = 0; j <= 2 * index_center; ++j) {
      if (nums[i][j] >= 4) {
        //if (times == 0) {  
          vis[i][j] = true;
        //}
        nums[i][j] -= 4;
        nums[i][j + 1] += 1;
        if (j - 1 >= 0) {
          nums[i][j - 1] += 1;
        }
        nums[i + 1][j] += 1;
        if (i - 1 >= 0) {
          nums[i - 1][j] += 1;
        }
      }
    }
  }
}
