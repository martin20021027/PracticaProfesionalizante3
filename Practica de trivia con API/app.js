let categorias = [];   // Este let se cargan todas las categorías.
let preguntas = [];    // Este let se guardan las preguntas de la categoría elegida.
let index = 0;         // Este let es el número de la pregunta actual
let correctas = 0;     // Este let cuenta cuántas respuestas correctas hiciste.
let incorrectas = 0;   // Este let cuenta cuántas respuestas incorrectas hiciste.
let noResp = 0;        // Este let cuenta cuántas preguntas no respondiste.
let tiempo = 6;        // Este let es el tiempo que tenés para responder cada pregunta.
let intervalo;         // Este let es para guarda el temporizador. 

// Este fetch carga el json con los datos de las preguntas 
fetch("trivia_realista_240.json")
    .then(r => r.json())
    .then(data => {
        categorias = data.categorias;
        cargarCategorias();
    })
    .catch(() => {
        document.getElementById("error").textContent = "Error cargando JSON";
    });

// Esta funcion busca la categoria seleccionada en el html.
function cargarCategorias() {
    let select = document.getElementById("categoria");

    categorias.forEach(cat => {
        let op = document.createElement("option");
        op.value = cat.nombre;
        op.textContent = cat.nombre;
        select.appendChild(op);
    });
}

// Inicio del juego.
document.getElementById("btnStart").onclick = () => {
    // Este let es para la categoria que se ellegio.
    let nombre = document.getElementById("categoria").value;

    // Este if verifica que la categoria sea correcta.
    if (!nombre) {
        document.getElementById("error").textContent = "Elegí categoría";
        return;
    }
     
    // Este let sirve para buscar la categoría que eligio. 
    let categoria = categorias.find(c => c.nombre === nombre);
    preguntas = mezclar(categoria.preguntas).slice(0, 5);
    document.getElementById("juego").classList.remove("oculto");
    mostrar();

};

// Esta funcion es para mostrar cada pregunta con sus opciones.
function mostrar() {
    if (index >= 5) return resultado();

    let p = preguntas[index];
    document.getElementById("progreso").textContent = `Pregunta ${index+1}/5`;
    document.getElementById("pregunta").textContent = p.pregunta;
    let opciones = mezclar([p.correcta, ...p.incorrectas]);
    let cont = document.getElementById("opciones");
    cont.innerHTML = "";

    opciones.forEach(o => {
        let div = document.createElement("div");
        div.textContent = o;
        div.className = "opcion";
        div.onclick = () => responder(div, o, p.correcta);
        cont.appendChild(div);
    });
    iniciarTimer();
}

// Esta función sirve para controlar el tiempo de cada pregunta.
function iniciarTimer() {
    tiempo = 6;
    document.getElementById("timer").textContent = tiempo;
    intervalo = setInterval(() => {
        tiempo--;
        document.getElementById("timer").textContent = tiempo;
        if (tiempo === 0) {
            clearInterval(intervalo);
            noResp++;
            index++;
            mostrar();
        }
    }, 1000);
}

// Esta funcion sirve para procesar la respuesta.
function responder(el, seleccion, correcta) {
    clearInterval(intervalo);

    let opciones = document.querySelectorAll(".opcion");
    opciones.forEach(o => o.onclick = null);

    if (seleccion === correcta) {
        el.classList.add("correcta");
        correctas++;
    } else {
        el.classList.add("incorrecta");
        incorrectas++;

        opciones.forEach(o => {
            if (o.textContent === correcta) {
                o.classList.add("correcta");
            }
        });
    }

    setTimeout(() => {
        index++;
        mostrar();
    }, 1000);
}

// Esta funcion muestra el resultado final del juego las preguntas correctas, las incorrectas, las no respondidas.
function resultado() {
    document.getElementById("juego").classList.add("oculto");
    document.getElementById("resultado").classList.remove("oculto");

    document.getElementById("resumen").innerHTML = `
        Total: 5 <br>
        Correctas: ${correctas} <br>
        Incorrectas: ${incorrectas} <br>
        No respondidas: ${noResp}
    `;
}

// Esta funcion es para mezclar las respuestas para que no esten en el mismo lugar siempre.
function mezclar(arr) {
    return arr.sort(() => Math.random() - 0.5);
}

// Apartir de aca es el boton para reiniciar.
document.getElementById("reiniciar").onclick = () => {
    
    // Reiniciar variables
    index = 0;
    correctas = 0;
    incorrectas = 0;
    noResp = 0;
    tiempo = 6;
    preguntas = [];

    clearInterval(intervalo);

    // Limpiar contenido visual
    document.getElementById("opciones").innerHTML = "";
    document.getElementById("pregunta").textContent = "";
    document.getElementById("progreso").textContent = "";
    document.getElementById("timer").textContent = "";

    // Volver a mostrar el inicio
    document.getElementById("resultado").classList.add("oculto");
    document.getElementById("juego").classList.add("oculto");

    // Resetear selección de categoría
    document.getElementById("categoria").value = "";

    // Limpiar errores
    document.getElementById("error").textContent = "";
};