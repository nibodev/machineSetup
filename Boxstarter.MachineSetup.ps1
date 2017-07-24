#Boxstarter script ambiente dev


################## Permite reiniciar #########################################################
$Boxstarter.RebootOk=$false # Quer reiniciar?
$Boxstarter.NoPassword=$false # A máquina não tem senha no usuario?
$Boxstarter.AutoLogin=$true # Quer que o boxstarter coloque usuario e senha automaticamente?
##############################################################################################


######### Regras básicas ###############################################################################################################################################################################################################
Update-ExecutionPolicy Unrestricted
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-BingSearch
Disable-UAC
########################################################################################################################################################################################################################################

###################### Colocar imagem no plano de fundo e no profile do usuário #############################################
$wallpaperUrl = "https://raw.githubusercontent.com/nibodev/machineSetup/master/Nibo-Wallpaper-1366x768.png"
$wallpaperFile = "$env:USERPROFILE\Nibo-Wallpaper-1366x768.png"
Invoke-WebRequest $wallpaperUrl -OutFile $wallpaperFile
Set-ItemProperty -path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture" -name UserImage -Value $wallpaperfile
#New-Item -path "HKLM:SOFTWARE\Policies\Microsoft\Windows" -name Personalization -force
#Set-ItemProperty -path "HKLM:SOFTWARE\Policies\Microsoft\Windows\Personalization" -name LockScreenImage -value $wallpaperfile
Set-ItemProperty -path "HKCU:Control Panel\Desktop" -name Wallpaper -value $wallpaperFile
#############################################################################################################################

######## Instalar Visual Studio 2017 Community #############
cinst visualstudio2017community --package-parameters "--locale en-US"
cinst visualstudio2017-workload-netweb
cinst visualstudio2017-workload-netcoretools
############################################################

 ### Instalando Dotnet 4.5 ###
cinst DotNet4.5
##############################

# VS extensions
#Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix
#Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/31/WebEssentials2013.vsix
#Install-ChocolateyVsixPackage T4Toolbox http://visualstudiogallery.msdn.microsoft.com/791817a4-eb9a-4000-9c85-972cc60fd5aa/file/116854/1/T4Toolbox.12.vsix
#Install-ChocolateyVsixPackage StopOnFirstBuildError http://visualstudiogallery.msdn.microsoft.com/91aaa139-5d3c-43a7-b39f-369196a84fa5/file/44205/3/StopOnFirstBuildError.vsix

# AWS Toolkit is now an MSI available here http://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi (no chocolatey package as of FEB 2014)
# Install-ChocolateyVsixPackage AwsToolkit http://visualstudiogallery.msdn.microsoft.com/175787af-a563-4306-957b-686b4ee9b497

############## Dev Tools ######################
cinst NugetPackageExplorer
cinst notepadplusplus.install
cinst nodejs.install
cinst ruby
cinst git
cinst visualstudiocode
cinst postman
cinst cmder
cinst mssqlserver2014express
cinst sql-server-management-studio
cinst dotnetcore-runtime --pre
################################################

#### Refresh nas variáveis de ambiente ####
RefreshEnv.cmd
###########################################


########### Adicionando variavel de ambiente $env:nomedavariavel = $env:nomedavariavel + "caminho da variavel ##############
$env:Path = $env:Path + ";C:\Ruby23-x64\bin;C:\Program Files (x86)\Microsoft VS Code\bin;C:\Users\Nibo\AppData\Roaming\npm"
############################################################################################################################

#### Refresh nas variáveis de ambiente ####
RefreshEnv.cmd
###########################################

####### Apps Essenciais ############
cinst googlechrome
cinst skype
cinst slack
cinst spotify
##################################

# Set Choco options
#cmd.exe /c choco feature enable -n allowGlobalConfirmation
#cmd.exe /c choco feature enable -n allowEmptyChecksums

#Atalho Visual Studio
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Visual Studio 2017 Community.lnk")
$Shortcut.TargetPath = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe"
$Shortcut.Save()

########################## Instalando IIS e seus componentes #####################################
cinst IIS-WebServerRole -source windowsfeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures
cinst IIS-WebServer -source windowsfeatures
cinst IIS-CommonHttpFeatures -source windowsfeatures
cinst IIS-StaticContent -source windowsfeatures
cinst IIS-DefaultDocument -source windowsfeatures
cinst IIS-DirectoryBrowsing -source windowsfeatures
cinst IIS-HttpErrors -source windowsfeatures
cinst IIS-HttpRedirect -source windowsfeatures
cinst IIS-ApplicationDevelopment -source windowsfeatures
cinst IIS-ASP -source windowsfeatures
cinst IIS-CGI -source windowsfeatures
cinst IIS-ISAPIExtensions -source windowsfeatures
cinst IIS-ISAPIFilter -source windowsfeatures
cinst IIS-ServerSideIncludes -source windowsfeatures
cinst IIS-HealthAndDiagnostics -source windowsfeatures
cinst IIS-HttpLogging -source windowsfeatures
cinst IIS-LoggingLibraries -source windowsfeatures
cinst IIS-RequestMonitor -source windowsfeatures
cinst IIS-HttpTracing -source windowsfeatures
cinst IIS-CustomLogging -source windowsfeatures
cinst IIS-ODBCLogging -source windowsfeatures
cinst IIS-Security -source windowsfeatures
cinst IIS-BasicAuthentication -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures
cinst IIS-DigestAuthentication -source windowsfeatures
cinst IIS-ClientCertificateMappingAuthentication -source windowsfeatures
cinst IIS-IISCertificateMappingAuthentication -source windowsfeatures
cinst IIS-URLAuthorization -source windowsfeatures
cinst IIS-RequestFiltering -source windowsfeatures
cinst IIS-IPSecurity -source windowsfeatures
cinst IIS-Performance -source windowsfeatures
cinst IIS-HttpCompressionStatic -source windowsfeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-WebServerManagementTools -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-IIS6ManagementCompatibility -source windowsfeatures
cinst IIS-Metabase -source windowsfeatures
cinst IIS-WMICompatibility -source windowsfeatures
cinst IIS-LegacyScripts -source windowsfeatures
cinst WAS-WindowsActivationService -source windowsfeatures
cinst WAS-ProcessModel -source windowsfeatures
cinst IIS-WebDAV -source windowsfeatures
cinst IIS-ASPNET -source windowsfeatures
cinst IIS-NetFxExtensibility -source windowsfeatures
cinst WAS-NetFxEnvironment -source windowsfeatures
cinst WAS-ConfigurationAPI -source windowsfeatures
cinst IIS-ManagementService -source windowsfeatures
##################################################################################################

############# Importando os XML's dos Sites e AppPools pro IIS #####################################
$importsite = "https://raw.githubusercontent.com/nibodev/machineSetup/master/sites.xml"
$importpools = "https://raw.githubusercontent.com/nibodev/machineSetup/master/apppools.xml"
$sites = "$env:USERPROFILE\sites.xml"
$pools = "$env:USERPROFILE\apppools.xml"
Invoke-WebRequest $importsite -OutFile $sites
Invoke-WebRequest $importpools -OutFile $pools
gc .\sites.xml | C:\Windows\System32\inetsrv\appcmd.exe add site /in
gc .\apppools.xml | C:\Windows\System32\inetsrv\appcmd.exe add apppool /in
####################################################################################################

############################ Clonando repositórios #####################################################################################

mkdir C:\Git
cd C:\Git

$url = "https://nibogestao.visualstudio.com/DefaultCollection/NiboProjects"
$username = Read-host -Prompt "Digite seu email:" #exemplo: xxxx@nibo.com.br
$password = Read-host -Prompt "Digite o seu token para baixar os repositorios:" #precisa do token de acesso dos repositorios do visual studio

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))
$headers = @{
    "Authorization" = ("Basic {0}" -f $base64AuthInfo)
    "Accept" = "application/json"
}

Add-Type -AssemblyName System.Web
$gitcred = ("{0}:{1}" -f  [System.Web.HttpUtility]::UrlEncode($username),$password)

$resp = Invoke-WebRequest -Headers $headers -Uri ("{0}/_apis/git/repositories?api-version=1.0" -f $url)
$json = convertFrom-JSON $resp.Content

$initpath = get-location
foreach ($entry in $json.value) { 
    $name = $entry.name 
    Write-Host $name

    $url = $entry.remoteUrl -replace "://", ("://{0}@" -f $gitcred)
    if(!(Test-Path -Path $name)) {
        git clone $url
    } else {
        set-location $name
        git pull
        set-location $initpath
    }
}
#######################################################################################################################################

Enable-UAC

if (Test-PendingReboot) { Invoke-Reboot }
