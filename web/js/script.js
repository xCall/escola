function contador() {
    let _letras = document.getElementById('nome');
    let _campo = document.getElementById('nome').value;
    let _cont = _campo.length;
    document.getElementById('contador').innerHTML = 'O campo possui ' + _cont + ' caracteres digitados';
}

function acender(event) {
    document.getElementById('luz').src = "img/on.png";
    document.getElementById('apagador').src = "img/int_on.jpg";
}

function apagar(event) {
    document.getElementById('luz').src = "img/off.png";
    document.getElementById('apagador').src = "img/int_off.jpg";
}

function calcula() {
    var taxa = document.getElementById('taxa').value;
    var capital = document.getElementById('capital').value;
    var tempo = document.getElementById('tempo').value;
    var total = parseFloat(taxa * capital * tempo);

    console.log(total);
}