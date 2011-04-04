#!/bin/bash

# Initialize files/folders we want to work with
VIMRC=${HOME}/.vimrc
VIMFOLDER=${HOME}/.vim
BASHRC=${HOME}/.bashrc
GEMRC=${HOME}/.gemrc

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

if [ -h ${GEMRC} ]; then
	echo ".gemrc is a LINK, unlinking"
	unlink ${GEMRC}
elif [ -f ${GEMRC} ]; then
	echo ".gemrc is a FILE, deleting"
	rm -f ${GEMRC}
else
	echo "${GEMRC} was not found"
fi


#Create symbolic links to these files

echo "Linking .vimrc file"
ln -s `pwd`/vimrc $VIMRC

echo "Linking .vim folder"
ln -s `pwd`/vim $VIMFOLDER

echo "Linking .bashrc file"
ln -s `pwd`/bashrc $BASHRC

echo "Linking .gemrc file"
ln -s `pwd`/gemrc $GEMRC

