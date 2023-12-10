switch (uname)
  case Linux
    pacman -Syyu
    pacman -S neovim scrot feh git zoxide exa ripgrep git
  case Darwin
    brew install neovim zoxide exa ripgrep git
end

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fish ./apply.fish
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
