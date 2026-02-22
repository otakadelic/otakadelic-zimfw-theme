#
# otakadelic theme
#
#
# name of venv is compatible with uv and -m venv.
#
_prompt_otakadelic_pwd() {

    local venv_name
    if [[ -n "$VIRTUAL_ENV" ]]; then
        local venv_name="${VIRTUAL_ENV:t}"
        if [[ "$venv_name" == ".venv" ]]; then
            venv_name="${VIRTUAL_ENV:h:t}"
        fi
        VENV_PROMPT="%F{magenta}(${venv_name})%f "
    else
        VENV_PROMPT=""
    fi
}
typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:clean' format '%F{green}✓'
  zstyle ':zim:git-info:dirty' format '%F{yellow}✗'
  zstyle ':zim:git-info:keys' format \
      'prompt' ' %F{cyan}%b%c %C%D'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

local user_color="%(!.%B%F{red}.%B%F{blue})"

PS1="%(?..%B%F{red}%? %f%b)${user_color}%n%f%b%B@%b%B%F{yellow}%m%f%b \${VENV_PROMPT}\${vcs_info_msg_0_}%F{green}%# %f"
RPS1="%(?..%B%F{red}:(%f%b )%B%F{yellow}%40<..<%d%<< %f%b"
