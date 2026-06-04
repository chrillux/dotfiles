# dotfiles

My dotfiles, deployed via rsync.

## Setup

```bash
./bootstrap.sh
```

The bootstrap script rsyncs `default/` to `$HOME`. Optionally pass an environment:

```bash
./bootstrap.sh $HOME work
```

## Zsh setup

After bootstrapping, symlink `.zshrc` (bootstrap doesn't overwrite existing):

```bash
ln -sf ~/.zshrc.bak ~/.zshrc  # if you have an existing one to restore
# or just let the rsync'd default/.zshrc land at ~/.zshrc
```

oh-my-zsh must be installed separately. The following plugins are used (all bundled with oh-my-zsh):
`git`, `kubectl`, `direnv`, `fzf`, `aws`

## Structure

```
default/
  .zshrc               # entry point
  .zsh/
    functions.zsh      # all shell functions
    path.zsh           # PATH entries
    env.zsh            # environment variables + history options
    aliases.zsh        # aliases
    completions.zsh    # krew, kaf completions
    tools.zsh          # nvm, pnpm, orbstack, limactl, lm-studio, sdkman
  .gitconfig
  .vimrc
  .screenrc
  .bashrc.d/           # legacy bash drop-ins (kept for non-zsh machines)
```
