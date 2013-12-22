int SIZE = 960;
int LINENUM = 3;
int THICKNESS = 10;

void setup() {
  size(SIZE, SIZE);
  smooth();
  background(255);
  stroke(0);
  benham(SIZE, LINENUM, THICKNESS, 0);
  saveFrame("screen-####.png");
}

void arct(float a, float b, float c, float d, 
    float start, float stop, int t) {
  strokeWeight(t);
  strokeCap(SQUARE);
  arc(a, b, c, d, start, stop);
}

void benham(int size, int lineNum, int thickness, float r) {
  int cord = size / 2;
  int ellipseSize = size - 10;

  strokeWeight(1);
  noFill();
  ellipse(cord, cord, ellipseSize, ellipseSize);

  fill(0);
  arc(cord, cord, ellipseSize, ellipseSize, 0 + r, PI + r, PIE);

  fill(255);
  ellipse(cord, cord, thickness / 2, thickness / 2);

  noFill();
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < lineNum; i++) {
      ellipseSize -= thickness * 4;
      arct(cord, cord, ellipseSize, ellipseSize, 
      PI + (j *  QUARTER_PI) + r, 
      PI + QUARTER_PI + (j * QUARTER_PI) + r,
      thickness);
    }
  }
} 

