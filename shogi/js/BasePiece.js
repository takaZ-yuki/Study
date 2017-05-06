class BasePiece {
    constructor(x, y) {
        this.pieceName = "歩";
        this.moveRange = [
            [0, 1, 0],
            [0, 9, 0],
            [0, 0, 0]
        ];
        this.position = new Position(x, y);
    }

    move(x, y) {

    };

    getMoveRange() {
        return this.getMoveRange;
    }
}