# https://www.reddit.com/r/neovim/comments/15gihnd/neat_trick_for_restarting_neovim_fast_when_using/
# function v
#     while not nvim;
#         echo "restarting nvim...";
#     end
# end

function v $argv
    # set -l s -1
    while true;
        nvim $argv;
        set -l s $status;
        # echo exit code: $s
        if test $s -eq 0
            # echo finish nvim
            break
        end
        echo "restarting nvim...";
    end
end
