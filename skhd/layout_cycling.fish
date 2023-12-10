set layout_type (yabai -m query --spaces --space | jq '.type' | string trim -c '"')

if test $layout_type = "stack"
  yabai -m config layout bsp
else
  yabai -m config layout stack
end
