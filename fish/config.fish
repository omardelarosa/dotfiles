# NVM
nvm use default --silent --delete-prefix

# Open Fish Config
function getfish
	vim ~/.config/fish/config.fish
end

function setfish
	source ~/.config/fish/config.fish
end

# Adds powerline
function fish_prompt
    powerline-shell --shell bare $status
end

function getvim
	vim ~/.vimrc
end
