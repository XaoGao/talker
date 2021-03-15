export const changeStatus = () => {
  $('.my-status').on("click", function() {
    var inp = createInput(this.innerText);
    this.parentNode.replaceChild(inp, this);
    inp.focus();
    inp.addEventListener("blur", function(event) {
      callChangeStatus(inp.value);
      var p = createPTag(inp);
      this.parentNode.replaceChild(p, inp);
    }, true);
  });
}

const createInput = (text) => {
  var inp = document.createElement('input');
  inp.type = 'text';
  inp.value = text;
  inp.classList.add("form-control");
  inp.classList.add("chanched-status");

  return inp;
}

const createPTag = (input) => {
  var p = document.createElement('p');
  p.innerText = input.value;
  p.classList.add("my-status");

  return p;
}


const callChangeStatus = (text) => {
  var id = getUserUrlFromId();
  $.ajax({
    url: `/users/${id}/change-status`,
    method: "POST",
    data: { id: id, status: text },
    success: function() { }
  })
}

const getUserUrlFromId = () => {
  var fullUrl = document.URL;
  var urlArray = fullUrl.split('/');
  var lastSegment = urlArray[urlArray.length-1];

  return lastSegment;
}
