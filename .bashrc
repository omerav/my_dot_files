# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
#
#
export PATH=/home/omer/zulu20.28.85-ca-jdk20.0.0-linux_x64/bin/:/opt/dart-sdk/dart-sdk/bin:/home/omer/.cargo/bin:$PATH
#
#
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
#neofetch
export NIXPKGS_ALLOW_UNFREE=1

session_name="main"

# 1. First you check if a tmux session exists with a given name.
tmux has-session -t=$session_name 2>/dev/null

# 2. Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
	TMUX='' tmux new-session -d -s "$session_name"
fi

# 3. Attach if outside of tmux, switch if you're in tmux.
if [[ -z "$TMUX" ]]; then
	tmux attach -t "$session_name"
else
	tmux switch-client -t "$session_name"
fi

# Created by `pipx` on 2023-05-14 21:59:59
export PATH="$PATH:/home/omer/.local/bin"
. "$HOME/.cargo/env"
