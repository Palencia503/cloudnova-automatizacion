#!/bin/bash

# Verificar si el script se ejecuta como root (superusuario)
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script con sudo (ej: sudo ./crear_usuario.sh)"
  exit 1
fi

# Solicitar el nombre de usuario
read -p "Introduce el nombre del nuevo usuario: " nombre_usuario

# Verificar si el nombre de usuario está vacío
if [ -z "$nombre_usuario" ]; then
  echo "Error: El nombre de usuario no puede estar vacío."
  exit 1
fi

# Verificar si el usuario ya existe
if id "$nombre_usuario" &>/dev/null; then
    echo "El usuario '$nombre_usuario' ya existe."
else
    # Crear el usuario con directorio home (-m) y shell por defecto
    useradd -m "$nombre_usuario"
    echo "Usuario '$nombre_usuario' creado exitosamente."

    # Solicitar y establecer la contraseña
    echo "Estableciendo la contraseña para el usuario '$nombre_usuario':"
    passwd "$nombre_usuario"
fi

exit 0
