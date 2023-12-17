layout_type=`yabai -m query --spaces --space | jq '.type' | sed 's/"//g'`

if [[ $layout_type = "stack" ]]; then
  yabai -m window --focus stack.next
  if [[ $? != 0 ]]; then
    yabai -m window --focus stack.first
  fi
else
  yabai -m window --focus next 
  if [[ $? != 0 ]]; then
    yabai -m window --focus first
  fi
fi
