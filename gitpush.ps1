$branch= &git rev-parse --abbrev-ref HEAD
if ($branch -eq "master") {
        echo "you are on master"
} elseif ($null -ne $args[0]){
        echo "`ncurrent branch: $branch"
        echo "`nCommit message: `n$args`n`n"

        $confirmation = Read-Host "commit? [y/n]"
        while($confirmation -ne "y")
        {
                if ($confirmation -eq 'n') {exit}
                $confirmation = Read-Host "commit? [y/n]"
        }
        git add .
        git commit -m "$args"

        $confirmation = Read-Host "`n`npush? [y/n]"
        while($confirmation -ne "y")
        {
                if ($confirmation -eq 'n') {exit}
                $confirmation = Read-Host "push? [y/n]"
        }
        git push origin $branch

        $confirmation = Read-Host "`n`nmerge? [y/n]"
        while($confirmation -ne "y")
        {
                if ($confirmation -eq 'n') {exit}
                $confirmation = Read-Host "merge? [y/n]"
        }
        web # show repo in gitlab or github
} else {
        echo "no commit comment"
}