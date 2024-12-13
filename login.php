<?php
$host = 'localhost';
$port = '5432';
$dbname = 'PTD';
$user = 'postgres';
$password = '123456';

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if (!$conn) {
    die("Erro de conexão com o banco de dados");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    var_dump($_POST);
    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];
}

$query = "SELECT * FROM usuarios WHERE usuarios.login = $1";
$result = pg_query_params($conn, $query, array($usuario));

if ($result) {
    $user_data = pg_fetch_assoc($result);

    if ($user_data) {
        if ($senha === $user_data['senha']) {
            header("Location: dashboard.html");
            exit;
        } else {
            echo "Senha incorreta.";
        }
    } else {
        echo "Usuário não encontrado.";
    }
} else {
    echo "Erro na consulta ao banco de dados.";
}

pg_close($conn);
?>
