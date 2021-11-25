$branches = git branch
$current_branch = &git rev-parse --abbrev-ref HEAD
foreach ($br in $branches){
    $br = $br.Trim()
    if ($br -ne "master") { # if branch not master and not current_branch\
        echo $br
        git branch -d $br # delete branch
    }
}