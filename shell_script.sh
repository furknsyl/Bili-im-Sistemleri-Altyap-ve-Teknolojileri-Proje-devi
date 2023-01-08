#!/bin/bash
### BEGIN INIT INFO
#Provides:  shell_script
#Required-Start: $remote_fs $syslog
#Required-Stop: $remote_fs $syslog
#Default-Start: 2 3 4 5 
#Default-Stop: 0 1 6
#Short Description: Servis Açıklaması
# Description: Servisin detaylı açıklaması
### END INIT INFO
DIRECTORY="/home/soylu/Masaüstü"
SLEEP_TIME=10

OUTPUT_FILE="değişiklikler.txt"

while true; do
changes=$(ls "$DIRECTORY")

echo "$changes">>"$OUTPUT_FILE"

sleep "$SLEEP_TIME"
FILE_NAME="$changes"

DATABASE_NAME="deneme2"

psql -d "$DATABASE_NAME" -c "INSERT INTO degisiklikler (dosya_adi) VALUES ('$FILE_NAME');"
done
