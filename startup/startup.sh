#!/bin/bash
# included in Session and Startup for Xfce

feh --bg-fill ~/Pictures/Desktop.Wallpaper/mob-psycho-100.jpg
source /home/mitchell/.startup/touchpad.sh

#function redshift () {
#    echo "RUNNING REDSHIFT"
#    source ${HOME}/.startup/redshift.sh
#}

function run_once () {
    echo "---- run once ---- "
    local -n prog_ref = "$1"
    echo "$1[@$1]"
    if [ -z "$(pgrep $1)" ]; then
        echo "$1"
        "$1" 1>&2 &
    fi
}
echo "declare"
declare -A run_once_programs=(
    ["spotify"]="spotify",
    ["dropbox"]="dropboxd",
    ["redshift"]="redshift",
    ["nm-applet"]="nm-applet",
    ["xfce4-power-manager"]="xfce4-power-manager"
    ["blueman-applet"]="blueman-applet"
)
echo ${!run_once_programs}
for prog_name in "${!run_once_programs[@]}"; do
    echo "for" $prog
    run_once "${prog_name[$cmd]}"
done
#source ${HOME}/.startup/dbus
