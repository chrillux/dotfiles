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

## Neovim setup

After bootstrapping, `~/.config/nvim/init.lua` will be in place. Open Neovim once to trigger automatic plugin installation:

```bash
nvim
```

Plugins are managed by `vim.pack` (built into Neovim 0.12+). Wait for the initial install to complete, then restart nvim. The following CLI tools are also required:

```bash
brew install neovim tree-sitter-cli ripgrep fd lazygit
```

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
