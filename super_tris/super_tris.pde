int canvasWidth = 720;
int canvasHeight = 720;

Table[][] t = new Table[3][3];
Player[] ply = new Player[] {
  new Player('X'),
  new Player('O')
};
int turnPlayer = 0;

void settings() {
  size(canvasWidth, canvasHeight);
  //t[0][0] = new Table(width/3 * 1, height/3*1, width/3, height/3);
  for (int i = 0; i < t.length; i ++) {
    for (int j = 0; j < t[i].length; j ++) {
      float px = (height / 3) * i;
      float py = (width / 3) * j;
      t[i][j] = new Table(px+10, py+10, width / 3-20, height / 3-20);
      t[i][j].setIDX(i, j);
    }
  }
}

void setup() {
    textAlign(CENTER, CENTER);
    for (int i = 0; i < t.length; i ++) {
      for (int j = 0; j < t[i].length; j ++) {
        t[i][j].setupSquares();
      }
    }
}

void draw() {
  background(50);
  for (int i = 0; i < t.length; i ++) {
    if (i > 0) {
      line(width / 3 * i, 20, width / 3 * i, height - 20);
      line(20, height / 3 * i, width-20, height / 3 * i);
    }
    for (int j = 0; j < t[i].length; j ++) {
      t[i][j].show();
    }
  }
}

void mousePressed() {
  for (int i = 0; i < t.length; i ++) {
    for (int j = 0; j < t[i].length; j ++) {
      if (t[i][j].checkClick(mouseX, mouseY, ply[turnPlayer])) {
        turnPlayer = ((turnPlayer + 1 < ply.length) ? turnPlayer + 1 : turnPlayer + 1 - ply.length);
        break;
      }
    }
  }
}
