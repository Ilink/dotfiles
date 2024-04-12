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

export LD_LIBRARY_PATH=/home/linuxbrew/.linuxbrew/opt/libpq/lib:$HOME/local/lib64:$HOME/local/lib:/home/linuxbrew/.linuxbrew/lib:/usr/include/uuid:/usr/include/tcl8.6:$LD_LIBRARY_PATH
export LD_RUN_PATH=$HOME/local/lib64:$HOME/local/lib:/home/linuxbrew/.linuxbrew/lib:$LD_RUN_PATH

# User specific environment and startup programs
# alias cmake=$HOME/local/bin/cmake
PATH=/usr/lib/icecc/bin:$HOME/.cargo/bin:$HOME/local/bin:$HOME/bin:$HOME/.fuz/bin:$HOME/.fzf/bin:$HOME/.linuxbrew/bin:$PATH

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

# export CC=/usr/bin/gcc
# export CXX=/usr/bin/g++
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@15/bin:$PATH"

export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
. "$HOME/.cargo/env"
