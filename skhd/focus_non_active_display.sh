current_display=`yabai -m query --displays --display | jq '.index'`

if [[ "$current_display" = "1" ]]; then
  yabai -m display --focus 2
else
  yabai -m display --focus 1
fi

