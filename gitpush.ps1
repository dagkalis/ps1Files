$branch= &git rev-parse --abbrev-ref HEAD
if ($branch -eq "master") {
	echo "you are on master"
} elseif ($null -ne $args[0]){
	echo "branches:"
	git branch
	echo "`n`nCommit message: `n$args`n`n"
	
	$confirmation = Read-Host "commit? [y/n]"
	while($confirmation -ne "y")
	{
		if ($confirmation -eq 'n') {exit}
		$confirmation = Read-Host "Ready? [y/n]"
	}
	git add .
	git commit -m "$args"
	$confirmation = Read-Host "push? [y/n]"
	while($confirmation -ne "y")
	{
		if ($confirmation -eq 'n') {exit}
		$confirmation = Read-Host "Ready? [y/n]"
	}
	git push origin $branch 
} else {
	echo "no commit comment"
}