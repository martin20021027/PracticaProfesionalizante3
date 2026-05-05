<?php
$host = "localhost"; 
$user = "root";
$pass = "";          
$dbname = "instituto";

$conn = new mysqli($host, $user, $pass, $dbname);

$tabla = $_GET['tabla'];

// INSERTAR DATOS
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if ($tabla == "alumno") {
        $nombre = $_POST["nombre"];
        $edad = $_POST["edad"];
        $fecha = $_POST["fecha"];
        $dni = $_POST["dni"];
        $email = $_POST["email"];
        $carrera = $_POST["carrera"];

        $sql = "INSERT INTO alumnos (nombre, edad, Fecha_nacimiento, DNI, email, ID_carrera)
                VALUES ('$nombre', $edad, '$fecha', '$dni', '$email', $carrera)";
    }

    if ($tabla == "profesor") {
        $nombre = $_POST["nombre"];
        $email = $_POST["email"];

        $sql = "INSERT INTO profesor (nombre, email)
                VALUES ('$nombre', '$email')";
    }

    if ($tabla == "materia") {
        $nombre = $_POST["nombre"];
        $profesor = $_POST["profesor"];
        $curso = $_POST["curso"];
        $carrera = $_POST["carrera"];

        $sql = "INSERT INTO materia (nombre, ID_profesor, curso, ID_carrera)
                VALUES ('$nombre', $profesor, '$curso', $carrera)";
    }

    if ($tabla == "carrera") {
        $nombre = $_POST["nombre"];

        $sql = "INSERT INTO carrera (nombre)
                VALUES ('$nombre')";
    }

    if ($tabla == "usuario") {
        $nombre = $_POST["nombre"];
        $password = $_POST["password"];
        $email = $_POST["email"];

        $sql = "INSERT INTO usuario (nombre, contraseña, email)
                VALUES ('$nombre', '$password', '$email')";
    }

    // REDIRECCION AUTOMATICA
    if ($conn->query($sql)) {
        header("Location: index.php?tabla=$tabla");
        exit();
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h2>Agregar a <?php echo $tabla; ?></h2>

<form method="POST">

<?php if ($tabla == "alumno") { ?>
    Nombre: <input type="text" name="nombre"><br>
    Edad: <input type="number" name="edad"><br>
    Fecha nacimiento: <input type="text" name="fecha"><br>
    DNI: <input type="text" name="dni"><br>
    Email: <input type="text" name="email"><br>
    ID Carrera: <input type="number" name="carrera"><br>
<?php } ?>

<?php if ($tabla == "profesor") { ?>
    Nombre: <input type="text" name="nombre"><br>
    Email: <input type="text" name="email"><br>
<?php } ?>

<?php if ($tabla == "materia") { ?>
    Nombre: <input type="text" name="nombre"><br>
    ID Profesor: <input type="number" name="profesor"><br>
    Curso: <input type="text" name="curso"><br>
    ID Carrera: <input type="number" name="carrera"><br>
<?php } ?>

<?php if ($tabla == "carrera") { ?>
    Nombre: <input type="text" name="nombre"><br>
<?php } ?>

<?php if ($tabla == "usuario") { ?>
    Nombre: <input type="text" name="nombre"><br>
    Contraseña: <input type="password" name="password"><br>
    Email: <input type="text" name="email"><br>
<?php } ?>

<input type="submit" value="Guardar">

</form>

</body>
</html>