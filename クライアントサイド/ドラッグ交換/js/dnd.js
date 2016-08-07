var init = function() {
    Array.from(document.querySelectorAll('.card')).forEach(setCardEvents);
    Array.from(document.querySelectorAll('.cardbox')).forEach(setCardboxEvents);
};

var setCardEvents = function(card) {
    var onstart = function(e) {
        e.dataTransfer.setData('id', this.id)
    };
    card.addEventListener('dragstart', onstart, false);
};

var setCardboxEvents = function(cardbox) {
    var onover = function(e) {
        e.preventDefault()
    };
    var ondrop = function(e) {
        e.preventDefault();
        var card = document.querySelector('#' + e.dataTransfer.getData('id'));
        card.parentNode.removeChild(card);
        this.appendChild(card);
    };
    cardbox.addEventListener('dragover', onover);
    cardbox.addEventListener('drop', ondrop);
};

window.onload = init;