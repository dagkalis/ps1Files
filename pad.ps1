$files = Get-ChildItem -Filter $args*  -r | % { $_.Name.Replace( ".ps2","") }
$count = ($files).count
if($count -eq 0)
{
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