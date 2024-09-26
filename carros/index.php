<?php
// Conexao com o bd
$servername = "baseteste.srv.br";
 $username = "basetestesrv_u_AndreLuizGimenezDaSilva";
 $password = "piorsaladomundo";
 $database = "basetestesrv_AndreLuizGimenezDaSilva";

 $conexao = mysqli_connect($servername, $username, $password, $database);
 

 if(!$conexao){
    die("Falhou a conexão" .mysqli_connect_error());
}else{
    echo "conectado com sucesso";
} 
// checa se a conexão com o banco de dados foi um sucesso.

?>