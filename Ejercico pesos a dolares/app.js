const API_URL = "https://dolarapi.com/v1/dolares"; 

async function convertir() {

    const pesosInput = document.getElementById("pesos");
    const error = document.getElementById("error");
    const contenedor = document.getElementById("resultados");
    let pesos = parseFloat(pesosInput.value);

    try {
        const response = await fetch(API_URL);
        if (!response.ok) throw new Error();
        const data = await response.json();
        const tipos = ["oficial", "blue", "bolsa"];

        data.forEach(dolar => {
            if (tipos.includes(dolar.casa)) {

                //Este let compra guarda el valor de la compra.
                let compra = dolar.compra;
                //Este let venta guarda el valor de la venta.
                let venta = dolar.venta;
                let usdCompra = (pesos / compra).toFixed(2);
                let usdVenta = (pesos / venta).toFixed(2);

                
                let clase = dolar.casa === "bolsa" ? "mep" : dolar.casa;

                //Este let card es para crear las targetas en donde se muestran los datos.
                let card = `
                    <div class="card ${clase}">
                        <h3>${dolar.nombre}</h3>
                        <p><strong>Compra:</strong> $${compra}</p>
                        <p><strong>Venta:</strong> $${venta}</p>
                        <p><strong>USD (Compra):</strong> ${usdCompra}</p>
                        <p><strong>USD (Venta):</strong> ${usdVenta}</p>
                    </div>
                `;
                contenedor.innerHTML += card;
            }
        });

    } catch (errorAPI) {
        error.textContent = " Error al obtener datos de la API. ";
    }

}


function resetear() {

    // Limpiar input
    document.getElementById("pesos").value = "";
    // Limpiar mensajes de error
    document.getElementById("error").textContent = "";
    // Limpiar resultados (las tarjetas)
    document.getElementById("resultados").innerHTML = "";

}