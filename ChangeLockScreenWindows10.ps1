Update-ExecutionPolicy Unrestricted
Disable-UAC

$wallpaperUrl = "https://raw.githubusercontent.com/nibodev/machineSetup/master/Nibo-Wallpaper-1366x768.png"
$wallpaperFile = "$env:USERPROFILE\Nibo-Wallpaper-1366x768.png"
Invoke-WebRequest $wallpaperUrl -OutFile $wallpaperFile

Start-Process -filePath "$env:systemroot\system32\takeown.exe" -ArgumentList "/F `"$env:programdata\Microsoft\Windows\SystemData`" /R /A /D Y" -NoNewWindow -Wait
Start-Process -filePath "$env:systemroot\system32\icacls.exe" -ArgumentList "`"$env:programdata\Microsoft\Windows\SystemData`" /grant Administrators:(OI)(CI)F /T" -NoNewWindow -Wait
Start-Process -filePath "$env:systemroot\system32\icacls.exe" -ArgumentList "`"$env:programdata\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly`" /reset /T" -NoNewWindow -Wait
Remove-Item -Path "$env:programdata\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_Z\*" -Force
Start-Process -filePath "$env:systemroot\system32\takeown.exe" -ArgumentList "/F `"$env:systemroot\Web\Screen`" /R /A /D Y" -NoNewWindow -Wait
Start-Process -filePath "$env:systemroot\system32\icacls.exe" -ArgumentList "`"$env:systemroot\Web\Screen`" /grant Administrators:(OI)(CI)F /T" -NoNewWindow -Wait
Start-Process -filePath "$env:systemroot\system32\icacls.exe" -ArgumentList "`"$env:systemroot\Web\Screen`" /reset /T" -NoNewWindow -Wait
Copy-Item -Path "$env:systemroot\Web\Screen\img100.jpg" -Destination "$env:systemroot\Web\Screen\img200.jpg" -Force
Copy-Item -Path "$wallpaperfile" -Destination "$env:systemroot\Web\Screen\img100.jpg" -Force
