#!/bin/sh

# Display dmenu options
CHOICE=$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
    -nb "#000000" \
    -nf "#93a1a1" \
    -sf "#ffffff" \
    -sb "#555555" \
    -b -i -p "Power:" -l 5)

# Execute the selected command
case "$CHOICE" in
    Shutdown) exec systemctl poweroff;;
    Reboot) exec systemctl reboot;;
    Logout) i3-msg exit;;
    Suspend)
        i3lock --color 101010
        if [ $? -eq 0 ]; then
            systemctl suspend
        else
            echo "i3lock failed to execute."
            exit 1
        fi
        ;;
    Lock) exec i3lock --color 101010;;
esac
