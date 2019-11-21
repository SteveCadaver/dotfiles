set -g theme_powerline_fonts no

set -g theme_nerd_fonts yes

alias vim="nvim"

function ide
	tmux split-window -v -p 30
	tmux split-window -h -p 66
	tmux split-window -h -p 50
end
