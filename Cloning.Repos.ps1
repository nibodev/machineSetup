# Clonando repositorios

mkdir C:\Git

cd C:\Git

$url = "https://nibogestao.visualstudio.com/DefaultCollection/NiboProjects"
$username = Read-host "Qual o email?" #exemplo: xxxx@nibo.com.br
$password = Read-host "Qual o token dos repositorios online no visual studio?" #precisa do token de acesso dos repositorios do visual studio

# Retrieve list of all repositories
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))
$headers = @{
    "Authorization" = ("Basic {0}" -f $base64AuthInfo)
    "Accept" = "application/json"
}

Add-Type -AssemblyName System.Web
$gitcred = ("{0}:{1}" -f  [System.Web.HttpUtility]::UrlEncode($username),$password)

$resp = Invoke-WebRequest -Headers $headers -Uri ("{0}/_apis/git/repositories?api-version=1.0" -f $url)
$json = convertFrom-JSON $resp.Content

# Clone or pull all repositories
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
