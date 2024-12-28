# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/evanguirino/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="robbyrussell"
#zsh plugins
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	poetry
	zsh-vi-mode
)
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

source $ZSH/oh-my-zsh.sh
# for poetry
export PATH="$PATH:$HOME/.local/bin"
fpath+=~/.zfunc
autoload -Uz compinit && compinit
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

export CWD=$(pwd)
export PIPX_HOME=$HOME/.local/pipx

alias poortalls="cd ${PORTALS_REPOSITORY}/portals"

__git_files () { 
    _wanted files expl 'local files' _files
}

unsetopt nomatch
# maybe need to unncomment this out if having issues with python envs
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# maybe need to unncomment this out if having issues with node envs

source ~/.nvm/nvm.sh
eval "$(direnv hook zsh)"

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

# pnpm
export PNPM_HOME="/Users/evanguirino/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(zoxide init zsh)"

