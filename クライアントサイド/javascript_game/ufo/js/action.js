var ufo;

function init() {
    window.addEventListener('keydown', keydown);
    ufo = new UFO(document.getElementById('ufo'), 100, 50);
}

function keydown(e) {
    if (e.keyCode == 37) {
        ufo.moveLeft();
    } else if (e.keyCode == 38) {
        ufo.moveUp();
    } else if (e.keyCode == 39) {
        ufo.moveRight();
    } else if (e.keyCode == 40) {
        ufo.moveDown();
    }
}

function UFO(_elem, _xpos, _ypos) {
    this.elem = _elem;
    this.xpos = _xpos;
    this.ypos = _ypos;

    this.moveLeft = function() {
        this.xpos -= 10;
        this.elem.style.left = this.xpos + 'px';
    }
    this.moveUp = function() {
        this.ypos -= 10;
        this.elem.style.top = this.ypos + 'px';
    }
    this.moveRight = function() {
        this.xpos += 10;
        this.elem.style.left = this.xpos + 'px';
    }
    this.moveDown = function() {
        this.ypos += 10;
        this.elem.style.top = this.ypos + 'px';
    }
    this.elem.style.left = this.xpos + 'px';
    this.elem.style.top = this.ypos + 'px';
}