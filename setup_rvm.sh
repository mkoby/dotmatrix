#!/usr/bin/env bash
RVMRC=${HOME}/.rvmrc
PLATFORM="UNKNOWN"
OS=${OSTYPE//[0-9.]/}

function check_platform {
        uname_string=`uname`

        if [[ "$OS" == "linux-gnu" ]]; then
          PLATFORM='LINUX'
        elif [[ "$OS" == "darwin" ]]; then
          PLATFORM='OSX'
        fi
}

function install_or_update_brew {
        if [ -f /usr/local/bin/brew ]; then
          #brew is install so update it and the programs we need
          brew update
          brew upgrade wget git bash-completion
        else
          ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)" #install homebrew
          brew install wget git bash-completion
        fi

}

function install_prerequisites {
#Install the pre-reqs. Right now we only support Ubuntu and OSX.

        if [[ "$PLATFORM" == "LINUX" ]]; then
          sudo apt-get -y install build-essential bison openssl libreadline6 \
          libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev \
          libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf \
          curl git-core subversion
        elif [[ "$PLATFORM" == "OSX" ]]; then
          install_or_update_brew
        fi
}

function install_rvm {
        bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
        #bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
}

function source_rvm {
        source "$HOME/.rvm/scripts/rvm"
}

function install_default_rubies {
        echo "Installing default rubies"
        rvm install 1.9.2,1.8.7
}

function set_default_ruby {
        echo "Set default ruby version to 1.9.2"
        rvm alias create default 1.9.2
}

#remove $HOME/.rvmrc if exists
function remove_rvmrc_file {
  if [ -h ${RVMRC} ]; then
	echo ".rvmrc is a LINK, unlinking"
	unlink ${RVMRC}
  elif [ -f ${RVMRC} ]; then
	echo ".rvmrc is a FILE, deleting"
	rm -f ${RVMRC}
  else
	echo "${RVMRC} was not found"
  fi
}

remove_rvmrc_file
check_platform
install_prerequisites

#Run the RVM set up command
install_rvm
source_rvm

#Install various rubies, I use 1.8.7 & 1.9.2 at the moment
install_default_rubies

#Set default to 1.9.2
set_default_ruby

#Relinks the rvmrc file to it's proper location
remove_rvmrc_file
echo "linking .rvmrc file"
ln -s `pwd`/rvmrc $RVMRC

