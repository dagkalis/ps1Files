$question = "Have you updated library version? [y/n]"
$confirmation = Read-Host $question
	while($confirmation -ne "y")
	{
		if ($confirmation -eq 'n') {exit}
		$confirmation = Read-Host $question
	}

$oldPath = $env:path
$env:path = "C:\Program Files\Android2\Android Studio\jre\bin\;$env:path"

.\gradlew publish --stacktrace

$env:path = $oldPath # set the path to what it was