Update-ExecutionPolicy Unrestricted

Disable-UAC

$importsite = "https://raw.githubusercontent.com/nibodev/machineSetup/master/sites.xml"
#$wallpaperFile = "$env:USERPROFILE\Nibo-Wallpaper-1366x768.png"
Invoke-WebRequest $importsite -OutFile "C:\sites.xml"

gc .\sites.xml | C:\Windows\System32\inetsrv\appcmd.exe add site /in
