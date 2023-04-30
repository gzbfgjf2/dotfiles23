if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval ~/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# fish_vi_key_bindings

set fzf_fd_opts --hidden -E .git -E .virtualenvs -E .cargo -E .cache -E .fonts -E .steam -E .local/lib -E .local/etc -E .local/state -E .rustup -E .themes -E dotfiles -E node_modules

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/luffyx/google-cloud-sdk/path.fish.inc' ]; . '/home/luffyx/google-cloud-sdk/path.fish.inc'; end

# pyenv
pyenv init - | source
