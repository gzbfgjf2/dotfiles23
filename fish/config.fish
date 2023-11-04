if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
# set -g fish_color_valid_path --underline
# set -g fish_color_valid_path 

# pyenv
# potentially https://www.reddit.com/r/neovim/comments/ga0s7w/use_python_venv_with_neovim/
if set -q SHLVL; and test $SHLVL -eq 1
    # fish_add_path /opt/homebrew/bin
    eval "$(/opt/homebrew/bin/brew shellenv)"
    pyenv init - | source
    set -gx PATH ~/.local/share/nvm/$nvm_default_version/bin $PATH
end

. ~/app/google-cloud-sdk/path.fish.inc


# fish_add_path /usr/local/bin
# fish_add_path /usr/local/texlive/2023/bin/universal-darwin
# fish_add_path /usr/local/texlive/


. ~/.secrete.fish
