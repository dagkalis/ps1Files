$arg = $args[0]
$fileToOpen = ""
# if has arguement exists and arguement is file
if(($null -ne $arg) -And (Test-Path -Path $arg -PathType leaf)){
	$fileToOpen = $arg
}else{
	$fileToOpen = "\notes\pad\$(Get-Date -Format "dd-MM-yyyy_HH-mm").txt"
	if($null -ne $arg){
		echo $arg > $fileToOpen
	}
}
echo $fileToOpen
cd "C:\Program Files\JetBrains\IntelliJ IDEA 2021.2.3\bin"
.\idea64.exe -e $fileToOpen

return;

$files = Get-ChildItem -Filter $args*  -r | % { $_.Name.Replace( ".ps2","") }
$count = ($files).count
if($count -eq 0){
	echo "no such file"
}
elseif($count -gt 1)
{
	echo "choose:"
	#echo $files
	#echo "`n"
	
	
	for($i=0;$i -lt $files.length;$i++){
		echo "$($i+1).$($files[$i])"
	}

	$confirmation = Read-Host "[num]"
	echo $confirmation
	notepad++ $files[$confirmation - 1]
}
else {
	notepad++ "$files"
}