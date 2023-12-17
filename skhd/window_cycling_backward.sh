layout_type=`yabai -m query --spaces --space | jq '.type' | sed 's/"//g'`

if [[ $layout_type = "stack" ]]; then
  yabai -m window --focus stack.prev 
  if [[ $? != 0 ]]; then
    yabai -m window --focus stack.last
  fi
else
  yabai -m window --focus prev 
  if [[ $? != 0 ]]; then
    yabai -m window --focus last
  fi
fi
