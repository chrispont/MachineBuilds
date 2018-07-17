# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

#### WINDOWS SETTTINGS #####

# Basic setup
Update-ExecutionPolicy Unrestricted
Set-ExplorerOptions -showFileExtensions
#Enable-RemoteDesktop
Disable-InternetExplorerESC

################################# SOFTWARE #######################################

#Browsers
choco install googlechrome -y

#Office
choco install office365proplus -y
choco install microsoft-teams -y

#Other dev tools
choco install fiddler4 -y
choco install gitextensions -y
choco install kdiff3 -y
choco install docker -y
choco install dotnet-4.6.2 -y
choco install visualstudio2017enterprise -y
choco install visualstudio2017-workload-azure -y
choco install visualstudio2017-workload-manageddesktop -y
choco install visualstudio2017-workload-netcoretools -y
choco install visualstudio2017-workload-netweb -y

choco install webpi -y
choco install resharper-platform -y
choco install sonos-controller -y

#Other essential tools
choco install jdk8 -y
choco install visualstudiocode -y
choco install silverlight -y
choco install filezilla -y
choco install docker-for-windows -y
choco install rsat -y

choco install IIS-WebServerRole -source windowsfeatures
choco install IIS-HttpCompressionDynamic -source windowsfeatures
choco install IIS-ManagementScriptingTools -source windowsfeatures
choco install IIS-WindowsAuthentication -source windowsfeatures

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }
