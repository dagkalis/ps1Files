	$pushText = ($args) | Out-String
	$url = getUrl($pushText)
	start $url
