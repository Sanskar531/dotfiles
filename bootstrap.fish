switch (uname)
  case Linux
    pacman -Syyu
    pacman -S ansible
  case Darwin
    brew install ansible
end

ansible-playbook -vv -i ./ansible/hosts.ini ./ansible/dotfiles.yml
