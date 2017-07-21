# Clonando repositorios

Update-ExecutionPolicy Unrestricted
Disable-UAC

mkdir C:\Git

cd C:\Git

$url = "https://nibogestao.visualstudio.com/DefaultCollection/NiboProjects"
$username = Read-host -Prompt "Digite seu email:" #exemplo: xxxx@nibo.com.br
$password = Read-host -Prompt "Digite o seu token para baixar os repositorios:" #precisa do token de acesso dos repositorios do visual studio

# Lista todos os repositórios
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))
$headers = @{
    "Authorization" = ("Basic {0}" -f $base64AuthInfo)
    "Accept" = "application/json"
}

Add-Type -AssemblyName System.Web
$gitcred = ("{0}:{1}" -f  [System.Web.HttpUtility]::UrlEncode($username),$password)

$resp = Invoke-WebRequest -Headers $headers -Uri ("{0}/_apis/git/repositories?api-version=1.0" -f $url)
$json = convertFrom-JSON $resp.Content

# Clona todos os repositórios que o usuário tem permissão
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
