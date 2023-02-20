# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(
#	git
#	git-flow-completion 
#	docker 
#	docker-compose 
#	npm 
#)

# User configuration
if [ -f /usr/bin/micro ]
then
    export EDITOR=/usr/bin/micro
    export MICRO_CONFIG_HOME=~/dotfiles/micro
fi

source $HOME/.bash_aliases
if [ -f $HOME/.bash_aliases.local ]
then
    source $HOME/.bash_aliases.local
fi

#HISTSIZE=1000
#SAVEHIST=1000
#HISTFILE=~/.zsh_history

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Github's hub command: https://github.com/github/hub: brew install hub
#eval "$(hub alias -s)"
# Fix the slowness of zsh prompt, by removing the git status stuff that slows it down...
#https://gist.github.com/msabramo/2355834
function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

if [ -f ~/dotfiles/functions.sh ]; then
    . ~/dotfiles/functions.sh
fi

# Antigen: cd ~ && git clone https://github.com/zsh-users/antigen.git .antigen 
source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle archlinux    
antigen bundle systemd    
antigen bundle ufw    
antigen bundle lol    
antigen bundle sudo    
antigen bundle git    
antigen bundle git-flow-completion    
antigen bundle aliases    
antigen bundle history    
antigen bundle ripgrep    
antigen bundle autoenv    
antigen bundle colored-man-pages    
antigen bundle command-not-found    
antigen bundle compleat    
antigen bundle copypath    
antigen bundle cp    
# antigen bundle fzf
antigen bundle dircycle    
antigen bundle encode64    
antigen bundle extract    
antigen bundle genpass    
# antigen bundle per-directory-history
antigen bundle docker
antigen bundle docker-compose
antigen bundle npm
antigen bundle nvm
antigen bundle yarn
antigen bundle mvn
antigen bundle gradle
antigen bundle jira
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle arialdomartini/oh-my-git
# antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
#antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
antigen apply
# use antigen update to update it all

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# # NVM
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier typescript npm yarn node npx
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' silent-autoload yes
zstyle ':omz:plugins:yarn' global-path no
# # see https://github.com/nvm-sh/nvm#installing-and-updating
# if [ -f /usr/share/nvm/init-nvm.sh ]; then
    # source /usr/share/nvm/init-nvm.sh
# fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
