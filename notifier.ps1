$exec = "cd \dev\ps1Files\jars
javaw.exe -p C:\dev\ps1Files\jars\javafx-sdk-17.0.1\lib --add-modules javafx.controls,javafx.fxml -jar .\Notifier.main.jar"

Start-Process powershell -windowstyle hidden $exec