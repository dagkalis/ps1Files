$fileToRead = $args[0]
while (!$fileToRead){ $fileToRead = Read-Host "String to search? " }

while(!$stringToSearch){ $stringToSearch = Read-Host "string to search? " }

$countOfLinesBefore = Read-Host "Count of lines before? "
if(!$countOfLinesBefore){ $countOfLinesBefore = 0 }

$countOfLinesAfter = Read-Host "Count of lines after? "
if(!$countOfLinesAfter){ $countOfLinesAfter = 0 }

echo "gc $fileToRead -Encoding UTF8 | Select-String -Pattern $stringToSearch  -Context $countOfLinesBefore, $countOfLinesAfter"

gc $fileToRead -Encoding UTF8 | Select-String -Pattern $stringToSearch  -Context $countOfLinesBefore, $countOfLinesAfter
