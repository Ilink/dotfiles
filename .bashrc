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
