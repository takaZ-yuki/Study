class Paddle {
  constructor(width, height) {
    this.w = 110;
    this.h = 20;
    this.x = (width - this.w) / 2;
    this.y = height - 20;
    this.color = 'yellow';
    this.keyL = false;
    this.keyR = false;
  }

  draw(ctx) {
    ctx.fillStyle = this.color;
    ctx.fillRect(this.x, this.y, this.w, this.h);
  }
}