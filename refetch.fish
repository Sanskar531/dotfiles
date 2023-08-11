rm -rf ./nvim
rm -rf ./picom
rm -rf ./polybar
rm ./xmonad/xmonad.hs
rm config.fish

cp -r ~/.config/nvim/ .
cp -r ~/.xmonad/xmonad.hs ./xmonad/
cp -r ~/.config/polybar/ .
cp -r ~/.config/fish/config.fish .
cp -r ~/.config/picom .
