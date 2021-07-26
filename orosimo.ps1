$host.ui.RawUI.WindowTitle = "Orosimo_DB"
Set-Location 'c:\dev\orosimo_db'
if($args -eq "r"){
	rails s
}