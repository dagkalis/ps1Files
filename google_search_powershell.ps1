$search = ""
$msg = Get-Clipboard
$msg = $msg.split()

foreach ($term in $msg) {
  $search="$search%20$term"
}

ms_edge "http://www.google.com/search?q=$search"