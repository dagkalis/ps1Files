$thunder = 'http://google.com'.IndexOf("http:",0)
$thunderstruck = 'http://google.com'.IndexOf(".com",$thunder)
$output = 'http://google.com'.Substring($thunder, $thunderstruck + $thunder + 4)
return $output
