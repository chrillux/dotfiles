# kubectl completion + k alias handled by oh-my-zsh kubectl plugin
# aws completion handled by oh-my-zsh aws plugin
# direnv hook handled by oh-my-zsh direnv plugin
# fzf handled by oh-my-zsh fzf plugin

# krew completions come from kubectl's completion system (no separate command needed)

# kaf (Kafka CLI) — use full path to avoid conflict with oh-my-zsh kubectl plugin's
# `kaf` alias (kubectl apply -f). Only load if the binary actually exists.
if [[ -x "$(command -v /opt/homebrew/bin/kaf)" ]]; then
  source <(/opt/homebrew/bin/kaf completion zsh)
fi
