class Position {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    getX() {
        return this.x;
    }

    getY() {
        return this.y;
    }

    setY(y) {
        this.y = y;
    }

    setX(x) {
        this.x = x;
    }

    addX(x) {
        this.x += x;
    }

    addX(y) {
        this.y += y;
    }
}