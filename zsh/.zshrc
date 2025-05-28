export EDITOR='nvim'
export VISUAL=$EDITOR
export ZSH="/Users/evanguirino/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="/opt/homebrew/bin:/bin:/usr/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export STARSHIP_LOG_LEVEL="error"


export VISUAL="nvim"
export EDITOR="nvim"

export PIPX_HOME=$HOME/.local/pipx
export PATH="$HOME/.tmuxifier/bin:$PATH"

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR:-${ZSH}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

autoload -Uz compinit
compinit -u -d $ZSH_COMPDUMP


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

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

export FZF_DEFAULT_OPTS='-m --height 50% --border --layout=reverse'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # fzf initialization

alias cd='z'
alias ls="eza --icons=always"
alias cat="bat"
alias tt="taskwarrior-tui"
alias reset-password-for="reset_password_for"

source <(fzf --zsh)
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

function zvm_vi_yank() {
	zvm_yank
	echo ${CUTBUFFER} | pbcopy
	zvm_exit_visual_mode
}

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(tmuxifier init -)"
eval "$(direnv hook zsh)"
eval $(thefuck --alias f)

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load



# Following line was automatically added by arttime installer
export MANPATH=/Users/evanguirino/.local/share/man:$MANPATH

# Following line was automatically added by arttime installer
export MANPATH=/Users/evanguirino/.local/share/man:$MANPATH
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
eval "$(pyenv init - zsh)"
