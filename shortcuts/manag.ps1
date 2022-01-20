$host.ui.RawUI.WindowTitle = "Kri-Kri Management"
Set-Location C:\dev\krikri-yard-management
if($args -eq "r"){
	rails s
}