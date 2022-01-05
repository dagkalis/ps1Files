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
	$apiPath = "C:\dev\temp\tsolakidis_api\public\apk"
}
if ( $loc -Match "kaloydis" ){
	$apiPath = "C:\Users\gd\Desktop\kaloudis_apk"
}

# make the apk path
$source = "app\build\outputs\apk\debug\app-debug.apk"
$version = .\gradlew -q printVersionCode
$destination = "$apiPath\update_$($version)_.apk"

# copy and replace the apk to the api folder
if (!(Test-Path -path $apiPath)) {New-Item $apiPath -Type Directory} # create folder if does not exist
Remove-Item "$apiPath\*" -Recurse -Force # remove the old apk if exists
Copy-Item $source -Destination $destination -Recurse -Force

echo "created apk: $destination"
