class Block {
  // 初期化コンストラクタ
  constructor(x, y, color) {
    this.x = x;
    this.y = y;
    this.w = 50;
    this.h = 20;
    this.color = color;
    this.point = (6 - 1) * 10;
  }

  // 描画メソッド
  draw(/* canvas 2d */ctx) {
    ctx.fillStyle = this.color;
    ctx.fillRect(this.x, this.y, this.w, this.h);
  }
}