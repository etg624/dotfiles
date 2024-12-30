# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# for poetry
export PIPX_HOME=$HOME/.local/pipx
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.tmuxifier/bin:$PATH"
# Add PNPM to PATH if not already present.
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add custom ZSH functions directory to fpath.
fpath+=~/.zfunc
autoload -Uz compinit && compinit -C  # Cached compinit for faster loads.

# Initialize pyenv if available.
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

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

# Load integrations.
_evalcache zoxide init zsh
_evalcache tmuxifier init -
_evalcache direnv hook zsh
source <(fzf --zsh)

# Avoid errors for unmatched globs.
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
