if status --is-interactive
  # Path variables for unix
  switch (uname)
    case Linux
      fish_add_path /home/(whoami)/.yarn/bin
      fish_add_path /usr/local/go/bin
      fish_add_path /home/(whoami)/go/bin

    case Darwin
      # Update path for fish
      # Bins are installed using brew for mac os configs
      fish_add_path /opt/homebrew/bin
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
end
