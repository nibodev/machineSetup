
$wallpaperUrl = "https://raw.githubusercontent.com/nibodev/machineSetup/master/Nibo-Wallpaper-1366x768.png"
#$wallpaperFile = "$env:USERPROFILE\Nibo-Wallpaper-1366x768.png"
Invoke-WebRequest $wallpaperUrl -OutFile "C:\sites.xml"
