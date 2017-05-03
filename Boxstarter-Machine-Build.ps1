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
cinst googlechrome -y
cinst firefox -y

#Office
choco install office365proplus -y
choco install microsoft-teams -y

#Other dev tools
cinst fiddler4 -y
cinst nodejs.install -y
choco install gitextensions -y
choco install kdiff3 -y
choco install docker -y
choco install dotnet-4.6.2 -y
choco install visualstudio2017enterprise -y
choco install visualstudio2017-workload-azure -y
choco install visualstudio2017-workload-manageddesktop -y
choco install visualstudio2017-workload-netcoretools -y
choco install visualstudio2017-workload-netweb -y
choco install sql-server-management-studio -y

choco install webpi -y
choco install resharper-platform -y

#Other essential tools
cinst winrar -y
cinst adobereader -y
cinst skype -y
cinst dropbox -y
cinst windirstat -y
cinst virtualbox -y
choco install jdk8 -y
choco install adobe-creative-cloud -y
choco install keepass -y
choco install visualstudiocode -y
choco install wireshark -y
choco install slack -y
choco install silverlight -y
choco install filezilla -y

cinst Microsoft-Hyper-V-All -source windowsFeatures
cinst IIS-WebServerRole -source windowsfeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }
