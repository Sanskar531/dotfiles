switch (uname)
  case Linux
    pacman -Syyu
    pacman -S neovim scrot feh git zoxide exa ripgrep git fd neofetch tmux jq yq ffmpeg fzf
  case Darwin
    brew install neovim zoxide exa ripgrep git fd tmux jq yq ffmpeg fzf
end

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fish ./apply.fish
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
