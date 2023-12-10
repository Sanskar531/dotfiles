set layout_type (yabai -m query --spaces --space | jq '.type' | string trim -c '"')

if test $layout_type = "stack"
  yabai -m window --focus stack.prev || yabai -m window --focus stack.last
else
  yabai -m window --focus prev || yabai -m window --focus last
end
