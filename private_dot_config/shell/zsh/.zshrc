# This is the order of configuration files loading
# System wide files (located in /etc/zsh/) are loaded just before each corresponding local files
# See:
#   - https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell/46856#46856
#   - https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
#
# |-----------|-------------------------------|-------------------------------|
# |   files   |             login             |           non-login           |
# |-----------|-------------|-----------------|-------------|-----------------|
# |           | interactive | non-interactive | interactive | non-interactive |
# |-----------|-------------|-----------------|-------------|-----------------|
# | .zshenv   |      X      |        X        |      X      |        X        |
# | .zprofile |      X      |        X        |      -      |        -        |
# | .zshrc    |      X      |        -        |      X      |        -        |
# | .zlogin   |      X      |        X        |      -      |        -        |
# | .zlogout  |      X      |        X        |      -      |        -        |
# |-----------|-------------|-----------------|-------------|-----------------|

ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell/zsh"