# NVM
nvm use default --silent --delete-prefix

# Source variables
source ~/.config/fish/env.fish

# Open Fish Config
function getfish
	vim ~/.config/fish/config.fish
end

function setfish
	source ~/.config/fish/config.fish
end

function getpowerline
	vim ~/.powerline-shell.json
end

function cdcode
    cd ~/Dropbox/Code
end

function dotfiles
    cd ~/Dropbox/Code/Dotfiles
end

function gif
    gifify $argv
end

function gif2
    gifify $argv[1] -o $argv[1].gif --resize $argv[2]:-1
end

# Adds powerline
function fish_prompt
    	powerline-shell --shell bare $status
end

function vim
	nvim $argv
end

function getvim
	nvim ~/.config/nvim/init.vim
end
