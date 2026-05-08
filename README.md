## 🛠️ Instrucciones de uso

Sigue estos pasos para implementar el script en tu entorno local:

1. **Dar permisos de ejecución:**
   Abre tu terminal y otorga permisos al archivo para que pueda correr como un programa:
   ```bash
   chmod +x backup_automation.sh
Ejecutar manualmente:
Puedes realizar un respaldo inmediato ejecutando:
Bash
./backup_automation.sh


Automatización con Crontab:
Para que el respaldo se haga de forma automática (por ejemplo, todos los días a las 2:00 AM), abre el editor de tareas cron:
Bash
crontab -e


Bash
0 2 * * * /ruta/a/tu/script/backup_automation.sh

En el paso del Crontab, recuerda que /ruta/a/tu/script/ debe ser la dirección real en la Mac (ejemplo: /Users/jesus/scripts/...).

Requisitos: Sistemas basados en Unix (Linux/macOS) y acceso a terminal





