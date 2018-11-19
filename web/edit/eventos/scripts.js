function vfCampo() {
    if (document.getElementById('nome').value.length == 0) {
        nome.style.background = "red";
        document.getElementById('aviso2').innerHTML = 'Nao deixe o campo vazio'
        document.getElementById('nome').focus();
    }
    if (document.getElementById('nome').value.length > 0) {
        nome.style.background = "white";
    }
}

function vfNumber() {
    var idd = document.getElementById('idade');
    document.getElementById('aviso').innerHTML = 'Por favor! Insira numeros entre 0 e 120.';
}

function limpa() {
    var clique = document.getElementById('im');
    var nome = document.getElementById('nome').value = '';
    var idade = document.getElementById('idade').value = '';
}

function pressionar() {
    alert('tecla pressionada no campo')
}