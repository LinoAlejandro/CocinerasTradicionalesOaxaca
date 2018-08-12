var els = document.getElementsByClassName("fNacimiento")

Array.prototype.forEach.call(els, function(el) {
    el.innerHTML = el.innerHTML.replace("00:00:00.0", "")
});
