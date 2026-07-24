```bash
# install fish
sudo pacman -S fish
```

## Making fish the default shell

```bash
# Make sure fish is listed in /etc/shells
grep fish /etc/shells

# Set fish as your default shell
chsh -s /usr/bin/fish

# Log out and back in for it to take effect.
# Verify with:
echo $SHELL
```

## Packages

### Official repo

```bash
sudo pacman -S zoxide fzf micro
```

| Package | What it does |
|---------|-------------|
| `zoxide` | Smarter `cd` replacement. Remembers directories you visit and lets you jump to them with `z <partial-name>`. |
| `fzf` | Fuzzy finder. Press `Ctrl+R` to search history, `Ctrl+T` to search files, `Alt+C` to search directories. |
| `micro` | Terminal text editor.Better `nano` , can copy with `Ctrl+C`. |

### Manual install

**oh-my-posh** — prompt theme engine. Not in the Arch repos, so install the binary directly:

installation instructions: https://ohmyposh.dev/docs/installation/linux

This install adds the themes in `~/.cache/oh-my-posh`, make sure to move them to a desired location. 

## Config overview

The entire config lives in a single file: `~/.config/fish/config.fish`.

## What each tool does in the config

| Line | What it does |
|------|-------------|
| `set fish_greeting` | Suppresses the default fish greeting message on startup. |
| `oh-my-posh init fish --config ... \| source` | Initializes oh-my-posh with the `1_shell.omp.json` theme. |
| `zoxide init fish \| source` | Initializes zoxide so you can use `z` to jump to directories. |
| `fzf --fish \| source` | Enables fzf key bindings and completion for fish. |
| `set -x MANPAGER "micro"` | Uses micro as the man page viewer instead of `less`. |
| `set -x MANWIDTH 999` | Sets man page width to 999 columns so lines don't wrap. |

## Changing the prompt theme

Oh-my-posh themes are stored in `~/.config/themes/`. To switch themes, edit
line 6 of `config.fish`:

```fish
oh-my-posh init fish --config ~/.config/themes/<theme-name>.omp.json | source
```

Preview themes before committing:

```fish
oh-my-posh print primary --config ~/.config/themes/<theme-name>.omp.json
```
