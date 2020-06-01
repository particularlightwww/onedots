#!/bin/bash

RET=$(echo -e "Notifications\nPower\ncancel" | dmenu -l 5 -p "System")

case $RET in
 Notifications)  bash ~/scripts/dmenu_scripts/notifications.sh ;;
 Power) bash ~/scripts/dmenu_scripts/logout.sh ;;
 *) ;;
esac
