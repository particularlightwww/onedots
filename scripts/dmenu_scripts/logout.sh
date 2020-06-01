#!/bin/bash

RET=$(echo -e "Shutdown\nReboot\nLogout\nRestart_dwm\nReturn" | dmenu -l 5 -p "Power")

case $RET in
 Shutdown) systemctl poweroff ;;
 Reboot) systemctl reboot ;;
 Logout) killall Xorg ;;
 Restart_dwm) killall dwm ;;
 Return) bash ~/scripts/dmenu_scripts/system_control.sh ;;
esac
