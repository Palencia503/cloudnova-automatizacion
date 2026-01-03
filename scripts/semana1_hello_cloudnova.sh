LOG_FILE="/var/log/cloudnova/hello_cloudnova.log"
touch "$LOG_FILE"
chmod 640 "$LOG_FILE"
DATA=$(date '+%Y-%m-%d %H:%M:%S')
echo "$DATA - Hello CloudNova! Tarea automatica ejecutada." >> "$LOG_FILE"
