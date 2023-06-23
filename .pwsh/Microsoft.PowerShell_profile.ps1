### Oh My Posh
# oh-my-posh initialize

# oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\ebran\Documents\oh-my-posh\themes\agnosterplus.omp.json' | Invoke-Expression


# Invoke-Expression (&starship init powershell)

function update { Invoke-Expression "choco upgrade -y all" }

function gocode ([System.String]$parameter1) { Set-Location "C:\My\Coding\$parameter1" }

function fullhist { Get-Content "C:\Users\ebran\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" }

function choco_packages { choco list --local-only > C:\Users\ebran\Documents\choco\installed_packages.txt | Invoke-Expression }
function runemu { 
			$android_sdk = [Environment]::GetEnvironmentVariable('ANDROID_HOME')
			$avd_name = "Pixel_4a_API_33"
			$command = "$($android_sdk)\emulator\emulator.exe -writable-system -avd $($avd_name)" 
			Invoke-Expression $command
		    }	

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

function route_adb {
	$command = "adb -a -P 5037 nodaemon server" 		
	Invoke-Expression $command
}


# Metro Bundler Forwarding
#iex "netsh interface portproxy delete v4tov4 listenport=8081 listenaddress=127.0.0.1" | out-null;
#$WSL_CLIENT = bash.exe -c "ifconfig eth0 | grep 'inet '";
#$WSL_CLIENT -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';
#$WSL_CLIENT = $matches[0];
#iex "netsh interface portproxy add v4tov4 listenport=8081 listenaddress=127.0.0.1 connectport=8081 connectaddress=$WSL_CLIENT" | out-null;
