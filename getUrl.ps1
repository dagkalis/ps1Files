function getString($forUrl)
{
	#echo "in Fucntion"
	$thunder = "$forUrl".IndexOf("https:",0)
	$thunderstruck = "$forUrl".IndexOf("remote:",$thunder)
	return "$forUrl".substring($thunder, $thunderstruck - $thunder)
	#return $output
}
$outputend = getString($args)
return $outputend
