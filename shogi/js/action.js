"use strict";

class Game {
    constructor() {
        this.MAX_ROW = 9;
        this.MAX_COLUMN = 9;
        this.BRIDGE_ARRANGEMENT = [
            ["香", "桂", "銀", "金", "王", "金", "銀", "桂", "香"],
            ["", "飛", "", "", "", "", "", "角", ""],
            ["歩", "歩", "歩", "歩", "歩", "歩", "歩", "歩", "歩"],
            ["", "", "", "", "", "", "", "", ""],
            ["", "", "", "", "", "", "", "", ""],
            ["", "", "", "", "", "", "", "", ""],
            ["歩", "歩", "歩", "歩", "歩", "歩", "歩", "歩", "歩"],
            ["", "飛", "", "", "", "", "", "角", ""],
            ["香", "桂", "銀", "金", "王", "金", "銀", "桂", "香"]
        ];

    }

    init(id) {
        let table = document.getElementById(id);

        for (let rowCount = 0; rowCount < this.MAX_COLUMN; rowCount++) {
            let row = table.insertRow(-1);

            for (let columnCount = 0; columnCount < this.MAX_COLUMN; columnCount++) {
                var cell = row.insertCell(-1);
                cell.innerHTML = this.BRIDGE_ARRANGEMENT[rowCount][columnCount];
            }
        }
    }

}