<?php

// Récupérer les données envoyées
$data = file_get_contents('php://input');

// Convertir les données JSON en tableau
$myArray = json_decode($data);

// Chemin du fichier .txt
$filePath = 'C:\wamp64\www\france_inter\api.txt';

// Ouvrir le fichier en mode écriture
$file = fopen($filePath, 'w');

// Parcourir chaque ligne du tableau et écrire dans le fichier
foreach ($myArray as $line) {
    fwrite($file, $line . PHP_EOL); // Ajouter un saut de ligne après chaque ligne
}

// Fermer le fichier
fclose($file);
echo 'Écriture dans le fichier terminée.';
?>