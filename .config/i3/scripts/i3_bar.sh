#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

while :
do
    # Date and time
    date_and_week=$(date "+%Y/%m/%d")
    current_time=$(date "+%H:%M")
    jalali_date=$($DIR/jalali)

    #############
    # Commands
    #############

    # Battery or charger
    battery0_name=$(upower --enumerate | grep 'BAT0')
    battery1_name=$(upower --enumerate | grep 'BAT1')
    battery0_charge=$(upower --show-info $battery0_name | egrep "percentage" | awk '{print $2}')
    battery1_charge=$(upower --show-info $battery1_name | egrep "percentage" | awk '{print $2}')
    battery0_status=$(upower --show-info $battery0_name | egrep "state" | awk '{print $2}')
    battery1_status=$(upower --show-info $battery1_name | egrep "state" | awk '{print $2}')

    # Removed weather because we are requesting it too many times to have a proper
    # refresh on the bar
    #weather=$(curl -Ss 'https://wttr.in/Pontevedra?0&T&Q&format=1')

    if [ $battery0_status = "discharging" ] || [ $battery1_status = "discharging" ] ;
    then
        battery_pluggedin='⚠'
    else
        battery_pluggedin='⚡'
    fi

    echo "$battery_pluggedin $battery0_charge $battery1_charge | 🕘 $date_and_week $current_time | $jalali_date"

    sleep 5
done

