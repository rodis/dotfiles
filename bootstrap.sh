find $HOME -maxdepth 1 -type l -exec rm {} \;

declare -a Dotfiles=('.aliases' '.gitconfig' '.config' '.gitmodules' '.vim' '.vimrc')
for item in "${Dotfiles[@]}"; do
    ln -s .dotfiles/$item $item
done
