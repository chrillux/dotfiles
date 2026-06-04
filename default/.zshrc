# Must come first — oh-my-zsh plugins (direnv, fzf, etc.) need homebrew tools in PATH
export PATH="/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Plugins: kubectl handles completion + k alias, direnv/fzf/aws handle their hooks
plugins=(git kubectl direnv fzf aws)

# Homebrew completions (kubectx, kubens, etc.) — must be set before oh-my-zsh calls compinit
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

# Source functions first — get_cluster_short must exist before kube-ps1 is configured
source "$HOME/.zsh/functions.zsh"

# kube-ps1 — disabled by default, toggle with kubeon/kubeoff
KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_ENABLED=off
source "/opt/homebrew/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'"$PROMPT"

source "$HOME/.zsh/path.zsh"
source "$HOME/.zsh/env.zsh"
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/completions.zsh"
source "$HOME/.zsh/tools.zsh"  # SDKMAN must be last — do not add PATH entries after this
