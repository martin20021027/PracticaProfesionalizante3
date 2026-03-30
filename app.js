let secuencia = [];
let sumaCorrecta = 0;
let indice = 0;
let intervaloID;

// Generar número aleatorio sin repetir
function generarNumero(permitirNegativos) {
    let num;
    do {
        num = Math.floor(Math.random() * 20) + 1; 
        if (permitirNegativos && Math.random() < 0.5) {
            num = -num;
        }
    } while (secuencia.includes(num)); // evita repetidos
    return num;
}

// Iniciar juego
function iniciarJuego() {
    secuencia = [];
    sumaCorrecta = 0;
    indice = 0;

    let cantidad = parseInt(document.getElementById("cantidad").value);
    let intervaloSeg = parseInt(document.getElementById("intervalo").value);
    let permitirNegativos = document.getElementById("negativos").checked;

    if (!cantidad || cantidad <= 0) {
        alert("Ingresá una cantidad válida");
        return;
    }
    if (!intervaloSeg || intervaloSeg < 1) {
        alert("El intervalo mínimo es 1 segundo");
        return;
    }

    // Generar secuencia
    for (let i = 0; i < cantidad; i++) {
        let num = generarNumero(permitirNegativos);
        secuencia.push(num);
        sumaCorrecta += num;
    }

    document.getElementById("respuesta").disabled = true;
    document.getElementById("btnVerificar").disabled = true;
    document.getElementById("resultado").textContent = "";

    // Mostrar números cada segundos
    intervaloID = setInterval(() => {
        if (indice < secuencia.length) {
            document.getElementById("display").textContent = secuencia[indice];
            indice++;
        } else {
            clearInterval(intervaloID);
            document.getElementById("display").textContent = "-";
            document.getElementById("respuesta").disabled = false;
            document.getElementById("btnVerificar").disabled = false;
        }
    }, intervaloSeg * 1000); 
}

// Verificar resultado
function verificar() {
    let respuestaUsuario = parseInt(document.getElementById("respuesta").value);

    if (respuestaUsuario === sumaCorrecta) {
        document.getElementById("resultado").textContent = " Correcto!";
    } else {
        document.getElementById("resultado").textContent =
            " Incorrecto. La suma era: " + sumaCorrecta;
    }
}
