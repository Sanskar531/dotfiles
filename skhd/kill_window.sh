app=`yabai -m query --spaces --space | jq '.app' | sed 's/"//g'`

if [[ $app == "alacritty" ]]; then
  kill $(yabai -m query --windows --window | jq .pid | sed 's/"//g')
else
  yabai -m window --close
fi

/Users/$(whoami)/.config/skhd/window_cycling_backward.sh
