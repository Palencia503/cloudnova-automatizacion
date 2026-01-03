#!/bin/bash
#Script: semana2_backup.sh
#Objectiu: copia de seguretat + pujada a Git + registre

ORIGEN="/var/log/cloudnova"
DESTI="/home/kalijp/cloudnova-backup"
LOG="/home/kalijp/PAC3/cloudnova-automatizacion/logs/backup.log"
REPO="/home/kalijp/PAC3/cloudnova-automatizacion"

DATA=$(date '+%Y-%m-%d_%H-%M-%S')
FITXER="backup_logs_$DATA.tar.gz"

#Crear el backup
tar -czf "$DESTI/$FITXER" "$ORIGEN"

#Registrar al log
echo "[$DATA] Backup creat: $FITXER" >> "$LOG"

#Copiar el backup al repositori
cp "$DESTI/$FITXER" "$REPO/backups/"

#Pujar a Git
cd "$REPO"
git add .
git commit -m "Backup del $DATA"
git push
