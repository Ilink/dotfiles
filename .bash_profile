# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

check_ssh_add() {
    if ! ssh-add -l >/dev/null; then
        ssh-add
    fi
}


source ~/.colors
source ~/.git-prompt.sh
source ~/.bash_prompt
source ~/.git-completion.bash
source ~/.aliases

export LD_LIBRARY_PATH=$HOME/local/lib64:$HOME/local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$HOME/local/lib64:$HOME/local/lib:$LD_RUN_PATH

# User specific environment and startup programs
# alias cmake=$HOME/local/bin/cmake
PATH=/usr/lib/icecc/bin:$HOME/local/bin:$HOME/bin:$HOME/.fuz/bin:$HOME/.fzf/bin:$PATH

export PATH

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Python 
export PYTHONUSERBASE=$HOME/local/python
export WORKON_HOME=$HOME/python_envs

# Go
# GOROOT=/home/ilink/local/go
export GOPATH=/home/ilink/.go

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

eval $(/home/ilink/.linuxbrew/bin/brew shellenv)
# The above puts linuxbrew (which has gcc) at the front of its path
# Just for simpliciy, we put icecc at the front of the path, rather than
# trying to use the CC/CXX env variables
PATH=/usr/lib/icecc/bin:$PATH

# export CC=/usr/bin/gcc
# export CXX=/usr/bin/g++
