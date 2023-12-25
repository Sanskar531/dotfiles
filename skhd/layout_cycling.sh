layout_type=`yabai -m query --spaces --space | jq '.type' | sed 's/"//g'`
space=`yabai -m query --spaces --space | jq '.index'`
windows=`yabai -m query --windows --space`

if [[ $layout_type = "stack" ]]; then
  yabai -m config --space $space layout bsp
  ~/dotfiles/skhd/rust_scripts/restore_state/target/release/restore_state -w /tmp/skhd/$space.json
else
  mkdir /tmp/skhd 2> /dev/null
  yabai -m query --windows --space > /tmp/skhd/$space.json
  yabai -m config --space $space layout stack
fi
