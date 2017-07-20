Update-ExecutionPolicy Unrestricted

Disable-UAC

$importsite = "https://raw.githubusercontent.com/nibodev/machineSetup/master/sites.xml"
$importpools = "https://raw.githubusercontent.com/nibodev/machineSetup/master/apppools.xml"
$sites = "$env:USERPROFILE\sites.xml"
$pools = "$env:USERPROFILE\apppools.xml"
Invoke-WebRequest $importsite -OutFile $sites
Invoke-WebRequest $importpools -OutFile $pools

gc .\sites.xml | C:\Windows\System32\inetsrv\appcmd.exe add site /in

gc .\apppools.xml | C:\Windows\System32\inetsrv\appcmd.exe add apppool /in
