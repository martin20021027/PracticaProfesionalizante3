class Carta {
    constructor(emoji) {
        this.emoji = emoji;
        this.mostrada = false;
        this.resuelta = false;
    }
}

class Juego {
    constructor() {
        this.tablero = document.getElementById("tablero");
        this.intentos = 0;
        this.paresRestantes = 50;
        this.cartas = [];
        this.seleccionadas = [];
        this.bloqueado = false;

        this.intentosHTML = document.getElementById("intentos");
        this.paresHTML = document.getElementById("pares");
        this.mensaje = document.getElementById("mensaje");

        this.iniciar();
    }

    iniciar() {
        this.tablero.innerHTML = "";
        this.cartas = [];
        this.seleccionadas = [];
        this.intentos = 0;
        this.paresRestantes = 50;
        this.bloqueado = false;
        this.mensaje.textContent = "";

        this.actualizarInfo();

        this.crearCartas();
        this.mezclar();
        this.renderizar();
    }

    crearCartas() {
        let seleccion = listaEmojis.slice(0, 50);

        seleccion.forEach(e => {
            this.cartas.push(new Carta(e.simbolo));
            this.cartas.push(new Carta(e.simbolo));
        });
    }

    mezclar() {
        this.cartas.sort(() => Math.random() - 0.5);
    }

    renderizar() {
        this.tablero.innerHTML = "";

        this.cartas.forEach((carta, index) => {
            const div = document.createElement("div");
            div.classList.add("carta");

            if (carta.mostrada || carta.resuelta) {
                div.textContent = carta.emoji;
                div.classList.add("mostrada");
            }

            if (carta.resuelta) {
                div.classList.add("resuelta");
            }

            div.addEventListener("click", () => this.seleccionarCarta(carta, div));

            this.tablero.appendChild(div);
        });
    }

    seleccionarCarta(carta, elemento) {
        if (this.bloqueado || carta.mostrada || carta.resuelta) return;

        carta.mostrada = true;
        this.seleccionadas.push(carta);

        this.renderizar();

        if (this.seleccionadas.length === 2) {
            this.intentos++;
            this.actualizarInfo();
            this.comparar();
        }
    }

    comparar() {
        const [c1, c2] = this.seleccionadas;

        if (c1.emoji === c2.emoji) {
            c1.resuelta = true;
            c2.resuelta = true;
            this.seleccionadas = [];

            this.paresRestantes--;
            this.actualizarInfo();

            if (this.paresRestantes === 0) {
                this.mensaje.textContent = "🎉 Juego terminado";
                this.mensaje.textContent = this.intentos;
            }
        } else {
            this.bloqueado = true;

            setTimeout(() => {
                c1.mostrada = false;
                c2.mostrada = false;
                this.seleccionadas = [];
                this.bloqueado = false;
                this.renderizar();
            }, 1000);
        }

        this.renderizar();
    }

    actualizarInfo() {
        this.intentosHTML.textContent = this.intentos;
        this.paresHTML.textContent = this.paresRestantes;
    }
}

// iniciar juego
const juego = new Juego();

// botón reiniciar
document.getElementById("reiniciar").addEventListener("click", () => {
    juego.iniciar();
});
