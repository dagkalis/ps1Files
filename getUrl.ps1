function getString($forUrl)
{
	#echo "in Fucntion"
	$thunder = "$forUrl".IndexOf("https:",0)
	$thunderstruck = "$forUrl".IndexOf("git",$thunder)
	return "$forUrl".substring($thunder, $thunderstruck - $thunder+3)
	#return $output
}
$outputend = getString($args)
return $outputend
