# Add lua-fmt to path
export PATH=$PATH:$HOME/node_modules/lua-fmt/dist/bin/
export PATH=$PATH:$HOME/build-tool 
export PATH=$PATH:$HOME/.cargo/bin

# set Default user
DEFAULT_USER=`whoami`

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="arrow"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"
unset PROMPT_COMMAND 

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
        git-prompt
	command-not-found
	copydir
	copyfile
	cp
        dotbare
        zsh-syntax-highlighting
        zsh-autosuggestions
        history-substring-search
)

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

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Add fzf key-bindings and auto-completion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export EDITOR='nvim'
export READER='okular'
alias vim='nvim'

# Functions

mkcdir()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

# Aliases
alias ls="lsd" 
alias l="ls -l" 
alias la="ls -a"
alias lsa="ls -al"
alias lla="ls -la"
alias lt="ls --tree" 

alias z="zoxide"
 
alias plz="sudo" 

# Android connection via go-mtpfs
alias android-connect="go-mtpfs ~/cell/mnt"
alias android-disconnect="fusermount -u ~/cell/mnt" 

prompt_context() {
	if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
	fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^P' fzf-file-widget 


# Check if plug.vim is found, if not install it
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Set caps to excape
setxkbmap -option caps:escape

# alias dotfiles='/usr/bin/git --git-dir /home/david/.dotfiles/ --work-tree=/home/david'
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"

alias db="dotbare"
alias dbst="dotbare status"
alias dba="dotbare add"
alias dbc="dotbare commit"
alias dbp="dotbare push"

# asliases for FZF to use fd instead of find
# Filter for type file (f), also considdered hidden files, exclude build directories
export FZF_DEFAULT_COMMAND='fd --type f --type l --exclude "build" --exclude "_build" --exclude "__pycache__"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Filter for type directory (d)
export FZF_ALT_C_COMMAND="fd --type d . $HOME"

# Cache directory for CPM https://github.com/TheLartians/CPM.cmake
export CPM_SOURCE_CACHE=$HOME/.cache/CPM

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Export from 'clang-format-static-bin' (https://aur.archlinux.org/packages/clang-format-static-bin/)
export PATH="/opt/clang-format-static:$PATH"

# Create completion for lab 
source <(lab completion zsh)

# Add zoxide to shell 
eval "$(zoxide init zsh)"
