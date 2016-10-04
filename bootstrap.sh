find $HOME -maxdepth 1 -type l -exec rm {} \;

EXCLUDE='.git liquidprompt ssh-ident bootstrap.sh dotfiles'

for file in `ls -A .dotfiles`; do
    if echo $EXCLUDE | grep -q -v $file; then
        ln -s .dotfiles/$file $file
    fi
done
