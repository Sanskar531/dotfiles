app=`yabai -m query --windows --window | jq '.app' | sed 's/"//g'`

if [[ $app == "Alacritty" ]]; then
  kill $(yabai -m query --windows --window | jq .pid | sed 's/"//g')
elif [[ $app == "Google Chrome" ]]; then
  window_id=`yabai -m query --windows --window | jq .id | sed 's/"//g'`
  /Users/$(whoami)/.config/skhd/window_cycling_backward.sh
  yabai -m window $window_id --close
  exit 0
else
  yabai -m window --close
fi
