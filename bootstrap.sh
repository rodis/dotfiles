find -type l -exec rm {} \;

declare -a Dotfiles=('.aliases' '.gitconfig' '.config')
for item in "${Dotfiles[@]}"; do
    ln -s .dotfiles/$item $item
done
