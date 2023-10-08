class Square {
  float x, y, w, h;
  float strkw = 1;
  color defaultCS = color(255);
  color defaultCF = color(50, 0);
  color cs = this.defaultCS;
  color cf = this.defaultCF;
  
  int idxCOL, idxROW;

  boolean ended = false;
  
  float textSize;
  color textColor = color(255);
  color textColorEnd = color(255, 0, 0);
  Boolean owned = false;
  Player owner;
  
  Square(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.textSize = this.w / 1.5;
    println(this.x, this.y, this.w,  this.h);
  }
  
  void setIDX(int col, int row) {
    this.idxCOL = col;
    this.idxROW = row;
  }
  
  PVector getCenter() {
    return new PVector(this.x + this.w / 2, this.y + this.h / 2);
  }

  void show() {
    push();
    strokeWeight(this.strkw);
    //stroke(this.cs);
    if (this.idxROW > 0) {
      line(this.x, this.y, this.x + this.w, this.y);
    }
    if (this.idxCOL > 0) {
      line(this.x, this.y, this.x, this.y + this.h);
    }
    fill(this.cf);
    //rect(this.x, this.y, this.w, this.h);
    if (this.owned) {
      noStroke();
      if (this.ended) {
        fill(this.textColorEnd);
      }
      else {
        fill(this.textColor);
      }
      //fill((!this.ended) ? this.textColor : this.textColorEnd);
      textSize(this.textSize);
      PVector center = this.getCenter();
      text(this.owner.letter, center.x, center.y);
    }
    pop();
  }

  boolean hasBeenClicked(float px, float py, Player pl) {
    if (this.owned) { return false; }
    if (px > this.x && px <= (this.x + this.w)) {
      if (py > this.y && py <= (this.y + this.h)) {
        println(px, py);
        this.owned = true;
        this.owner = pl;
        return true;
      }
    }
    return false;
  }
  
  char getPlayer() {
    if (this.owned) {
      return this.owner.letter;
    }
    return ' ';
  }
}
