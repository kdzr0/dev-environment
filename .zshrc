# ZSH CONFIGURATION FILE

# INSTANT PROMPT
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# TMUX
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

# HISTORY
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# PLUGINS
plugins=(git tmux zsh-autopair zsh-autosuggestions fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ALIASES
alias ls="eza --icons"

# PROMPT
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
