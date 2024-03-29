$confirmation = Read-Host "Have you updated app version (both apk and api)? [y/n]"
	while($confirmation -ne "y")
	{
		if ($confirmation -eq 'n') {exit}
		$confirmation = Read-Host "Have you updated app version? [y/n]"
	}


# change the path momentarily
$oldPath = $env:path
$env:path = "C:\Program Files\Android2\Android Studio\jre\bin\;$env:path"
# assemble the apk
.\gradlew assembleDebug

echo "apk is assembled"

$env:path = $oldPath # set the path to what it was


# get location of the apk and make the apiPath accordingly
$loc = Get-Location
if ( $loc -Match "forel" ){
	$apiPath = "\dev\forel-api\public\apk"
}
if ( $loc -Match "hatz" ){
	$apiPath = "\dev\hatzopoulos_api\public\apk"
}
if ( $loc -Match "mosxos" ){
	$apiPath = "\dev\mosxos-api\public\apk"
}
if ( $loc -Match "greentech" ){
	$apiPath = "C:\dev\greentech_api\public\apk"
}
if ( $loc -Match "tsolakidis" ){
	$apiPath = "C:\dev\tsolakidis_api\public\apk"
}

echo $apiPath

# make the apk path
$source = "app\build\outputs\apk\debug\app-debug.apk"
echo $source

# copy and replace the apk to the api folder
if (!(Test-Path -path $apiPath)) {New-Item $apiPath -Type Directory}
Copy-Item $source -Destination "$apiPath\update.apk" -Recurse -Force
