rm -rf ~/.config/nvim 2> /dev/null
rm ~/.config/fish/config.fish 2> /dev/null
rm ~/.config/starship.toml 2> /dev/null
rm ~/.tmux.conf 2> /dev/null

cp -r ./nvim ~/.config/
cp ./config.fish ~/.config/fish/
cp ./starship.toml ~/.config/
cp ./.tmux.conf ~/

switch (uname)
  case Linux
    # Remove all existing configs
    rm -rf ~/.config/picom 2> /dev/null
    rm -rf ~/.config/polybar 2> /dev/null
    rm ~/.xmonad/xmonad.hs 2> /dev/null
    rm ~/.xinitrc 2> /dev/null

    # Apply new configs
    cp ./xmonad.hs ~/.xmonad/
    cp -r ./polybar ~/.config
    cp ./picom ~/.config
    cp ./.xinitrc ~/
  case Darwin
    rm ~/.config/yabai 2> /dev/null
    rm ~/.config/skhd 2> /dev/null

    cp -r ./skhd ~/.config/
    cp -r ./yabai ~/.config/
end
