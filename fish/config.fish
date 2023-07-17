if status is-interactive
    # Commands to run in interactive sessions can go here
end
eval "$(/opt/homebrew/bin/brew shellenv)"

set -g fish_greeting
# set -g fish_color_valid_path --underline
# set -g fish_color_valid_path 

# pyenv
pyenv init - | source

. ~/app/google-cloud-sdk/path.fish.inc

set -x OPENAI_API_KEY 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

fish_add_path /usr/local/bin

