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
alias cmake=$HOME/local/bin/cmake
PATH=$HOME/local/bin:$HOME/bin:$HOME/local/bin:$HOME/.fuz/bin:$HOME/.fzf/bin:$PATH

export PATH


# Python 
export PYTHONUSERBASE=$HOME/local/python
export WORKON_HOME=$HOME/python_envs

# Go
# GOROOT=/home/ilink/local/go
