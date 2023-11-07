#!/bin/bash
# included in Session and Startup for Xfce

feh --bg-fill ~/Pictures/Desktop.Wallpaper/mob-psycho-100.jpg
bash /home/mitchell/.startup/touchpad.sh

#function redshift () {
#    echo "RUNNING REDSHIFT"
#    source ${HOME}/.startup/redshift.sh
#}

function run_once () {
    echo "---- run once ---- "
    declare prog_ref="$1"
    echo "$1[@$1]"
    if [ -z "$(pgrep $1)" ]; then
        echo "$1"
        "$1" 1>&2 &
    fi
}
echo "declare..."
declare -A run_once_programs=(
    ["spotify"]="spotify",
    ["dropbox"]="dropboxd",
    ["redshift"]="redshift -l 40.15472109866484:-75.88790502627172",
    ["nm-applet"]="nm-applet",
    ["xfce4-power-manager"]="xfce4-power-manager"
    ["blueman-applet"]="blueman-applet"
)
echo ${!run_once_programs}
for prog_name in "${!run_once_programs[@]}"; do
    echo "for..." "${prog_name}"
    run_once "${prog_name[${prog_name}]}"
    echo "-------next--------"
done
#source ${HOME}/.startup/dbus
