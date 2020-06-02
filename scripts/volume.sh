#!/bin/bash
 
get_volume() {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}
 
is_mute() {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}
 
send_notification() {
    if is_mute ; then 
        bar="Muted"
    else
        display_volume=`get_volume`
        
        # https://en.wikipedia.org/wiki/Box-drawing_character
 
        count=21
        st=$(($display_volume / 5))
        en=$(($count - $st))
        
        if [ $en -ge 21 ]; then
         en=21
         st=0
        fi
 
        pr1=$(seq -s "█" $st | sed 's/[0-9]//g')
        pr2=$(seq -s "░" $en | sed 's/[0-9]//g')
        bar="$pr1$pr2"
        
        if [ $display_volume -le 25 ]; then
            icon_name="audio-volume-low"
        elif [ $display_volume -le 75 ]; then
            icon_name="audio-volume-medium"
        else
            icon_name="audio-volume-high"
        fi
 
        if [ $display_volume -lt 100 ] ; then
            parsent="$display_volume%"
        else
            parsent="$display_volume"
        fi
    fi
    
    dunstify -t 1500 -r 2593 -u normal "$bar $parsent"
}
 
case $1 in
    "up")
 amixer set Master 5%+
 send_notification
 ;;
    "down")
    amixer set Master 5%-
 send_notification
 ;;
    "mute")
    amixer set Master toggle
    if is_mute ; then 
     send_notification
    else
        pnmixer &
 send_notification
    fi
 ;;
esac
