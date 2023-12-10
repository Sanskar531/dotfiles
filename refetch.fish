switch (uname)
  case Linux
    # Remove all existing configs
    rm -rf ./picom 2> /dev/null
    rm -rf ./polybar 2> /dev/null
    rm ./xmonad/xmonad.hs 2> /dev/null
    rm ./.xinitrc 2> /dev/null

    # Fetch new configs
    cp -r ~/.config/picom .
    cp -r ~/.config/polybar/ .
    cp ~/.xmonad/xmonad.hs ./xmonad/
    cp ~/.xinitrc .
  case Darwin
    rm -rf ./skhd 2> /dev/null
    rm -rf ./yabai 2> /dev/null

    cp -r ~/.config/yabai .
    cp -r ~/.config/skhd .
end

# Always refetch neovim configs
rm -rf ./nvim 2> /dev/null
rm ./starship.toml 2> /dev/null
rm ./.tmux.conf 2> /dev/null
rm config.fish 2> /dev/null
rm ./alacritty 2> /dev/null

cp ~/.config/fish/config.fish .
cp -r ~/.config/nvim/ ./nvim
cp ~/.config/starship.toml .
cp ~/.tmux.conf .
cp -r ~/.config/alacritty .
