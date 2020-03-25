# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  osx
  sudo
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# User configuration

# Ensure .bash_profile is loaded
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

autoload -U promptinit; promptinit # prompt support
autoload -Uz compinit; compinit # suggestion support
prompt pure # prompt - pure https://github.com/sindresorhus/pure
