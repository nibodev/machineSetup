# Script para automatizar a instalação do ambiente Dev.


- Para permitir a instalação do Boxstater, execute o comando no Powershell: Set-ExecutionPolicy Unrestricted.

- Agora execute o comando também no Powershell para instalar o Boxstarter: . { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

- Após terminar a instalação do Boxstarter, execute o comando no Powershell ou CMD para iniciar o script: Install-BoxstarterPackage -PackgeName bit.ly/2u5T5vw

- Após o script reiniciar pela primeira vez o Windows, ele irá abrir automaticamente e pedir a credencial do usuário, após isso, o script irá autenticar sozinho no sistema quando tiver algum outro reboot.

- Antes de iniciar o clone dos repositórios, irá pedir uma autenticação, é necessário preencher com o email e o access token do Visual Studio Team Services.
