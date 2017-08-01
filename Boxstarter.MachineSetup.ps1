#Boxstarter script ambiente dev


################## Permite reiniciar #########################################################
$Boxstarter.RebootOk=$true # Quer reiniciar?
$Boxstarter.NoPassword=$false # A máquina não tem senha no usuario?
$Boxstarter.AutoLogin=$true # Quer que o boxstarter coloque usuario e senha automaticamente?
##############################################################################################

Write-Host "Executando regras basicas..."

######### Regras básicas ###############################################################################################################################################################################################################
Update-ExecutionPolicy Unrestricted
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-BingSearch
Disable-UAC
########################################################################################################################################################################################################################################

Write-Host "Colocando imagem no plano de fundo do usuario..."

###################### Colocar imagem no plano de fundo do usuário #############################################
$wallpaperUrl = "https://raw.githubusercontent.com/nibodev/machineSetup/master/Nibo-Wallpaper-1366x768.png"
$wallpaperFile = "$env:USERPROFILE\Nibo-Wallpaper-1366x768.png"
Invoke-WebRequest $wallpaperUrl -OutFile $wallpaperFile
#Set-ItemProperty -path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture" -name UserImage -Value $wallpaperfile
#New-Item -path "HKLM:SOFTWARE\Policies\Microsoft\Windows" -name Personalization -force
#Set-ItemProperty -path "HKLM:SOFTWARE\Policies\Microsoft\Windows\Personalization" -name LockScreenImage -value $wallpaperfile
Set-ItemProperty -path "HKCU:Control Panel\Desktop" -name Wallpaper -value $wallpaperFile
#############################################################################################################################

Write-Host "Removendo atalho do Boxstarter..."

############## Removendo atalho do Boxstarter ############
Remove-Item C:\Users\Public\Desktop\Boxstarter*.lnk -Force
###########################################################

Write-Host "Adicionando arquivo Hosts..."

################ Adicionando arquivo Hosts ####################################
$hosts = "https://raw.githubusercontent.com/nibodev/machineSetup/master/hosts"
$hostsFile = "C:\Windows\System32\drivers\etc\hosts"
Invoke-WebRequest $hosts -OutFile $hostsFile
###############################################################################

Write-Host "Instalando Visual Studio 2017 Community..."

######## Instalar Visual Studio 2017 Community #############
cinst visualstudio2017community --package-parameters "--locale en-US"
cinst visualstudio2017-workload-netweb
cinst visualstudio2017-workload-netcoretools
############################################################

if (Test-PendingReboot) { Invoke-Reboot }

Write-Host "Instalando Dev Tools..."

############## Dev Tools ######################
cinst nuget.commandline
cinst NugetPackageExplorer
cinst notepadplusplus.install
cinst nodejs.install
cinst ruby
cinst git
cinst gulp-cli
cinst bower
cinst visualstudiocode
cinst redis-64
cinst postman
cinst cmder
cinst sql-server-express
cinst sql-server-management-studio
cinst dotnetcore-runtime --pre
################################################

#### Refresh nas variáveis de ambiente ####
RefreshEnv.cmd
###########################################

if (Test-PendingReboot) { Invoke-Reboot }

Write-Host "Adicionando variaveis de ambiente..."

########### Adicionando variavel de ambiente $env:nomedavariavel = $env:nomedavariavel + "caminho da variavel ##############
$env:Path = $env:Path + ";C:\Ruby23-x64\bin;C:\Program Files (x86)\Microsoft VS Code\bin;C:\Users\Nibo\AppData\Roaming\npm"
############################################################################################################################

#### Refresh nas variáveis de ambiente ####
RefreshEnv.cmd
###########################################

Write-Host "Instalando apps essenciais..."

####### Apps Essenciais ############
#cinst zoiper --version 3.9
cinst googlechrome
cinst skype
cinst slack
cinst spotify
##################################

Write-Host "Adicionando atalho do Visual Studio..."

######################## Atalho Visual Studio ##############################################################
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Visual Studio 2017 Community.lnk")
$Shortcut.TargetPath = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe"
$Shortcut.Save()
############################################################################################################

Write-Host "Adicionando atalho do SQL Server 2014 Management Studio..."

########################### Atalho SQL Server ##############################################################
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\SQL Server 2014 Management Studio.lnk")
$Shortcut.TargetPath = "C:\Program Files (x86)\Microsoft SQL Server\140\Tools\Binn\ManagementStudio\Ssms.exe"
$Shortcut.Save()
############################################################################################################

Write-Host "Instalando o IIS..."

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

if (Test-PendingReboot) { Invoke-Reboot }

refreshend.cmd

Write-Host "Habilitando o Asp.Net no IIS..."

########### Habilitando o Asp.net no IIS ##################
dism /online /enable-feature /featurename:IIS-ASPNET45 /all
###########################################################

Write-Host "Instalando DotNet 4.0..."

 ### Instalando Dotnet 4.0 ###
cinst DotNet4.0
##############################

Write-Host "Instalando DotNet 4.5..."

 ### Instalando Dotnet 4.5 ###
cinst DotNet4.5
##############################

if (Test-PendingReboot) { Invoke-Reboot }

refreshenv.cmd

Write-Host "Importando os XML's dos Sites e AppPools pro IIS..."

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

Write-Host "Clonando repositorios..."

############################ Clonando repositórios #####################################################################################

mkdir C:\Git\NiboProjects
cd C:\Git\NiboProjects

$url = "https://nibogestao.visualstudio.com/DefaultCollection/NiboProjects"

Write-Host "Se você já está com o email e token para baixar os repositórios, pressione `"Enter`" para continuar"
do
{
$key = [Console]::ReadKey("noecho")
}
while($key.Key -ne "Enter")
Write-Host "Continuando o script.."

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

Write-Host "Iniciando restore nas databases..."

########################### Restore nos dois Bancos de Dados SQL ################################################
# Pegando a instância do SQL Server
$sqlName= "localhost\SQLExpress"
 
# Definindo nome da Database
$dbname= "Nibo"
$dbname2= "NiboHangFire"
 
# Armazenando na variavel o caminho do arquivo de backup
$backupPath= "C:\Git\NiboProjects\Nibo\db\backups\nibo_latest.bak"
$backupPath2= "C:\Git\NiboProjects\Nibo\db\backups\niboHangfire_latest.bak"
 
# Lendo as assemblies necessárias SMO e SmoExtended
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
 
# Conectando no SQL Server
$sqlServer = New-Object ('Microsoft.SqlServer.Management.Smo.Server') $sqlName
 
# Criando instância do objeto SMo Restore
$dbRestore = new-object ("Microsoft.SqlServer.Management.Smo.Restore")
$dbRestore2 = new-object ("Microsoft.SqlServer.Management.Smo.Restore")
 
# Definindo a Database e caminho do backup
$dbRestore.Database = $dbname
$dbRestore2.Database = $dbname2
$dbRestore.Devices.AddDevice($backupPath, "File")
$dbRestore2.Devices.AddDevice($backupPath2, "File")
 
# Definindo o local do arquivo
$dbRestoreFile = new-object("Microsoft.SqlServer.Management.Smo.RelocateFile")
$dbRestoreFile2 = new-object("Microsoft.SqlServer.Management.Smo.RelocateFile")
$dbRestoreLog = new-object("Microsoft.SqlServer.Management.Smo.RelocateFile")
$dbRestoreLog2 = new-object("Microsoft.SqlServer.Management.Smo.RelocateFile")
$dbRestoreFile.LogicalFileName = $dbname
$dbRestoreFile2.LogicalFileName = $dbname2
$dbRestoreFile.PhysicalFileName = $sqlServer.Information.MasterDBPath + "\" + $dbRestore.Database + "_Data.mdf"
$dbRestoreFile2.PhysicalFileName = $sqlServer.Information.MasterDBPath + "\" + $dbRestore2.Database + "_Data.mdf"
$dbRestoreLog.LogicalFileName = $dbname + "_Log"
$dbRestoreLog2.LogicalFileName = $dbname2 + "_Log"
$dbRestoreLog.PhysicalFileName = $sqlServer.Information.MasterDBLogPath + "\" + $dbRestore.Database + "_Log.ldf"
$dbRestoreLog2.PhysicalFileName = $sqlServer.Information.MasterDBLogPath + "\" + $dbRestore2.Database + "_Log.ldf"
$dbRestore.RelocateFiles.Add($dbRestoreFile)
$dbRestore2.RelocateFiles.Add($dbRestoreFile2)
$dbRestore.RelocateFiles.Add($dbRestoreLog)
$dbRestore2.RelocateFiles.Add($dbRestoreLog2)
 
# Chamando o método SqlRestore para completar a restauração da database 
$dbRestore.SqlRestore($sqlServer)
$dbRestore2.SqlRestore($sqlServer)
 
Write-Host "Bancos de Dados "$dbname e $dbname2" restaurados com sucesso!"
########################################################################################################################

Write-Host "Adicionando URL original no repositorio git para o Visual Studio identificar..."

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

Write-Host "Executando restore e build nas solutions..."

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

