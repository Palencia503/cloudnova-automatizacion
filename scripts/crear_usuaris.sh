# Script para crear un usuario en Linux con shell /bin/bash

# Verificar si se ejecuta como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root o usando sudo."
  exit 1
fi

# Pedir el nombre de usuario
read -p "Introduce el nombre del nuevo usuario: " nombre_usuario

# Verificar si el nombre de usuario está vacío
if [ -z "$nombre_usuario" ]; then
  echo "El nombre de usuario no puede estar vacío."
  exit 1
fi

# Crear el usuario con el shell /bin/bash
# -m crea el directorio home, -s especifica el shell
useradd -m -s /bin/bash "$nombre_usuario"

# Verificar si el usuario se creó correctamente
if [ $? -eq 0 ]; then
  echo "Usuario '$nombre_usuario' creado exitosamente."
  echo "Ahora, establece una contraseña para el usuario:"
  # Pedir contraseña de forma segura
  passwd "$nombre_usuario"
else
  echo "Error al crear el usuario '$nombre_usuario'."
fi

exit 0
