# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if ! pgrep -u $USER ssh-agent > /dev/null; then
    echo "Starting ssh-agent"
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    echo "Loading ssh-agent"
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

# if ! pgrep -u $USER fuzd > /dev/null; then
#     fuzd.sh
# fi

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000

# These two help append history when using tmux
# https://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux

# # append history entries
# shopt -s histappend
#
# # After each command, save and reload history
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Fix tab completion with env variables
# fixes this behavior: $ENV_VAR => tab \$ENV_VAR
# so it doesnt add the escape and just tries to do 
# completion as normal
shopt -s direxpand
