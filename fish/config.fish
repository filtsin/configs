set PATH /home/filtsin/.local/bin /home/filtsin/.cargo/bin/ /opt/clang-format-static $PATH
export LANG="en_US.UTF-8"
export LC_ALL="C"
export EDITOR=nvim
export VISUAL=nvim

alias ls="lsd"
alias cat="bat"
alias grep="rg"

zoxide init fish | source
fzf_configure_bindings --directory=\cf

starship init fish | source
