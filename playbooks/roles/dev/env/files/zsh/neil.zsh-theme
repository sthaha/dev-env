# oh-my-zsh Bureau Theme

NL_BLUE=$FG[117]
NL_DULL_BLUE=$FG[111]
NL_BRIGHT_BLUE=$FG[123]

NL_GREEN=$FG[077]
NL_BRIGHT_GREEN=$FG[156]

NL_ORANGE=$FG[174]

NL_RED=$FG[124]
NL_BRIGHT_RED=$FG[196]

NL_MAGENTA=$FG[133]

NL_DARK_GRAY=$FG[238]
NL_OFFWHITE=$FG[248]

NL_LIGHT_YELLOW=$FG[230]
#PROMPT_VCS_INFO_COLOR=$FG[242]

BBLACK="%{$fg_bold[black]%}"
BBLUE="%{$fg_bold[blue]%}"
BCYAN="%{$fg_bold[cyan]%}"
BGRAY="%{$fg_bold[grey]%}"
BGREEN="%{$fg_bold[green]%}"
BMAGENTA="%{$fg_bold[magenta]%}"
BRED="%{$fg_bold[red]%}"
BWHITE="%{$fg_bold[white]%}"
BYELLOW="%{$fg_bold[yellow]%}"

BLACK="%{$fg_no_bold[black]%}"
BLUE="%{$fg_no_bold[blue]%}"
CYAN="%{$fg_no_bold[cyan]%}"
DEFAULT="%{$fg_no_bold[default]%}"
GRAY="%{$fg_no_bold[grey]%}"
GREEN="%{$fg_no_bold[green]%}"
MAGENTA="%{$fg_no_bold[magenta]%}"
RED="%{$fg_no_bold[red]%}"
WHITE="%{$fg_no_bold[white]%}"
YELLOW="%{$fg_no_bold[yellow]%}"

NL_RST="%{$reset_color%}"

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="${NL_RST}$BGRAY $NL_RST$NL_LIGHT_YELLOW"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_DIRTY="$NL_RST"
ZSH_THEME_GIT_PROMPT_CLEAN="$GREEN✔"

ZSH_THEME_GIT_PROMPT_ADDED="${BYELLOW} ✚"
ZSH_THEME_GIT_PROMPT_DELETED="$NL_BRIGHT_RED ✗"
ZSH_THEME_GIT_PROMPT_MODIFIED="${YELLOW} ✱"

ZSH_THEME_GIT_PROMPT_RENAMED="${BCYAN} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="${YELLOW} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$NL_BRIGHT_BLUE ⚡"

PROMPT_COLOR="${NL_RST}%(?.%(!.$NL_BRIGHT_RED.$NL_BRIGHT_GREEN).$NL_BRIGHT_RED)"
PROMPT='$NL_DULL_BLUE%n${BMAGENTA}•$NL_RST$NL_BLUE%3~ ${PROMPT_COLOR}ᐅ ${NL_RST} '

TIME_COLOR="$NL_RST%(?.%(!.$BRED.$NL_DARK_GRAY).$BRED)"
CLOCK_COLOR="$NL_RST%(?.%(!.$BWHITE.$NL_OFFWHITE).$BWHITE)"
RPROMPT='$(virtualenv_prompt_info)$(git_prompt_info)$(git_prompt_status) $CLOCK_COLOR⌚ $TIME_COLOR%*${NL_RST}$FG[189]'

export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
export GREP_COLOR='1;31'
