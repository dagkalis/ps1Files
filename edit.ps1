$thunder = Get-ChildItem -Filter $args*  -r | % { $_.Name.Replace( ".ps2","") }
notepad++ "$thunder"
