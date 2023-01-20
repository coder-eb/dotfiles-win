### Oh My Posh
# oh-my-posh initialize

# oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\ebran\Documents\oh-my-posh\themes\agnosterplus.omp.json' | Invoke-Expression


# Invoke-Expression (&starship init powershell)


function gocode ([System.String]$parameter1) { Set-Location "C:\My\Coding\$parameter1" }

function fullhist { Get-Content "C:\Users\ebran\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" }

function choco_packages { choco list --local-only > C:\Users\ebran\Documents\choco\installed_packages.txt | Invoke-Expression }
<#
function runemu { 
			$android_sdk = [Environment]::GetEnvironmentVariable('ANDROID_HOME')
			$avd_name = "Pixel_4a_API_32"
			$command = "$($android_sdk)\tools\emulator -avd $($avd_name)" 
			Invoke-Expression $command
		    }
#>	

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
