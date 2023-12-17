layout_type=`yabai -m query --spaces --space | jq '.type' | sed 's/"//g'`

if [[ $layout_type = "stack" ]]; then
  yabai -m window --focus stack.prev || yabai -m window --focus stack.last
else
  yabai -m window --focus prev || yabai -m window --focus last
fi
