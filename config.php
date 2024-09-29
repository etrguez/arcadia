<?php
$url = getenv('JAWSDB_URL');
if ($url) {
    $dbparts = parse_url($url);

    $hostname = $dbparts['host'];
    $username = $dbparts['user'];
    $password = $dbparts['pass'];
    $database = ltrim($dbparts['path'], '/');
    $port = $dbparts['port'] ?? 3306; 
} else {

    $hostname = 'localhost';
    $username = 'root';
    $password = '';
    $database = 'arcadia';
    $port = 3308; 
}

try {
    
    $bdd = new PDO("mysql:host=$hostname;port=$port;dbname=$database;charset=utf8", $username, $password);
    $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connexion réussie à la base de données.";
} catch (PDOException $e) {
    die('Erreur de connexion : ' . $e->getMessage());
}
