if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
# set -g fish_color_valid_path --underline
# set -g fish_color_valid_path 

# pyenv
# potentially https://www.reddit.com/r/neovim/comments/ga0s7w/use_python_venv_with_neovim/
if set -q SHLVL; and test $SHLVL -eq 1
    if not contains /usr/local/bin $PATH
        set -gx PATH /usr/local/bin $PATH
        # fish_add_path /usr/local/texlive/
    end
    if not contains /usr/local/texlive/2023/bin/universal-darwin $PATH
        set -gx PATH /usr/local/texlive/2023/bin/universal-darwin $PATH
        # fish_add_path /usr/local/texlive/
    end
    if not contains /opt/homebrew/bin $PATH
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end
    if not contains $HOME/.pyenv/bin $PATH
        pyenv init - | source
    end
    # if not contains $HOME/.local/share/nvm/$nvm_default_version/bin $PATH
    #     set -gx PATH $HOME/.local/share/nvm/$nvm_default_version/bin $PATH
    # end
    if not contains $HOME/.local/bin $PATH
        set -gx PATH $HOME/.local/bin $PATH
    end
    if not contains $HOME/.cargo/bin $PATH
        set -gx PATH $HOME/.cargo/bin $PATH
    end
    fish_add_path -m -P $HOME/.local/share/nvm/$nvm_default_version/bin $PATH
    . ~/app/google-cloud-sdk/path.fish.inc
    . ~/.secrete.fish
end

function event_handler --on-event fish_preexec
   # echo "Custom event was triggered with these args: $argv"
   printf \n
   printf \n
end
function post_handler --on-event fish_postexec
   # echo "Custom event was triggered with these args: $argv"
   printf \n
   printf \n
   # set -l line_width (tput cols)
   # printf '%*s\n' $line_width '' | tr ' ' '—'
   printf '———'
   printf \n
   printf \n
end


# fish_add_path /usr/local/bin


