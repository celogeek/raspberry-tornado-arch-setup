#!/bin/bash
export PATH=/usr/sbin:/usr/bin:/sbin:/bin
API_KEY=$(yq -rc .api.key /etc/octoprint-tornado/config.yaml)
CONN="/opt/octoprint-tornado/bin/octoprint client -a ${API_KEY} post_json /api/connection"

case $1 in
    start-pre)
    ;;
    start)
        exec python2 /opt/klipper/klippy/klippy.py /etc/klipper/klipper.cfg -I /run/klipper/sock -l /run/klipper/logs/klipper.log
    ;;
    start-post)
        sleep 5
        $CONN '{"command":"connect","port":"/run/klipper/sock","baudrate":250000}'
    ;;
    stop)
        $CONN '{"command":"disconnect"}'
        sleep 5
        kill $MAINPID
    ;;
    stop-post)
    ;;
esac
