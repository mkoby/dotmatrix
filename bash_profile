export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/android_sdk/sdk/tools:/opt/android_sdk/sdk/platform-tools:/opt/idea/bin:$PATH

if [ -f ~/.bashrc ]; then
        source ~/.bashrc
fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add Android SDK tools
export PATH="/Users/mkoby/Library/Android/sdk/platform-tools:$PATH"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"
export PATH="/usr/local/opt/erlang@21/bin:$PATH"
