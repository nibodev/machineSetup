#Boxstarter script Dev Environment


# Allow reboots
$Boxstarter.RebootOk=$true
$Boxstarter.NoPassword=$false
$Boxstarter.AutoLogin=$true

# Basic setup
Update-ExecutionPolicy Unrestricted
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-UAC

if (Test-PendingReboot) { Invoke-Reboot }

$wallpaperUrl = "https://raw.githubusercontent.com/nibodev/machineSetup/master/Nibo-Wallpaper-1366x768.png"
$wallpaperFile = "$env:USERPROFILE\i3-wallpaper-4k.png"
Invoke-WebRequest $wallpaperUrl -OutFile $wallpaperFile
#Set-ItemProperty -path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture" -name UserImage -Value $wallpaperfile
Set-ItemProperty -path "HKLM:SOFTWARE\Policies\Microsoft\Windows\Personalization" -name LockScreenImage -value $wallpaperfile
Set-ItemProperty -path "HKCU:Control Panel\Desktop" -name Wallpaper -value $wallpaperFile

# Update Windows and reboot if necessary
#-Install-WindowsUpdate -AcceptEula
#-if (Test-PendingReboot) { Invoke-Reboot }


# Install Visual Studio 2017 Community
cinst visualstudio2017community -InstallArguments WebTools
if (Test-PendingReboot) { Invoke-Reboot }

# Visual Studio SDK required for PoshTools extension
#cinstm VS2013SDK
#if (Test-PendingReboot) { Invoke-Reboot }

cinst DotNet4.5 #Installing DotNet

# VS extensions
#Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix
#Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/31/WebEssentials2013.vsix
#Install-ChocolateyVsixPackage T4Toolbox http://visualstudiogallery.msdn.microsoft.com/791817a4-eb9a-4000-9c85-972cc60fd5aa/file/116854/1/T4Toolbox.12.vsix
#Install-ChocolateyVsixPackage StopOnFirstBuildError http://visualstudiogallery.msdn.microsoft.com/91aaa139-5d3c-43a7-b39f-369196a84fa5/file/44205/3/StopOnFirstBuildError.vsix

# AWS Toolkit is now an MSI available here http://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi (no chocolatey package as of FEB 2014)
# Install-ChocolateyVsixPackage AwsToolkit http://visualstudiogallery.msdn.microsoft.com/175787af-a563-4306-957b-686b4ee9b497

#Dev Tools
cinst NugetPackageExplorer
cinst notepadplusplus.install
cinst nodejs.install
cinst ruby
cinst visualstudiocode
cinst postman
cinst cmder
cinst mssqlservermanagementstudio2014express
cinst sql-server-management-studio
cinst dotnetcore-runtime --pre


#Adicionando variavel de ambiente $env:nomedavariavel = $env:nomedavariavel + "caminho da variavel"
    $env:Path = $env:Path + ";C:\Ruby23-x64\bin;C:\Program Files (x86)\Microsoft VS Code\bin;C:\Users\Nibo\AppData\Roaming\npm"

#Browsers
cinst googlechrome


#Other essential tools
cinst slack
cinst spotify


#Installing IIS
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
cinst IIS-Metabase;IIS-WMICompatibility -source windowsfeatures
cinst IIS-LegacyScripts -source windowsfeatures
cinst WAS-WindowsActivationService -source windowsfeatures
cinst WAS-ProcessModel -source windowsfeatures
cinst IIS-WebDAV -source windowsfeatures
cinst IIS-ASPNET -source windowsfeatures
cinst IIS-NetFxExtensibility -source windowsfeatures
cinst WAS-NetFxEnvironment -source windowsfeatures
cinst WAS-ConfigurationAPI -source windowsfeatures
cinst IIS-ManagementService -source windowsfeatures

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
