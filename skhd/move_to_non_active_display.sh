current_display=`yabai -m query --displays --display | jq '.index'`

if [[ $current_display = "1" ]]; then
  yabai -m window --display 2
  yabai -m display --focus 2
else
  yabai -m window --display 1
  yabai -m display --focus 1
fi
