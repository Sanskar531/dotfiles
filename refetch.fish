switch (uname)
  case Linux
    # Remove all existing configs
    rm -rf ./picom
    rm -rf ./polybar
    rm ./xmonad/xmonad.hs
    rm config.fish

    # Fetch new configs
    cp -r ~/.xmonad/xmonad.hs ./xmonad/
    cp -r ~/.config/polybar/ .
    cp -r ~/.config/fish/config.fish .
    cp -r ~/.config/picom .
end

# Always refetch neovim configs
rm -rf ./nvim
cp -r ~/.config/nvim/ ./nvim
rm ./starship.toml
cp ~/.config/starship.toml .
