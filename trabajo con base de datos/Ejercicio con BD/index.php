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

// CONSULTA DINÁMICA
$sql = "SELECT * FROM $tabla";
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
<h2>Tabla: <?php echo $tabla; ?></h2>

<?php
if ($result->num_rows > 0) {
    echo "<table border='1'>";

    // Encabezados
    while ($field = $result->fetch_field()) {
        echo "<th>{$field->name}</th>";
    }

    // Datos
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        foreach ($row as $dato) {
            echo "<td>$dato</td>";
        }
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No hay datos";
}
?>

</body>
</html>