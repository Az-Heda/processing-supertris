class Table {
  float x, y, w, h;
  int cols = 3;
  int rows = 3;
  boolean gameEnded = false;
  int idxCOL, idxROW;
  Square[][] squares = new Square[cols][rows];
  
  
  Table(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void setIDX(int col, int row) {
    this.idxCOL = col;
    this.idxROW = row;
  }

  void setupSquares() {
    stroke(255);
    strokeWeight(5);
    int count = 0;
    for (int i = 0; i < 3; i ++) {
      for (int j = 0; j < 3; j ++) {
        float px = this.x + (this.w) / 3 * i;
        float py = this.y + (this.h) / 3 * j;
        this.squares[i][j] = new Square(px, py, this.w /3 , this.h / 3);
        this.squares[i][j].setIDX(i, j);
        count += 1;
      }
    }
  }
  
  boolean checkState() {
    for (int i = 0; i < squares.length; i ++) {
      if (this.squares[i][0].getPlayer() != ' ' && this.squares[i][0].getPlayer() == this.squares[i][1].getPlayer() && this.squares[i][1].getPlayer() == this.squares[i][2].getPlayer()) { 
        for (int j = 0; j < 3; j ++) { this.squares[i][j].ended = true; }
        this.gameEnded = true;
        return true;
      }
    }
    for (int i = 0; i < squares.length; i ++) {
      if (this.squares[0][i].getPlayer() != ' ' && this.squares[0][i].getPlayer() == this.squares[1][i].getPlayer() && this.squares[1][i].getPlayer() == this.squares[2][i].getPlayer()) { 
        for (int j = 0; j < 3; j ++) { this.squares[j][i].ended = true; }
        this.gameEnded = true;
        return true;
      }
    }
    if (this.squares[0][0].getPlayer() != ' ' && this.squares[0][0].getPlayer() == this.squares[1][1].getPlayer() && this.squares[1][1].getPlayer() == this.squares[2][2].getPlayer()) { 
      this.squares[0][0].ended = true;
      this.squares[1][1].ended = true;
      this.squares[2][2].ended = true;
      this.gameEnded = true;
      return true;
    }
    if (this.squares[2][0].getPlayer() != ' ' && this.squares[2][0].getPlayer() == this.squares[1][1].getPlayer() && this.squares[1][1].getPlayer() == this.squares[0][2].getPlayer()) { 
      this.squares[0][2].ended = true;
      this.squares[1][1].ended = true;
      this.squares[2][0].ended = true;
      this.gameEnded = true;
      return true;
    }
    return false;
  }

  void show() {
    for (int i = 0; i < squares.length; i ++) {
      for (int j = 0; j < squares[i].length; j ++) {
        squares[i][j].show();
      }
    }
    this.checkState();
  }
  
  boolean checkClick(float px, float py, Player pl) {
    if (!this.gameEnded) {
      for (int i = 0; i < squares.length; i ++) {
        for (int j = 0; j < squares[i].length; j ++) {
          boolean val = squares[i][j].hasBeenClicked(px, py, pl);
          if (val) 
            return val;
          }
        }
      }
    }
    return false;
  }
}
