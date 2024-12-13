<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

$host = 'localhost';
$port = '5432';
$dbname = 'PTD';
$user = 'postgres';
$password = '123456';

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
$error = "";
$aprov = "";

if (!$conn) {
    die("Erro de conexão com o banco de dados");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // var_dump($_POST);
    $action = $_POST['action'];
    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];

    if ($action === 'login') {    
        $query = "SELECT * FROM usuarios WHERE usuarios.login = $1";
        $result = pg_query_params($conn, $query, array($usuario));

        if ($result) {
            $user_data = pg_fetch_assoc($result);

            if ($user_data) {
                if ($senha === $user_data['senha']) {
                    header("Location: dashboard.html");
                    exit;
                } else {
                    $error = "Senha incorreta.";
                }
            } else {
                $error = "Usuário não encontrado.";
            }
        } else {
            $error = "Erro na consulta ao banco de dados.";
        }

    } else {
        $email = $_POST['email'];
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $error = "Email Inválido";
            echo "<script type='text/javascript'>
                window.location.href = 'login.html?error=' + encodeURIComponent('$error');
                </script>";
            exit;
        }

        $query = "INSERT INTO usuarios (login, senha, email, nome, criado_em) VALUES ($1, $2, $3, $4, CURRENT_DATE)";
        $result = pg_query_params($conn, $query, array($usuario, $senha, $email, $usuario));

        if ($result) {
            $aprov = "Usuário cadastrado com sucesso";
            echo "<script type='text/javascript'>
                window.location.href = 'login.html?aprov=' + encodeURIComponent('$aprov');
                </script>";
        } else {
            $error = pg_last_error($conn);
            echo "<script type='text/javascript'>
                window.location.href = 'login.html?error=' + encodeURIComponent('$error');
                </script>";
        }
    }
}

pg_close($conn);

if ($error) {
    echo "<script type='text/javascript'>
            window.location.href = 'login.html?error=' + encodeURIComponent('$error');
          </script>";
}
?>
