#/bin/bash

wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

cat bashrc_git >> ~/.bashrc

git config --global push.default simple
git config --global core.editor "vim"
git config user.email sam.b.fok@gmail.com
git config user.name "Sam Fok"

ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/vim ~/.vim

ln -s $PWD/tmux.conf ~/.tmux.conf
