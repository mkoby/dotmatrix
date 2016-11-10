export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/android_sdk/sdk/tools:/opt/android_sdk/sdk/platform-tools:/opt/idea/bin:$PATH

if [ -f ~/.bashrc ]; then
        source ~/.bashrc
fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
