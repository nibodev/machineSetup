Update-ExecutionPolicy Unrestricted

Disable-UAC

$importsite = "https://raw.githubusercontent.com/nibodev/machineSetup/master/sites.xml"
$importpools = "https://raw.githubusercontent.com/nibodev/machineSetup/master/apppools.xml"
Invoke-WebRequest $importsite -OutFile "C:\Windows\system32\sites.xml"
Invoke-WebRequest $importpools -OutFile "C:\Windows\system32\apppools.xml"

gc .\sites.xml | C:\Windows\System32\inetsrv\appcmd.exe add site /in

gc .\apppools.xml | C:\Windows\System32\inetsrv\appcmd.exe add apppool /in
