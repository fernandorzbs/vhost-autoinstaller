#!/bin/bash

# Lista de versiones de PHP disponibles
php_versions=("7.3" "8.2")

# Pregunta al usuario cuál versión de PHP desea usar
echo "Seleccione la versión de PHP que desea utilizar:"

# Itera sobre las versiones y muestra un menú
for ((i=0; i<${#php_versions[@]}; i++)); do
  echo "$((i+1)). PHP ${php_versions[i]}"
done

# Lee la elección del usuario
read -p "Ingrese el número de la versión deseada: " choice

# Valida la elección del usuario
if ((choice >= 1 && choice <= ${#php_versions[@]})); then
  selected_version=${php_versions[choice-1]}

  # Desactiva la versión actual de PHP
  current_php_version=$(php -v | awk '/^PHP/ {print $2}' | cut -d. -f1,2)

  if [[ "$current_php_version" != "$selected_version" ]]; then
    sudo a2dismod "php$current_php_version"
    sudo a2enmod "php$selected_version"
    sudo systemctl restart apache2
  fi
  # Establece la versión de PHP seleccionada
  sudo update-alternatives --set php "/usr/bin/php$selected_version"
  echo "Se ha configurado PHP $selected_version como la versión activa."
else
  echo "Selección no válida. Saliendo."
fi
