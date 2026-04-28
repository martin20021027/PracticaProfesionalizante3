<?php
session_start();

$host = "localhost"; 
$user = "root";
$pass = "";          
$dbname = "instituto";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $password = $_POST["password"];

    $sql = "SELECT * FROM usuario WHERE nombre='$nombre' AND contraseña='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $_SESSION["usuario"] = $nombre;
        header("Location: index.php");
        exit();
    } else {
        echo "Usuario o contraseña incorrectos";
    }
}
?>

<!DOCTYPE html>
<html>
<body>
    <h2>Inicio</h2>
    <form method="POST">
        Nombre: <input type="text" name="nombre"><br>
        Contraseña: <input type="password" name="password"><br>
        <button type="submit">Ingresar</button>
    </form>
</body>
</html>