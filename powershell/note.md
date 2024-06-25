Profile types and locations
PowerShell supports several profile files that are scoped to users and PowerShell hosts. You can have any or all these profiles on your computer.

The PowerShell console supports the following basic profile files. These file paths are the default locations.

### All Users, All Hosts
- Windows - $PSHOME\Profile.ps1
- Linux - /opt/microsoft/powershell/7/profile.ps1
- macOS - /usr/local/microsoft/powershell/7/profile.ps1

### All Users, Current Host
- Windows - $PSHOME\Microsoft.PowerShell_profile.ps1
- Linux - /opt/microsoft/powershell/7/Microsoft.PowerShell_profile.ps1
- macOS - /usr/local/microsoft/powershell/7/Microsoft.PowerShell_profile.ps1

### Current User, All Hosts
- Windows - $HOME\Documents\PowerShell\Profile.ps1
- Linux - ~/.config/powershell/profile.ps1
- macOS - ~/.config/powershell/profile.ps1

### Current user, Current Host
- Windows - $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
- Linux - ~/.config/powershell/Microsoft.PowerShell_profile.ps1
- macOS - ~/.config/powershell/Microsoft.PowerShell_profile.ps1
