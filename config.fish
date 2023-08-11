set -g fish_vi_key_bindings
bind -M insert jj 'set fish_bind_mode default; commandline -f backward-char force-repaint'
bind -M insert \cn accept-autosuggestion
bind -M default \cn accept-autosuggestion
set fish_greeting
bind -M default A 'set fish_bind_mode insert; commandline -f end-of-buffer'
zoxide init fish | source

set PATH $PATH:/home/sanskar/.yarn/bin
set PATH $PATH:/usr/local/go/bin
set PATH $PATH:/home/sanskar/go/bin
