# Script para automatizar a instalação do ambiente Dev.


- Para permitir a instalação do Boxstater e executar o script, abra o Powershell como Administrador. Copie, cole e execute o comando: 

```powershell
Set-ExecutionPolicy Unrestricted
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
$cred = Get-Credential $env:username
Install-BoxstarterPackage -PackageName http://bit.ly/2u5T5vw -Credential $cred
```
- Logo depois de executar o comando, irá aparecer uma confirmação de Alteração da Política de Execução, tecle a letra A e dê Enter:

![Alt text](https://github.com/nibodev/machineSetup/blob/master/Screenshot_2.png?raw=true "Optional Title")

- Antes de iniciar o clone dos repositórios, irá pedir uma autenticação, é necessário preencher com o email e o access token do Visual Studio Team Services.
