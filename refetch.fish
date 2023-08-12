switch (uname)
  case Linux
    # Remove all existing configs
    rm -rf ./picom
    rm -rf ./polybar
    rm ./xmonad/xmonad.hs

    # Fetch new configs
    cp -r ~/.config/picom .
    cp -r ~/.config/polybar/ .
    cp ~/.xmonad/xmonad.hs ./xmonad/
end

# Always refetch neovim configs
rm -rf ./nvim 2> /dev/null
rm ./starship.toml 2> /dev/null
rm ./.tmux.conf 2> /dev/null
rm config.fish 2> /dev/null
cp ~/.config/fish/config.fish .
cp -r ~/.config/nvim/ ./nvim
cp ~/.config/starship.toml .
cp ~/.tmux.conf .
