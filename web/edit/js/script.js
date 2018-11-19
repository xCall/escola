function nomeInput() {
    if (document.getElementById('nome').value.length == 0) {
        document.getElementById('alerta').innerHTML = 'Por favor preencha o campo';
        document.getElementById('nome').focus();
        nome.style.background = "red";
    }
    if (document.getElementById('nome').value.length > 0) {
        nome.style.background = "white";
    }
}

function idadeInput() {
    var _idd = document.getElementById('idade');
    document.getElementById('alerta').innerHTML = 'A idade informada deverá estar entre 0 e 120';
}

function reset() {
    var _clique = document.getElementById('imagem');
    var _nome = document.getElementById('nome').value = '';
    var _sexo = document.getElementById('sexo').value = '';
    var _idade = document.getElementById('num').value = '';
}

function corMuda(elemento, novaCor) {
    document.getElementById('sexo').style.color = novaCor;
    elemento.style.color = novaCor;
}

function vfButton(event) {
    document.getElementById('titulo').innerHTML = 'o botao pressionado foi ' + event.button;
}

function position(event) {
    x = event.clientX;
    y = event.clientY;
    document.getElementById('titulo2').innerHTML = 'A posição do mouse e de x= ' + x + ", y= " + y;
}