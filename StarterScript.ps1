Set-ExecutionPolicy Unrestricted

. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

refreshenv.cmd

Install-BoxstarterPackage -PackageName http://bit.ly/2u5T5vw
