# Installs chocolatey (choco)

## IN AN ELEVATED SHELL
## Right-click PowerShell -> Run As Administrator

# Install chocolatey
## For more info on chocolatey, see: https://chocolatey.org/docs/getting-started
## For more info on this install approach: https://chocolatey.org/install#individual
###
# WARNING: As said by Chocolatey, themselves:
# "Please inspect https://chocolatey.org/install.ps1 prior to running any of these scripts
# to ensure safety. We already know it's safe, but you should verify the security and contents
# of any script from the internet you are not familiar with. All of these scripts download a
# remote PowerShell script and execute it on your machine. We take security very seriously."
# Learn more about Chocolatey security protocols: https://docs.chocolatey.org/en-us/information/security
###
# Set-ExecutionPolicy RemoteSigned

if (!(Get-Command choco -errorAction SilentlyContinue))
{
    $execPolicy = Get-ExecutionPolicy
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Set-ExecutionPolicy $execPolicy
}

choco upgrade chocolatey -y
choco install defaultapps.config -y
choco upgrade all -y
