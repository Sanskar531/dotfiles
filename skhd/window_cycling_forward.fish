set layout_type (yabai -m query --spaces --space | jq '.type' | string trim -c '"')

if test $layout_type = "stack"
  yabai -m window --focus stack.next || yabai -m window --focus stack.first
else
  yabai -m window --focus next || yabai -m window --focus first
end
