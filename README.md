# git-kill

[`git-kill`](https://github.com/peterpme/dotfiles/blob/master/bin/git-kill) wrapper for fish using [bass](https://github.com/edc/bass).


# What does it do

Force deletes the local branch passed to the function the replaces it with the branch from remote.

```bash
function git-kill
    if not [ $argv[1] ]
        echo "Must provide at least one branch"
        return 1
    else
        for branch in $argv
            # force delete the local branch
            git branch -D $branch
            # get the remote version of the branch and push it your local copy
            # ~/D/functions (main) [1]> git remote
            # origin
            # So git push origin/branch local/$branch for every branch on origin
            # basically kills whatever you were doing that is not committed and returns you a clean copy
            for r in (git remote)
                git push $r $branch
            end
        end
    end
end
```

## Installation

Using [fisher](https://github.com/jorgebucaran/fisher)(recommended)

```
fisher install idkjs/git-kill
```

