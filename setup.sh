#!/bin/bash

# Initialize files/folders we want to work with
VIMRC=${HOME}/.vimrc
GVIMRC=${HOME}/.gvimrc
VIMFOLDER=${HOME}/.vim
BASHRC=${HOME}/.bashrc
BASHPROFILE=${HOME}/.bash_profile
GEMRC=${HOME}/.gemrc
ALIASES=${HOME}/.bash_aliases

# First remove existing files if they exist
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


#Create symbolic links to these files

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
ln -s `pwd`/bash_aliases $ALIASES
