var dragSrcObj;

var handleDragStart = function(e) {
  e.dataTransfer.effectAllowed = 'move';
  e.dataTransfer.setData('text/html', this.innerHTML);
  dragSrcObj = this;
};

var handleDragOver = function(e) {
  if (e.preventDefault) {
    e.preventDefault();
  }
  e.dataTransfer.dropEffect = 'move';
  return false;
};

var handleDragEnter = function(e) {};

var handleDragLeave = function(e) {};

var handleDrop = function(e) {
  if (e.stopPropagation) {
    e.stopPropagation();
  }
  if (dragSrcObj != this) {
    dragSrcObj.innerHTML = this.innerHTML;
    this.innerHTML = e.dataTransfer.getData('text/html');

    var reorders = [].map.call(document.querySelectorAll('.upload-file'), function(v, index) {
      return [v.getAttribute("data-file-id"), index]
    });

    var request = new XMLHttpRequest();
    request.open("POST", "./upload.php");
    request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
    request.send(JSON.stringify(reorders));
  }

  return false;
};

var handleDragEnd = function(e) {};

function upload(file, dom) {
  var formData = new FormData();
  formData.append("file", file);

  var request = new XMLHttpRequest();
  request.responseType = "json";
  request.addEventListener('loadend', function() {
    if (this.status === 200) {
      dom.setAttribute("data-file-id", this.response.file_id);
    }
  });
  request.open("POST", "./upload-reorder.php");
  request.send(formData);
}

var dropZone = document.getElementById("drop_zone");

dropZone.addEventListener("dragover", function(e) {
  e.stopPropagation();
  e.preventDefault();
}, false);

dropZone.addEventListener("drop", function(e) {
  e.stopPropagation();
  e.preventDefault();

  var files = e.dataTransfer.files;
  for (var i = 0; i < files.length; i++) {
    (function() {
      var fr = new FileReader();
      fr.onload = function() {
        var div = document.createElement('div');
        div.setAttribute('draggable', 'true');
        div.addEventListener('dragstart', handleDragStart, false);
        div.addEventListener('dragenter', handleDragEnter, false);
        div.addEventListener('dragover', handleDragOver, false);
        div.addEventListener('dragleave', handleDragLeave, false);
        div.addEventListener('drop', handleDrop, false);
        div.addEventListener('dragend', handleDragEnd, false);

        var img = document.createElement('img');
        img.classList.add('upload-file');
        img.setAttribute('src', fr.result);
        div.appendChild(img);

        var preview = document.getElementById("preview");
        preview.appendChild(div);
        upload(files[i], img);
      };
      fr.readAsDataURL(files[i]);
    })();
  }
}, false);