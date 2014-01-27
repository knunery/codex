# for brew apps
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# for ruby
export PATH=/usr/local/opt/ruby/bin:$PATH

# turns colors on
export CLICOLOR=1
# color scheme 1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# causes ls to always list all files
alias ls='ls -a'
# change the bash prompt and its colors
export PS1='\[\e[0;31m\]\u\[\e[0m\]:\[\e[0;33m\]\W\[\e[0m\]\$ '
#changes default editor to emacs for things like empty git commits
export EDITOR=emacs

#export JAVA_HOME='/usr/libexec/java_home -v 1.6'

# source the individual machine's .profile file
source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
