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
	$pushText = (git push origin linkFunctionality 2>&1)
	echo $pushText
	$url = getUrl($pushText)
	echo $url
	start $url
	#comment
	#vcomment
	#vcomment
	 
} else {
	echo "no commit comment"
}