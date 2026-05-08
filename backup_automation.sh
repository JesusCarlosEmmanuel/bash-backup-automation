#!/bin/bash

# =================================================================
# Script: backup_automation.sh
# Autor: Jesús Emmanuel Jiménez Carlos
# Descripción: Automatización de respaldos con compresión y rotación.
# =================================================================

# --- CONFIGURACIÓN (Personaliza estas rutas) ---
SOURCE_DIR="$HOME/Documents/Proyectos"       # Carpeta que quieres respaldar
BACKUP_DIR="$HOME/Backups"                  # Carpeta donde se guardará el backup
LOG_FILE="$BACKUP_DIR/backup_log.txt"       # Archivo de registro (Logs)
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup_$DATE.tar.gz"
RETENTION_DAYS=7                            # Días para mantener respaldos viejos

# Crear la carpeta de destino si no existe
mkdir -p "$BACKUP_DIR"

echo "-----------------------------------------------------" >> "$LOG_FILE"
echo "[$DATE] Iniciando proceso de respaldo..." >> "$LOG_FILE"

# --- PROCESO DE COMPRESIÓN ---
# Utilizamos tar para comprimir (c: crear, z: gzip, f: archivo)
if tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR" 2>> "$LOG_FILE"; then
    echo "[$DATE] ÉXITO: Respaldo creado en $BACKUP_DIR/$BACKUP_NAME" >> "$LOG_FILE"
    echo "Proceso completado exitosamente."
else
    echo "[$DATE] ERROR: Falló la creación del respaldo" >> "$LOG_FILE"
    echo "Hubo un error. Revisa el archivo de log: $LOG_FILE"
    exit 1
fi

# --- ROTACIÓN DE ARCHIVOS (Mantenimiento) ---
# Elimina respaldos más antiguos que $RETENTION_DAYS para ahorrar espacio
echo "[$DATE] Limpiando respaldos antiguos (Mayores a $RETENTION_DAYS días)..." >> "$LOG_FILE"
find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f -mtime +$RETENTION_DAYS -delete >> "$LOG_FILE" 2>&1

echo "[$DATE] Fin del proceso." >> "$LOG_FILE"
echo "-----------------------------------------------------" >> "$LOG_FILE"
