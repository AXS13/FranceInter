#!/bin/bash

# Chemin du fichier texte
file_path="C:\wamp64\www\france_inter\api.txt"

# Fichier de sortie
output_file="C:\wamp64\www\france_inter\output.txt"

# Dossier de destination des téléchargements
download_folder="C:\wamp64\www\france_inter\downloads"

# Créer le dossier de destination des téléchargements s'il n'existe pas
mkdir -p "$download_folder"

# Supprimer le fichier de sortie s'il existe déjà
rm -f "$output_file"

# Boucle pour lire chaque ligne du fichier
while IFS= read -r line
do
  # Supprimer les espaces de la ligne
  line=$(echo "$line" | sed 's/ //g')

  # Effectuer une requête cURL pour chaque ligne et extraire l'URL avec jq
  result=$(curl $line | jq -r '.content.manifestations[0].url')

  # Vérifier si l'extraction de l'URL a réussi
  if [ -n "$result" ]; then
    echo "URL pour la ligne '$line' : $result" >> "$output_file"
    cd "$download_folder"
    curl -s -O "$result"
    cd - >/dev/null
  else
    echo "Impossible de récupérer l'URL pour la ligne '$line'" >> "$output_file"
  fi
done < "$file_path"

echo "Le traitement est terminé. Les résultats sont enregistrés dans le fichier '$output_file'."

# Attendre une saisie de l'utilisateur avant de quitter
read -n 1 -s -r -p "Appuyez sur une touche pour quitter..."
