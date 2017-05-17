class Ball {
  constructor(height) {
    this.x = 0;
    this.y = height + this.r; // out of the area
    this.dx = 0;
    this.dy = 0;
    this.r = 10;
    this.dir = 0;
    this.speed = 10;
  }
  //移動メソッド
  move() {
    this.x += this.dx;
    this.y += this.dy;
  }
  
  changeDir(dir) {
    this.dir = dir;
    this.dx = this.speed * Math.cos(dir);
    this.dy = -this.speed * Math.sin(dir);
  }
  // 描画メソッド
  draw(ctx) {
    drawBall(this.x, this.y, this.r);
  }
}