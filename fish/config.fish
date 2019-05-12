# Path to Oh My Fish install.
set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "$HOME/.config/omf"

set fish_plugins fish_user_key_bindings
fish_vi_key_bindings
source $HOME/.config/fish/functions/*

# For compatibility with dumb terminals
# aka emacs terminal
# if test "$TERM"="dumb"
# 	function fish_title; end
# end

# PATH
set -gx PATH $HOME/bin ~/.local/bin $PATH
# set -gx PYTHONPATH $HOME/.local/lib/python2.7/site-packages/
set MANPATH $HOME/.local/share/man/ /usr/local/man/ /usr/local/share/man/ /usr/share/man $MANPATH
set -gx PATH $HOME/.gem/ruby/2.5.0/bin $PATH
set GEM_ROOT $HOME/.gem/ruby/2.5.0/
set -gx PATH $HOME/.local/include/npm-global/bin/ $PATH
set -gx PATH $HOME/.autojump/bin $PATH
set -g TMPDIR $HOME/tmp
set -gx TERM screen-256color

# Load oh-my-fish configuration. AFTER SETTING PATHS
source $OMF_PATH/init.fish

# Other ENV VAR
set -g SHELL "/usr/bin/fish"
set -gx CHEATCOLORS true
set -g EDITOR "nvim"
set -g ALTERNATE_EDITOR emacs
set -g VISUAL "emacsclient -c"
# set -g FZF_DEFAULT_OPTS '--bind alt-[:down,alt-]:up'
set -g TODO_DIR $HOME/.todo
set -g TODO_FILE $TODO_DIR/todo.txt
set -g DONE_FILE $TODO_FILE/done.txt
set -g REPORT_FILE $TODO_DIR/report.txt
set -g XDG_USER_CONFIG_DIR $HOME/.config
set -g XDG_MUSIC_DIR $HOME/Media/Music
set -gx GTAGSLABEL ctags
export TLDR_COLOR_BLANK="white bold"
export TLDR_COLOR_NAME="cyan on_grey"
export TLDR_COLOR_DESCRIPTION="white on_grey"
export TLDR_COLOR_EXAMPLE="green"
export TLDR_COLOR_COMMAND="red bold"
export TLDR_COLOR_PARAMETER="white"
export TLDR_CACHE_ENABLED=1
export TLDR_CACHE_MAX_AGE=720
# set -gx CHEATPATH
# fixing ls colors to ls_colors
eval (dircolors -c $HOME/.dir_colors | sed 's/>&\/dev\/null$//')

# Z
# set -g Z_CMD "j"

# aliases
alias sf="source $HOME/.config/fish/config.fish"
alias ll='ls -l -X'
alias la='ls -A -X'
alias l='ls -CF -X'
alias pd='prevd'
alias nd='nextd'
alias u='sudo aptitude update; sudo aptitude full-upgrade -y; cd $HOME; mr update; npm update -g'
alias i='sudo aptitude install'
alias s='aptitude search'
alias v='vim'
alias sv='sudo vim'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias pdf="evince"
alias h="history"
alias mount="mount | column -t"
alias texlive="tlmgr"
alias meminfo="free -mlt"
alias cpuinfo="lscpu"
alias df="df -H"
alias du="du -ch"
alias sz="du -sh"
alias music="pianobar"
alias rs="redshift -O"
alias rx="redshift -x"
alias t="tree -L 2"
alias rss="newsbeuter"
alias define="sdcv --color"
alias s2e="dict -d fd-spa-eng"
alias e2s="dict -d fd-eng-spa"
alias syn="dict -d moby-thesaurus"
# alias sd="sudo shutdown now"
alias appearance="lxappearance"
# always open gvim in one window
alias gv="gvim --remote"
# for fasd omf functions
alias j="z"
alias jj="zz"
alias o="xdg-open 2>/dev/null"
alias emacskill="emacsclient -e '(kill-emacs)'"
alias emacskillsave="emacsclient -e '(client-save-kill-emacs)'"
alias reddit="rtv"

# Git abbreviation
abbr -a gad "git add"
abbr -a gadu "git add -u"
abbr -a gada "git add -A"
abbr -a gst "git status"
abbr -a gco "git commit"
abbr -a gcom "git commit -m"
abbr -a gcoam "git commit -a -m"
abbr -a glo "git log"
abbr -a gtr "git tree"
abbr -a gch "git checkout"
abbr -a gchf "git checkout -f"
abbr -a gchb "git checkout -b"
abbr -a gpu "git push"
abbr -a gpua "git push --all"
abbr -a gdi "git diff"
abbr -a gbr "git branch"
abbr -a gbra "git branch --all"
abbr -a gme "git merge"
abbr -a gcr "git cherry-pick"
abbr -a gta "git tag"
abbr -a yt "mpsyt"
# git prompt settings
set -g __fish_git_prompt_char_dirtystate '+'
set -g __fish_git_prompt_char_invalidstate 'x'
# TMUX
alias tmux="tmux -2"


# Colorizing Man page
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")
