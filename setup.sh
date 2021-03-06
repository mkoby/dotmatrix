#!/bin/bash

# Initialize files/folders we want to work with
BASHFOLDER=${HOME}/.bash
VIMRC=${HOME}/.vimrc
GVIMRC=${HOME}/.gvimrc
VIMFOLDER=${HOME}/.vim
BASHRC=${HOME}/.bashrc
BASHPROFILE=${HOME}/.bash_profile
GEMRC=${HOME}/.gemrc
ALIASES=${HOME}/.bash_aliases
PATHS_FILE=${HOME}/.paths
CTAGS_FILE=${HOME}/.ctags
NVMFOLDER=${HOME}/.nvm
ASDFFOLDER=${HOME}/.asdf

# First remove existing files if they exist
echo "UNLINKING/DELETING existing config files"

if [ -h ${BASHFOLDER} ]; then
	echo ".bash is a LINK, unlinking"
	unlink ${BASHFOLDER}
elif [ -f ${BASHFOLDER} ]; then
	echo ".bash is a FOLDER, deleting"
	rm -rf ${BASHFOLDER}
else
	echo "${BASHFOLDER} was not found"
fi

if [ -h ${VIMRC} ]; then
	echo ".vimrc is a LINK, unlinking"
	unlink ${VIMRC}
elif [ -f ${VIMRC} ]; then
	echo ".vimrc is a FILE, deleting"
	rm -f ${VIMRC}
else
	echo "${VIMRC} was not found"
fi

if [ -h ${VIMFOLDER} ]; then
	echo ".vim is a LINK, unlinking"
	unlink ${VIMFOLDER}
elif [ -f ${VIMFOLDER} ]; then
	echo ".vim is a FOLDER, deleting"
	rm -rf ${VIMFOLDER}
else
	echo "${VIMFOLDER} was not found"
fi

if [ -h ${BASHRC} ]; then
	echo ".bashrc is a LINK, unlinking"
	unlink ${BASHRC}
elif [ -f ${BASHRC} ]; then
	echo ".bashrc is a FILE, deleting"
	rm -f ${BASHRC}
else
	echo "${BASHRC} was not found"
fi

if [ -h ${BASHPROFILE} ]; then
	echo ".bash_profile is a LINK, unlinking"
	unlink ${BASHPROFILE}
elif [ -f ${BASHPROFILE} ]; then
	echo ".bash_profile is a FILE, deleting"
	rm -f ${BASHPROFILE}
else
	echo "${BASHPROFILE} was not found"
fi

if [ -h ${GEMRC} ]; then
	echo ".gemrc is a LINK, unlinking"
	unlink ${GEMRC}
elif [ -f ${GEMRC} ]; then
	echo ".gemrc is a FILE, deleting"
	rm -f ${GEMRC}
else
	echo "${GEMRC} was not found"
fi

if [ -h ${ALIASES} ]; then
	echo ".bash_aliases is a LINK, unlinking"
	unlink ${ALIASES}
elif [ -f ${ALIASES} ]; then
	echo ".bash_aliases is a FILE, deleting"
	rm -f ${ALIASES}
else
	echo "${ALIASES} was not found"
fi

if [ -h ${PATHS_FILE} ]; then
	echo ".paths is a LINK, unlinking"
	unlink ${PATHS_FILE}
elif [ -f ${PATHS_FILE} ]; then
	echo ".paths is a FILE, deleting"
	rm -f ${PATHS_FILE}
else
	echo "${PATHS_FILE} was not found"
fi

if [ -h ${CTAGS_FILE} ]; then
	echo ".ctags is a LINK, unlinking"
	unlink ${CTAGS_FILE}
elif [ -f ${CTAGS_FILE} ]; then
	echo ".ctags is a FILE, deleting"
	rm -f ${CTAGS_FILE}
else
	echo "${CTAGS_FILE} was not found"
fi

#Create symbolic links to these files
echo "Linking config files to home directory"

echo "Linking .vim folder"
ln -s `pwd`/bash $BASHFOLDER

echo "Linking .vimrc file"
ln -s `pwd`/vimrc $VIMRC

echo "Linking .vim folder"
ln -s `pwd`/vim $VIMFOLDER

echo "Linking .bashrc file"
ln -s `pwd`/bashrc $BASHRC

echo "Linking .bash_profile file"
ln -s `pwd`/bash_profile $BASHPROFILE

echo "Linking .gemrc file"
ln -s `pwd`/gemrc $GEMRC

echo "Linking .bash_aliases file"
ln -s `pwd`/bash/aliases.bash $ALIASES

echo "Linking .paths file"
ln -s `pwd`/paths $PATHS_FILE

echo "Linking .ctags file"
ln -s `pwd`/ctags $CTAGS_FILE

# Create git aliases
echo "Creating commonly used git aliases"
git config --global alias.undo 'reset --soft HEAD^'
git config --global alias.l "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset' --abbrev-commit"
git config --global alias.update '!sh -c "git pull --rebase origin `git symbolic-ref --short -q HEAD`; git fetch origin -p"'
git config --global alias.s '!git status; git submodule status'
git config --global alias.com 'checkout master'
git config --global alias.po '!git push -u origin `git symbolic-ref --short -q HEAD`'

if [ ! -d $NVMFOLDER ]; then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  echo "  Sourcing NVM files"
  echo "    Source NVM.sh"
  [[ -f ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh

  echo "    Source NVM completions"
  [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

if [ -d $ASDFFOLDER ]; then
  echo "Installing ASDF"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.7

  echo "  Sourcing ASDF files"
  echo "    Source asdf.sh"
  . $ASDFFOLDER/.asdf/asdf.sh

  echo "    Source ASDF completions"
  . $HOME/.asdf/completions/asdf.bash

  echo "  Adding Erlang plugin"
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

  echo "  Adding Elixir plugin"
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

  echo "  Adding Node.js plugin"
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

  echo "  -- NOTE: You may want to import node team keyring, after gpg is installed"
  echo "\n           bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring"
fi
