switch (uname)
  case Linux
    pacman -Syyu
    pacman -S ansible
  case Darwin
    brew install ansible
end

ansible-playbook -vv -i ./hosts.ini ./dotfiles.yml
