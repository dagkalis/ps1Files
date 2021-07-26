$confirmation = Read-Host "Have you updated app version? [y/n]"
	while($confirmation -ne "y")
	{
		if ($confirmation -eq 'n') {exit}
		$confirmation = Read-Host "Have you updated app version? [y/n]"
	}

# assemble the apk
.\gradlew assembleDebug
echo "after apk is assembled"

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

echo $apiPath

# make the apk path
$source = "app\build\outputs\apk\debug\app-debug.apk"
echo $source

# copy and replace the apk to the api folder
Copy-Item $source -Destination "$apiPath\update.apk" -Recurse -force
