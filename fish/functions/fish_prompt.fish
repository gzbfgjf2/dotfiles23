function fish_prompt
    # printf \n
    # set_color "#3b3f4c"
    # printf \n
    # printf '───'
    # printf \n
    # printf \n
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    # set_color yellow
    # printf '%s' $USER
    # set_color normal
    # printf '@'
    #
    # set_color magenta
    # echo -n (prompt_hostname)
    # set_color normal
    # printf ': '

    set_color $fish_color_cwd
    printf '%s ' (prompt_pwd)
    set_color normal

    # Line 2
    # echo
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    # printf '↪ '
    # echo
    set_color normal

    printf \n
    printf \n
    printf \n
    set_color $fish_color_cwd
    # printf '%s ' (prompt_pwd)
    # printf '$ '
    # set_color normal
end

# function fish_prompt
#     printf '$ '
# end

