set -g theme_powerline_fonts no

set -g theme_nerd_fonts yes

alias vim="nvim"
alias cc="tcc"

export EDITOR=nvim

#export DISPLAY=192.168.0.187:0

function ide
	tmux split-window -v -p 30
	tmux split-window -h -p 30
end
