# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

#### .NET 3.5 ####

cinst dotnet3.5 -y # Not automatically installed. Includes .NET 2.0. Uses Windows Features to install.
if (Test-PendingReboot) { Invoke-Reboot }

#### WINDOWS SETTTINGS #####

# Basic setup
Update-ExecutionPolicy Unrestricted
Set-ExplorerOptions -showFileExtensions
#Enable-RemoteDesktop
Disable-InternetExplorerESC
#Disable-UAC
#Set-TaskbarSmall

# disable defrag because I have an SSD
Get-ScheduledTask -TaskName *defrag* | Disable-ScheduledTask

################################# POWER SETTINGS #################################

# Turn off hibernation
# powercfg /H OFF

# Change Power saving options (ac=plugged in dc=battery)
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 15
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 30
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 30
powercfg -change -hibernate-timeout-ac 0

################################# SOFTWARE #######################################

#Browsers
cinst googlechrome -y
cinst firefox -y

#Other dev tools
cinst fiddler4 -y
cinst nodejs.install -y
choco install gitextensions -y
choco install kdiff3 -y
choco install docker -y
choco install visualstudio2015enterprise -y
choco install webpi -y
choco install resharper-platform -y
choco install ilmerge -y
choco install eazfuscator.net -y

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
choco install windows-sdk-10.0 -y
choco install filezilla -y
choco install realvnc -y

cinst Microsoft-Hyper-V-All -source windowsFeatures
cinst IIS-WebServerRole -source windowsfeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }
