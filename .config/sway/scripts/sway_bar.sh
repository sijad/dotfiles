#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

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

# Audio and multimedia
audio_volume=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }')
audio_is_muted=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $4 }')

# Others
language=$(swaymsg -r -t get_inputs | awk '/1:1:AT_Translated_Set_2_keyboard/;/xkb_active_layout_name/' | grep -A1 '\b1:1:AT_Translated_Set_2_keyboard\b' | grep "xkb_active_layout_name" | awk -F '"' '{print $4}')

if [ $battery0_status = "discharging" ] || [ $battery1_status = "discharging" ] ;
then
    battery_pluggedin='⚠'
else
    battery_pluggedin='⚡'
fi

if [ $audio_is_muted = "off" ]
then
    audio_active='🔇'
else
    audio_active='🔊'
fi

echo "⌨ $language | $audio_active $audio_volume | $battery_pluggedin $battery0_charge $battery1_charge | 🕘 $date_and_week $current_time | $jalali_date"
