if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
# set -g fish_color_valid_path --underline
# set -g fish_color_valid_path 

# pyenv
if set -q SHLVL; and test $SHLVL -eq 1
    eval "$(/opt/homebrew/bin/brew shellenv)"
    pyenv init - | source
end

. ~/app/google-cloud-sdk/path.fish.inc


# fish_add_path /usr/local/bin
# fish_add_path /usr/local/texlive/2023/bin/universal-darwin
# fish_add_path /usr/local/texlive/


. ~/.secrete.fish
