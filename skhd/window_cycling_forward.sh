layout_type=`yabai -m query --spaces --space | jq '.type' | sed 's/"//g'`

if [[ $layout_type = "stack" ]]; then
  yabai -m window --focus stack.next || yabai -m window --focus stack.first
else
  yabai -m window --focus next || yabai -m window --focus first
fi
