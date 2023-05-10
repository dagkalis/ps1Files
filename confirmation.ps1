$message = $args[0]
# $confirmation = Read-Host $message
while($true){
    $confirmation = Read-Host $message
    if($confirmation -eq "y"){
        return $true
    }
    if($confirmation -eq 'n'){
        return $false
    }
}