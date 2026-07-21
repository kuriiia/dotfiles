if status is-interactive
# Commands to run in interactive sessions can go here
# fastfetch
set fish_greeting

oh-my-posh init fish --config ~/.config/themes/1_shell.omp.json | source
zoxide init fish | source
fzf --fish | source

# Use micro as man pager

set -x MANPAGER "micro"

set -x MANWIDTH 999
end
