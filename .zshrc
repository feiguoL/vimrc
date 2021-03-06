# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/guofei/.oh-my-zsh"
export LANG=en_US.UTF-8
#export LC_ALL="en_US.UTF-8"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"
DEFAULT_USER=$USER
bindkey "^U" backward-kill-line

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

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
plugins=(
    git
    docker
    kubectl
    github
    ruby
    colored-man-pages
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
    z
    mvn
  )

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
  alias GPO="git config --global http.proxy fq.mioffice.cn:3128 && \
      git config --global https.proxy fq.mioffice.cn:3128 && \
      git config --global http.sslVerify false && \
      git config --global -l"
  alias GPC="git config --global --unset http.proxy;git config --global --unset https.proxy;git config --global --unset http.sslVerify"
  alias vim="nvim"
  alias vi="nvim"
  alias lg="lazygit"
  alias root="sudo su - root"
  #gf command
  alias gf="su - guofei"
  alias gfd="cd /home/guofei && ./docker_exec.sh"
  alias gfdpush='cd /home/guofei && ./push_my_docker_image.sh'
  alias tools='cd /home/work/tools && su work'
  alias kubebuild='kubectl config set-context guofei@c3-k8s/guofei --user guofei --cluster c3-k8s --namespace build-service && kubectl config use-context guofei@c3-k8s/guofei --namespace build-service'
  alias kubelog='kubectl config set-context guofei@c3-k8s/guofei --user guofei --cluster c3-k8s --namespace log && kubectl config use-context guofei@c3-k8s/guofei --namespace log'
  alias gfupload='f(){ fdscli --endpoint=cnbj2m-fds.api.xiaomi.net cp "$@" fds://sonarsoft/gf-soft/;unset -f f; }; f'

# golang
export GOROOT=/home/guofei/9work/go
export GOPATH=/home/guofei/9work/gopath
export GOBIN=$GOPATH/bin
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export GO111MODULE=auto
export GOPROXY=https://goproxy.cn      #国内源
#export GOPROXY=https://goproxy.cn,https://pkgs.d.xiaomi.net/artifactory/api/go/go-virtual      #国内源
export GOPRIVATE="*.xiaomi.com"

# mvn
export M2_HOME=/home/guofei/3package/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin:/home/work/gradle/gradle-6.5.1/bin

# java
export JAVA_HOME=/home/guofei/3package/jdk/jdk8u202-b08
# export JAVA_HOME=/home/guofei/3package/jdk/jdk-11.0.3+7
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/rt.jar

# mongo
export PATH=/home/guofei/3package/3_mongodb-linux-x86_64-4.0.21/bin:$PATH
