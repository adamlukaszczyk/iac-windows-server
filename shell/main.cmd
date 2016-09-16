cscript "%systemdrive%\vagrant\shell\winupdate.vbs"

:: Installing updates required by SQL Studio
cscript "%systemdrive%\vagrant\shell\winupdatespecific.vbs" KB2919442
cscript "%systemdrive%\vagrant\shell\winupdatespecific.vbs" KB2919355

@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\InstallChocolatey.ps1"

@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\InstallPuppet.ps1"
