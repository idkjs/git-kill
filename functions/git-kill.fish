#!/usr/bin/env fish

function git-kill
    if not [ $argv[1] ]
        echo "Must provide at least one branch"
        return 1
    else
        for branch in $argv
        # force delete the local branch
            git branch -D $branch
            # get the remote version of the branch and push it your local copy
            for r in (git remote)
                git push $r $branch
            end
        end
    end
end
