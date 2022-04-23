#!/usr/bin/env bash

NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg
# NOTIFY_ICON=/usr/share/icons/Mint-X/apps/96/system-software-update.svg

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

get_total_updates

# notify user of updates
if hash notify-send &>/dev/null; then
    if (( UPDATES > 50 )); then
        notify-send -u critical -i $NOTIFY_ICON \
            "You really need to update!!" "$UPDATES New packages"
    elif (( UPDATES > 25 )); then
        notify-send -u normal -i $NOTIFY_ICON \
            "You should update soon" "$UPDATES New packages"
    elif (( UPDATES > 2 )); then
        notify-send -u low -i $NOTIFY_ICON \
            "$UPDATES New packages"
    fi
fi

if (( UPDATES == 1 )); then
    echo " $UPDATES "
elif (( UPDATES > 1 )); then
    echo " $UPDATES "
else
    echo " 0 "
fi

