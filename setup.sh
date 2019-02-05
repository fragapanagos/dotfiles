#/bin/bash

wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

cat bashrc_git >> ~/.bashrc
