#!/bin/bash

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

ln -s $PWD/.colors $HOME/.colors
ln -s $PWD/git-prompt.sh $HOME/.git-prompt.sh
ln -s $PWD/.bash_prompt $HOME/.bash_prompt
ln -s $PWD/git-completion.bash $HOME/.git-completion.bash 
ln -s $PWD/.aliases $HOME/.aliases
ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
