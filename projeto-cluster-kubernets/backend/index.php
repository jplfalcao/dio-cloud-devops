<?
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

include 'conexao.php';

$id =  rand(1, 999);
$nome = $_POST["nome"];
$sobrenome = $_POST["sobrenome"];
$email = $_POST["email"];
$comentario = $_POST["comentario"];

$query = "INSERT INTO cadastro(id, nome, sobrenome, email, comentario) VALUES ('$id', '$nome', '$sobrenome', '$email', '$comentario')";


if ($link->query($query) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $link->error;
}
?>
