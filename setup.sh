#!/usr/bin/env bash

# This script is developed on debian based system, for other it needs to be 
# changed accordingly. 
# TODO: need to update for rhel based. Maybe, will do sometime later.

RETVAL=0

# Install dependencies
sudo apt-get install git curl cmake exuberant-ctags -y

# Take backup
if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc_old.bk
fi

# Install new files
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -sSL https://raw.githubusercontent.com/dineshsaini/personal_vim_hacks/master/vimrc -o ~/.vimrc

# Perform changes 
vim +PluginInstall +quitall

# Post update 
pushd . > /dev/null

if ! [ -d ~/.vim/ex_plugins/YouCompleteMe ]; then
	echo '[ERROR]: `YouCompleteMe` is not found try installing it manually.'
	RETVAL=1
else
	cd ~/.vim/ex_plugins/YouCompleteMe/
	python3 install.py --clangd-completer --java-completer  || {
		echo '[ERROR]: `YouCompleteMe` is not found try installing it manually.'
		xdg-open "https://github.com/ycm-core/YouCompleteMe#installation"
		RETVAL=2
	}
fi

popd > /dev/null

if [ $RETVAL -ne 0 ]; then
	exit $RETVAL
fi

# Success Message
echo 'Previous `~/.vimrc` file is backup-ed as `~/.vimrc_old.bk`. If there is any manual/private change[s] then try merging them.'
echo "Done."
