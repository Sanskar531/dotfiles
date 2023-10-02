# Path variables for unix
switch (uname)
  case Linux
    set PATH $PATH:/home/`echo $USER`/.yarn/bin
    set PATH $PATH:/usr/local/go/bin
    set PATH $PATH:/home/`echo $USER`/go/bin
  case Darwin
    # Update path for fish
    # Bins are installed using brew for mac os configs
    set PATH $PATH:/opt/homebrew/bin
end

# Start zoxide and starship
zoxide init fish | source
starship init fish | source

# Setup fish bindings
fish_vi_key_bindings
bind -M insert jj 'set fish_bind_mode default; commandline -f backward-char force-repaint'
bind -M insert \cn accept-autosuggestion
bind -M default \cn accept-autosuggestion
set fish_greeting
bind -M default A 'set fish_bind_mode insert; commandline -f end-of-buffer'

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx
  end
end
