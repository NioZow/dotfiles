#############################
# Install powershell script #
#############################

#
#
#
Get-NetConnectionProfile | % { Set-NetConnectionProfile -InterfaceIndex $_.InterfaceIndex -NetworkCategory Private}
winrm quickconfig

#
# change the hostname
#
Rename-Computer -NewName "WIN-MALDEV"
