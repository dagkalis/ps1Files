$branch= &git rev-parse --abbrev-ref HEAD
if($branch -eq "master" -or $branch -eq "main"){
        if(!(confirmation "push to ${branch}?" )) {exit;}
}

if ($null -eq $args[0]){
        echo "no commit comment"
        exit;
}

echo "`ncurrent branch: $branch"
echo "`nCommit message: `n$args`n`n"

if(!(confirmation "commit? [y/n]" )) {exit;}
git add .
git commit -m "$args"

if(!(confirmation "`n`npush? [y/n]")) {exit;}
git push origin $branch

if(!(confirmation "`n`nmerge? [y/n]")) {exit;}
web # show repo in gitlab or github
