#Boxstarter script ambiente dev


################## Permite reiniciar #########################################################
$Boxstarter.RebootOk=$true # Quer reiniciar?
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

################ Adicionando arquivo Hosts ####################################
$hosts = "https://raw.githubusercontent.com/nibodev/machineSetup/master/hosts"
$hostsFile = "C:\Windows\System32\drivers\etc\hosts"
Invoke-WebRequest $hosts -OutFile $hostsFile
###############################################################################


######## Instalar Visual Studio 2017 Community #############
cinst visualstudio2017community --package-parameters "--locale en-US"
cinst visualstudio2017-workload-netweb
cinst visualstudio2017-workload-netcoretools
############################################################

if (Test-PendingReboot) { Invoke-Reboot }

############## Dev Tools ######################
cinst nuget.commandline
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
cinst zoiper --version 3.9
cinst googlechrome
cinst skype
cinst slack
cinst spotify
##################################


######################## Atalho Visual Studio ##############################################################
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Visual Studio 2017 Community.lnk")
$Shortcut.TargetPath = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe"
$Shortcut.Save()
############################################################################################################


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

########### Habilitando o Asp.net no IIS ##################
dism /online /enable-feature /featurename:IIS-ASPNET45 /all
###########################################################

 ### Instalando Dotnet 4.0 ###
cinst DotNet4.0
##############################

 ### Instalando Dotnet 4.5 ###
cinst DotNet4.5
##############################

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

mkdir C:\Git\NiboProjects
cd C:\Git\NiboProjects

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


########## Colocando a URL original do repositório git para o Visual Studio identificar #############

$folders = Get-ChildItem -Path '.\' -Directory

foreach ($folder in $folders) {
    echo $folder.Name
    cd $folder.Name
    git remote set-url origin https://nibogestao.visualstudio.com/DefaultCollection/NiboProjects/_git/$folder
    cd ..
}
######################################################################################################

cd C:\Git\NiboProjects

####################### Restore e Build nas Solutions - Percorre todas as .sln e executa o restore e depois builda ######################

$folders = Get-ChildItem -Path '.\' -Directory
$baseFolder = "C:\Git\NiboProjects"
$msbuild = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe"
cd $baseFolder

foreach ($folder in $folders) {
    cd $folder.FullName

    if($folder.Name -eq "Nibo" -OR $folder.Name -eq "NiboAuthentication" -OR $folder.Name -eq "NiboImport" -OR $folder.Name -eq "NiboInvoice" -OR $folder.Name -eq "NiboTools") {
       $solutions = Get-ChildItem -Recurse -Filter *.sln
       foreach($solution in $solutions) {
          cd $solution.PSParentPath
          nuget.exe restore $solution
          & $msbuild $solution /t:Rebuild /p:Configuration=Debug /p:Platform="Any CPU"
       }
       
    }

    else {
       $solution = Get-ChildItem -Filter *.sln
       if($solution) {
           nuget.exe restore $solution
           & $msbuild $solution /t:Rebuild /p:Configuration=Debug /p:Platform="Any CPU"
       }
    }
}
cd $baseFolder
########################################################################################################################################



Enable-UAC

