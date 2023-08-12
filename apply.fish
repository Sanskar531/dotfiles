rm -rf ~/.config/nvim 2> /dev/null
rm ~/.config/fish/config.fish 2> /dev/null
rm ~/.config/starship.toml 2> /dev/null
rm ~/.tmux.conf 2> /dev/null

cp -r ./nvim ~/.config/
cp ./config.fish ~/.config/fish/
cp ./starship.toml ~/.config/
cp ./.tmux.conf ~/

switch (uname)
  case Linux:
    # Remove all existing configs
    rm -rf ~/.config/picom
    rm -rf ~/.config/polybar
    rm ~/.xmonad/xmonad.hs

    # Apply new configs
    cp ./xmonad.hs ~/.xmonad/
    cp -r ./polybar ~/.config
    cp ./picom ~/.config
end
