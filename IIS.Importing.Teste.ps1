Update-ExecutionPolicy Unrestricted

Disable-UAC

############# Importando os XML's dos Sites e AppPools pro IIS #####################################
$importsite = "https://raw.githubusercontent.com/nibodev/machineSetup/master/sites.xml"
$importpools = "https://raw.githubusercontent.com/nibodev/machineSetup/master/apppools.xml"
$sites = "$env:USERPROFILE\sites.xml"
$pools = "$env:USERPROFILE\apppools.xml"
Invoke-WebRequest $importsite -OutFile $sites
Invoke-WebRequest $importpools -OutFile $pools
gc $sites | C:\Windows\System32\inetsrv\appcmd.exe add site /in
gc $pools | C:\Windows\System32\inetsrv\appcmd.exe add apppool /in
####################################################################################################

