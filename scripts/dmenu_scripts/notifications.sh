#!/bin/bash

RET=$(echo -e "Enable_notifications\nDisable_notifications\nRestart_dunst\nReturn" | dmenu -l 5 -p "Notification managing")
case $RET in
 Enable_notifications) notify-send "DUNST_COMMAND_RESUME" && notify-send "Notifications enabled" ;;
 Disable_notifications) notify-send "DUNST_COMMAND_PAUSE" ;;
 Restart_dunst) killall dunst && dunst & ;;
 Return) bash ~/scripts/dmenu_scripts/system_control.sh ;;
 *) ;;
esac
