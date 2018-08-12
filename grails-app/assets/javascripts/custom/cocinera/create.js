var form = document.getElementById("formcreate")
form.addEventListener("submit", function() {
    var inputfNacimiento = document.getElementById("fechaNacimiento")
    var inputfNacimientoHidden = document.getElementById("fechaNacimientoHidden")
    inputfNacimientoHidden.value = inputfNacimiento.value + " 00:00:00.0"
})
