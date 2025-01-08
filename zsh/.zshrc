# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export EDITOR='nvim'
export ZSH="/Users/evanguirino/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
# ZSH plugins.
plugins=(
  git
  zsh-syntax-highlighting
  poetry
  zsh-autosuggestions
  zsh-vi-mode
  evalcache
)

source $ZSH/oh-my-zsh.sh
export PATH="$PATH:$HOME/.local/bin"

# for poetry
export PIPX_HOME=$HOME/.local/pipx
export PATH="$HOME/.tmuxifier/bin:$PATH"
# Add PNPM to PATH if not already present.
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add custom ZSH functions directory to fpath.
fpath+=~/.zfunc
autoload -Uz compinit && compinit


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# sesh
function t() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
# Custom helper function to reset AWS IAM user passwords.
reset_password_for() {
    user="$1"
    random="$(LC_ALL=C tr -dc '[:alnum:]' </dev/urandom | head -c 11)"
    new_pass="${random}+Aa0"
    aws iam update-login-profile \
        --profile dev-mfa \
        --user-name "$user" \
        --password-reset-required \
        --password "$new_pass"
    printf 'new password:   \033[1;36m%s\033[0m\n' "$new_pass"
}
alias reset-password-for="reset_password_for"

export FZF_DEFAULT_OPTS='-m --height 50% --border --layout=reverse'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # fzf initialization

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

alias cd='z'
alias ls="eza --icons=always"
alias cat="bat"

_evalcache zoxide init zsh
_evalcache tmuxifier init -
_evalcache direnv hook zsh
source <(fzf --zsh)

# Avoid errors for unmatched globs.
 source ~/powerlevel10k/powerlevel10k.zsh-theme

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
_evalcache pyenv init - zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/Users/evanguirino/git-fuzzy/bin:$PATH"
