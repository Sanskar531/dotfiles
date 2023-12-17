layout_type=`yabai -m query --spaces --space | jq '.type' | sed 's/"//g'`

if [[ $layout_type = "stack" ]]; then
  yabai -m config layout bsp
else
  yabai -m config layout stack
fi
