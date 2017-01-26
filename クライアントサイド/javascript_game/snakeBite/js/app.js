'use strict';

/**
 * ポイントオブジェクト
 */
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
}

/**
 * フィールドオブジェクト
 */
class Field {

    constructor(canvas) {
        this.W = 20;
        this.H = 20;
        this.S = 20;

        this.snake = [];
        this.foods = [];
        this.keyCode = 0;
        this.point = 0;
        this.timer = NaN;
        this.FOODS_MSX_SIZE = 10;

        this.canvas = canvas;
        this.ctx;
    }

    // 初期化関数
    init() {
        this.W = this.canvas.width / this.S;
        this.H = this.canvas.height / this.S;

        this.ctx = this.canvas.getContext('2d');
        this.ctx.font = '20px sans-serif';

        // 蛇の初期化
        this.snake.push(new Point(this.W / 2, this.H / 2));

        // 餌の初期化
        for (let i = 0; i < this.FOODS_MSX_SIZE; i++) {
            this.addFood();
        }

        this.timer = setInterval(() => {
            this.tick();
        }, 200);
        window.onkeydown = (event) => {this.keyCode = event.keyCode};
    }

    // 衝突判定
    isHit(data, x, y) {
        for (let i = 0; i < data.length; i++) {
            if (data[i].x == x && data[i].y == y) {
                return true;
            }
        }
        return false;
    }

    // 餌の追加
    addFood() {
        while (true) {
            let x = Math.floor(Math.random() * this.W);
            let y = Math.floor(Math.random() * this.H);
            if (this.isHit(this.foods, x, y) || this.isHit(this.snake, x, y)) {
                continue;
            }

            let p = new Point(x, y);
            this.foods.push(new Point(x, y));
            break;
        }
    }

    moveFood(x, y) {
        this.foods = this.foods.filter((p) => {
            return (p.x != x || p.y != y);
        });
        this.addFood();
    }

    tick() {
        let x = this.snake[0].x;
        let y = this.snake[0].y;

        switch (this.keyCode) {
            case 37:
                x--;
                break; // 左
            case 38:
                y--;
                break; // 上
            case 39:
                x++;
                break; // 右
            case 40:
                y++;
                break; // 下
            default:
                this.paint();
                return;
        }

        // 自分 or 壁に衝突？
        if (this.isHit(this.snake, x, y) || x < 0 || x >= this.W || y < 0 || y >= this.H) {
            clearInterval(this.timer);
            this.paint();
            return;
        }

        // 頭を先頭に追加
        this.snake.unshift(new Point(x, y));

        if (this.isHit(this.foods, x, y)) {
            this.point += 10; // 餌を食べた
            this.moveFood(x, y);
        } else {
            this.snake.pop();
        }

        this.paint();
    }

    paint() {
        this.ctx.clearRect(0, 0, this.W * this.S, this.H * this.S);
        this.ctx.fillStyle = 'rgb(255, 0, 0)';
        this.ctx.fillText(this.point, this.S, this.S * 2);
        this.ctx.fillStyle = 'rgb(0, 0, 255)';

        this.foods.forEach((p) => {
            this.ctx.fillText('+', p.x * this.S, (p.y + 1) * this.S);
        });

        this.snake.forEach((p) => {
            this.ctx.fillText('*', p.x * this.S, (p.y + 1) * this.S);
        });
    }
}