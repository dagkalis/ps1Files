$remote_url = git config --get remote.origin.url
if($remote_url -Match "gitlab.com"){
    $end = $remote_url.split(":")[-1] -replace ".git", ""
    start "https://gitlab.com/$end"
}else{
    start $remote_url
}