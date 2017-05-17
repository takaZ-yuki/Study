import Block from './Block';
import ball from './ball';
import paddle from './paddle';

class BlockGame {

  constructor(ctx) {
    this.ctx = ctx;
    this.paddle;
    this.ball;
    this.timer;
    this.blocks = [];
    this.balls = 3;
    this.score = 0;
    this.WIDTH = 600;
    this.HEIGHT = 600;
    this.colors = [
      'red',
      'orange',
      'yellow',
      'green',
      'purple',
      'blue'
    ];
  }

  start() {
    this.ctx.font = '20pt Arial';

    // initialize event listener
    window.addEventListener('keydown', function (e) {
      toggleKey(e.keyCode, true);
    }, true);

    window.addEventListener('keyup', function (e) {
      toggleKey(e.keyCode, false);
    }, true);

    // initialize players
    this.paddle = new paddle(this.WIDTH, this.HEIGHT);
    this.ball = new ball(this.HEIGHT);

    this.paddle.w = Math.max(20, this.paddle.w - 10);
    this.ball.speed = Math.min(20, this.ball.speed + 1);

    // layout blocks
    for (var i = 0; i < 6; i++) {
      for (var j = 0; j < 9; j++) {
        this.blocks.push(new Block(j * 60 + 35, i * 30 + 50, i), this.colors[i]);
      }
    }

    if (isNaN(this.timer)) {
      this.timer = setInterval(mainLoop, 15);
    }
  }

  mainLoop() {
    // move the this.paddle
    if (this.paddle.keyL) {
      this.paddle.x = Math.max(0, this.paddle.x - 10);
    }
    if (this.paddle.keyR) {
      this.paddle.x = Math.min(this.WIDTH - this.paddle.w, this.paddle.x + 10);
    }

    draw();

    if (!isPlaying()) {
      return;
    }

    if (this.ball.y > this.HEIGHT - this.paddle.h) {
      // hit the this.paddle?
      if (this.paddle.x < this.ball.x && this.ball.x < this.paddle.x + this.paddle.w && this.paddle.y < this.ball.y && this.ball.y < this.paddle.y + this.paddle.h) {
        var ratio = (this.paddle.x + this.paddle.w / 2 - this.ball.x) / this.paddle.w * 0.8; // -0.4 to 0.4
        this.ball.changeDir(Math.PI / 2 + Math.PI * ratio);
      } else {
        if (--this.balls == 0) {
          clearInterval(this.timer);
          this.timer = NaN;
          draw();
          return;
        }
        this.ball.y = this.HEIGHT + this.ball.r;
      }
    }

    var nx = this.ball.x + this.ball.dx;
    var ny = this.ball.y - this.ball.dy;

    // hit the wall?
    if (ny < this.ball.r && this.ball.dy < 0) {
      this.ball.changeDir(this.ball.dir * -1);
    } else if (nx < this.ball.r || nx + this.ball.r > this.WIDTH) {
      this.ball.changeDir(Math.PI - this.ball.dir);
    }

    // hit a block ?
    var hit = -1;
    this.blocks.some(function (block, i) {
      if (block.x - this.ball.r < nx && nx < block.x + block.w + this.ball.r && block.y - this.ball.r < ny && ny < block.y + block.h + this.ball.r) {
        hit = i;
        return true;
      }
      return false;
    });

    if (hit >= 0) {
      this.score += this.blocks[hit].point;
      this.blocks.splice(hit, 1);

      if (this.blocks.length <= 0) { // cleared
        this.ball.y = this.HEIGHT + this.ball.r;
        start();
        return;
      }
      this.ball.changeDir(this.ball.dir * -1);
    }

    this.ball.move();
  }

  isPlaying() {
    return this.ball.y < this.HEIGHT + this.ball.r;
  }

  drawball(x, y, r) {
    this.ctx.fillStyle = 'yellow';
    this.ctx.beginPath();
    this.ctx.arc(x, y, r, 0, Math.PI * 2, true);
    this.ctx.fill();
  }

  draw() {
    // fill background
    this.ctx.fillStyle = 'rgb(0, 0, 0)';
    this.ctx.fillRect(0, 0, this.WIDTH, this.HEIGHT);

    // draw blocks
    this.blocks.forEach(function (block) {
      block.draw(this.ctx);
    });

    // draw this.paddle
    this.paddle.draw(this.ctx);

    // draw this.balls
    this.ball.draw(this.ctx);
    if (this.balls > 2) {
      drawthis.ball(80, 15, 10);
    }
    if (this.balls > 1) {
      drawthis.ball(50, 15, 10);
    }
    // draw score & infomation
    this.ctx.fillStyle = 'rgb(0, 255, 0)';
    this.ctx.fillText(('00000' + this.score).slice(-5), 500, 30);
    if (isNaN(this.timer)) {
      this.ctx.fillText('GAME OVER', 220, 250);
    }
  }

  // ボタンクリック
  toggleKey(code, flag) {
    switch (code) {
      case 37:
        this.paddle.keyL = flag;
        break;
      case 39:
        this.paddle.keyR = flag;
        break;
      case 32:
        if (!isPlaying()) {
          this.ball.x = this.paddle.x + this.paddle.w / 2;
          this.ball.y = this.paddle.y - this.ball.r;
          this.ball.changeDir(Math.random() * Math.PI / 2 + Math.PI / 4); // 45 - 135
        }
        break;
    }
  }

}