#!/usr/bin/env zsh
# based on fino, nicoulaj, cypher, amuse, ys, frontcube
# 

PROMPT_DEFAULT_END="❯"
PROMPT_ROOT_END="❯❯❯"
PROMPT_GREEN="%{$FG[040]%}"
PROMPT_RED="%{$FG[009]%}" 
PROMPT_YELLOW="%{$FG[226]%}"
PROMPT_BLUE="%{$FG[039]%}"
PROMPT_LIGHT_BLUE="%{$fg[blue]%}"
PROMPT_GREY="%{$FG[243]%}"

prompt_char() {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo "○"
}

host_name() {
    echo "$PROMPT_BLUE${SHORT_HOST:-$HOST}%{$reset_color%}"
}

username() {
   echo "$PROMPT_GREEN%n%{$reset_color%}"
}

directory() {
  echo "$PROMPT_YELLOW%~%{$reset_color%}"
}

exit_code() {
  echo "%(?..%? )"
}

ruby_prompt() {
  echo "${ZSH_THEME_RUBY_PROMPT_PREFIX}$(ruby_prompt_info)${ZSH_THEME_RUBY_PROMPT_SUFFIX}"
}


PROMPT='
╭─$(host_name)::%B$(username)%b %B$(directory)%b  $(git_prompt_info)
╰─$(prompt_char)%{$reset_color%} %(0?.%{$PROMPT_GREEN%}.%{$PROMPT_RED%})%(!.$(exit_code)$PROMPT_ROOT_END.$(exit_code)$PROMPT_DEFAULT_END)%{$FX[no-bold]%}%{$reset_color%} '

RPROMPT='$(ruby_prompt)'


# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$PROMPT_LIGHT_BLUE%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$PROMPT_RED✘✘✘"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$PROMPT_GREEN?"
ZSH_THEME_GIT_PROMPT_CLEAN="$PROMPT_GREEN✔"


# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}^%{$reset_color%}%{$fg_bold[yellow]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ±"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ?"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%} ♥"


# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[git:"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[red]%}✖ %{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}] %{$fg[green]%}✔%{$reset_color%}"


# PROMPT='%{$fg_bold[blue]%}$(git_prompt_info) %F{208}%c%f
# %{$fg_bold[white]%}%# %{$reset_color%}'
# RPROMPT='%B%F{208}%n%f%{$fg_bold[white]%}@%F{039}%m%f%{$reset_color%}'

# ZSH_THEME_GIT_PROMPT_PREFIX="%F{154}±|%f%F{124}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%B✘%b%F{154}|%f%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%F{154}|"


ZSH_THEME_RUBY_PROMPT_PREFIX="$PROMPT_GREY‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"



# spectrum_ls

