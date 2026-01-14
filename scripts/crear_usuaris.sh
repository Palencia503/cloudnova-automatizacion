#!/bin/bash
# Script para crear un usuario nuevo

# Verificar si se ejecuta como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root (sudo)"
   exit 1
fi

# Nombre del usuario a crear (se puede pasar como parámetro: $1)
USUARIO=$1

if [ -z "$USUARIO" ]; then
    echo "Uso: $0 <nombre_usuario>"
    exit 1
fi

# Crear el usuario, -m crea el directorio home, -s define el shell
useradd -m -s /bin/bash "$USUARIO"

if [ $? -eq 0 ]; then
    echo "Usuario '$USUARIO' creado exitosamente."
    echo "Establezca la contraseña para '$USUARIO':"
    passwd "$USUARIO" # Solicitará la contraseña interactivamente
else
    echo "Error al crear el usuario '$USUARIO'."
fi
