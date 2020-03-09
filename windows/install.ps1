#Install Scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

#Install Powershell 7
Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) }"

#Install Chocolately
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco install powershell-core -y

choco install git.install -y

cinst cmder -y

git clone https://github.com/powerline/fonts.git
cd fonts
.\install.ps1

cd ..

Install-Module -Name 'posh-git'
Install-Module -Name 'oh-my-posh'

#https://gist.github.com/jchandra74/5b0c94385175c7a8d1cb39bc5157365e
# Go to profile $Profile and change it
Import-Module 'posh-git'
Import-Module 'oh-my-posh'
Set-Theme agnoster

$ThemeSettings


<#
 Go to CurrentThemeLocation and Change to user name to ""(empty)
 if (Test-NotDefaultUser($user)) {
        $prompt += Write-Prompt -Object "" -ForegroundColor $sl.Colors.SessionInfoForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    }
#>
