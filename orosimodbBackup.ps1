$dir = '\orosimodbBackups'
$exportFile = "oro$((get-date).toString("yyyy_MM_dd")).dmp"
$destinations = @('\\192.168.0.20\BackupTEMP\orosimodbBackups')

# create all directories that do not exist
foreach ( $directory in $destinations + @($dir) ){
    if (!(Test-Path -path $directory)) {New-Item $directory -Type Directory}
}

cd $dir
exp orosimodb/orosimodb@oracle12 file=$exportFile # export db to file

# copy files to destinations
foreach ($destination in $destinations){
    cp $exportFile $destination
}

# delete all old files
foreach ( $directory in $destinations + @($dir) ){
    cd $directory
    # get all files of dir, sort them by creating time, keep only the names
    $allFiles = $(Get-ChildItem *.dmp | select Name, CreationTime | sort CreationTime -descending).Name

    # get all except 5 first
    $filesToDelete = $allFiles[0..($allFiles.count - 1)] # all files except last 5

    # delete files
    foreach ($fileToDelete in $filesToDelete){
        rm $fileToDelete
    }
}