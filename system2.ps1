
$desktopPath = [Environment]::GetFolderPath("Desktop")
cd $desktopPath
echo $env:system2var > "$env:system2var.txt"
echo $env:system2var > "$env:system2var 2.txt"
echo $env:system2var > "$env:system2var 3.txt"