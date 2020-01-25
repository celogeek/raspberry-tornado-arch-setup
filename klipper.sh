#!/bin/bash
export PATH=/usr/sbin:/usr/bin:/sbin:/bin

case $1 in
    start-pre)
    ;;
    start)
        exec python2 /opt/klipper/klippy/klippy.py /etc/klipper/klipper.cfg -I /run/klipper/sock -l /run/klipper/logs/klipper.log
    ;;
    start-post)
        sleep 5
        curl -s 'http://localhost/api/connection' -H 'Content-Type: application/json' --data-binary '{"command":"connect","port":"/run/klipper/sock","baudrate":250000}'
    ;;
    stop)
        curl -s 'http://localhost/api/connection' -H 'Content-Type: application/json' --data-binary '{"command":"disconnect"}'
        sleep 5
        kill $MAINPID
    ;;
    stop-post)
    ;;
esac
