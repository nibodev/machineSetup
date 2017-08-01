# Script para automatizar a instalação do ambiente Dev.


- Para permitir a instalação do Boxstater e executar o script, abra o Powershell como Administrador. Copie, cole e execute o comando: 

```powershell
Set-ExecutionPolicy Unrestricted
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Install-BoxstarterPackage -PackageName http://bit.ly/2u5T5vw
```

- Após o script reiniciar pela primeira vez o Windows, ele irá abrir automaticamente e pedir a credencial do usuário, após isso, o script irá autenticar sozinho no sistema quando tiver algum outro reboot.

- Antes de iniciar o clone dos repositórios, irá pedir uma autenticação, é necessário preencher com o email e o access token do Visual Studio Team Services.
