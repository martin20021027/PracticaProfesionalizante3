<?php
session_start();

if (!isset($_SESSION["usuario"])) {
    header("Location: login.php");
    exit();
}

$host = "localhost"; 
$user = "root";
$pass = "";          
$dbname = "instituto";
$conn = new mysqli($host, $user, $pass, $dbname);

// Elegir tabla por URL
$tabla = isset($_GET['tabla']) ? $_GET['tabla'] : 'usuario';

// Da la trayectoria del alumno.
if ($tabla == "trayectoria" && isset($_GET['id'])) {

    $id = $_GET['id'];

    $sql = "SELECT alumno.nombre AS alumno, carrera.nombre AS carrera, materia.nombre AS materia
            FROM alumno
            INNER JOIN carrera ON alumno.ID_carrera = carrera.ID_carrera
            INNER JOIN materia ON materia.ID_carrera = carrera.ID_carrera
            WHERE alumno.ID_alumno = $id";

} else {
    // Consulta normal
    $sql = "SELECT * FROM $tabla";
}

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<body>

<h1> Bienvenido usuario "<?php echo $_SESSION["usuario"]; ?>"</h1>

<a href="?tabla=alumno">Alumnos</a> |
<a href="?tabla=profesor">Profesores</a> |
<a href="?tabla=materia">Materias</a> |
<a href="?tabla=carrera">Carreras</a> |
<a href="?tabla=usuario">Usuarios</a> |
<a href="logout.php">Cerrar sesión</a>

<hr>

<?php
if ($tabla == "trayectoria") {
    echo "<h2>Trayectoria del Alumno</h2>";
} else {
    echo "<h2>Tabla: $tabla</h2>";
}

if ($result->num_rows > 0) {

    echo "<table border='1'>";

    // Encabezados
    while ($field = $result->fetch_field()) {
        echo "<th>{$field->name}</th>";
    }

    // 👉 columna extra SOLO en alumnos
    if ($tabla == "alumno") {
        echo "<th>Acción</th>";
    }

    // Datos
    while($row = $result->fetch_assoc()) {
        echo "<tr>";

        foreach ($row as $dato) {
            echo "<td>$dato</td>";
        }

        // 👉 BOTÓN trayectoria
        if ($tabla == "alumno") {
            echo "<td><a href='?tabla=trayectoria&id={$row['ID_alumno']}'>Ver Trayectoria</a></td>";
        }

        echo "</tr>";
    }

    echo "</table>";

} else {
    echo "No hay datos disponibles";
}
?>

<head>
    <link rel="stylesheet" href="styles.css">
</head>

</body>
</html>
