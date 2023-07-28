@echo off
title Auto Installer
cd /d "%~dp0"
color a
cls


:: Check if the directory exists
:VISUAL_STUDIO_CHECKER
if exist "%cd%\VisualStudio" (
    goto SUCCESS_EXIST_VISUAL_STUDIO
) else goto FAIL_EXIST_VISUAL_STUDIO

:COMI_AX_PRO_CHECKER
if exist "%cd%\COMI-AX Pro" (
    goto SUCCESS_EXIST_COMI_AX_PRO
) else goto FAIL_EXIST_COMI_AX_PRO

:OCX_CHECKER
if exist "%cd%\OCX" (
    goto SUCCESS_EXIST_OCX
) else goto FAIL_EXIST_OCX

:MITSUBISHI_PLC_CHECKER
if exist "%cd%\Mitubish PLC" (
    goto SUCCESS_EXIST_MITSUBISHI_PLC
) else goto FAIL_EXIST_MITSUBISHI_PLC

:XGEM_CHECKER
if exist "%cd%\[XGem]" (
    goto SUCCESS_EXIST_XGEM
) else goto FAIL_EXIST_XGEM

:MR_CONFIG_CHECKER
if exist "%cd%\MR_Configurator2-1.66U_0603" (
    goto SUCCESS_EXIST_MR_CONFIG_CHECKER
) else goto FAIL_MR_CONFIG_CHECKER

:OMRON_CHECKER
if exist "%cd%\Omron driver" (
    goto SUCCESS_EXIST_OMRON
) else goto FAIL_EXIST_OMRON

:SCANNER_CHECKER
if exist "%cd%\Scanner" (
    goto SUCCESS_SCANNER
) else goto FAIL_SCANNER

:CHECKER_DONE
goto MAIN

::SUCCESS Check
:SUCCESS_EXIST_VISUAL_STUDIO
echo "%cd%\VisualStudio" SUCCESS
goto COMI_AX_PRO_CHECKER

:SUCCESS_EXIST_COMI_AX_PRO
echo "%cd%\COMI-AX Pro" SUCCESS
goto OCX_CHECKER

:SUCCESS_EXIST_OCX
echo "%cd%\OCX" SUCCESS
goto MITSUBISHI_PLC_CHECKER

:SUCCESS_EXIST_MITSUBISHI_PLC
echo "%cd%\MITSUBISHI PLC" SUCCESS
goto XGEM_CHECKER

:SUCCESS_EXIST_XGEM
echo "%cd%\[XGem]" SUCCESS
goto MR_CONFIG_CHECKER

:SUCCESS_EXIST_MR_CONFIG_CHECKER
echo "%cd%\MR_Configurator2-1.66U_0603" SUCCESS
goto OMRON_CHECKER

:SUCCESS_EXIST_OMRON
echo "%cd%\Omron driver" SUCCESS
goto SCANNER_CHECKER

:SUCCESS_SCANNER
echo "%cd%\Omron driver" SUCCESS
goto CHECKER_DONE

:: Fail Check
:FAIL_EXIST_VISUAL_STUDIO
echo Fail to exist "%cd%\VisualStudio"
pause
exit

:FAIL_EXIST_COMI_AX_PRO
echo Fail to exist "%cd%\COMI-AX Pro"
pause
exit

:FAIL_EXIST_OCX
echo Fail to exist "%cd%\OCX"
pause
exit

:FAIL_EXIST_MITSUBISHI_PLC
echo Fail to exist "%cd%\MITSUBISHI PLC"
pause
exit

:FAIL_EXIST_XGEM
echo Fail to exist "%cd%\[XGem]"
pause
exit

:FAIL_MR_CONFIG_CHECKER
echo Fail to exist "%cd%\MR_Configurator2-1.66U_0603"
pause
exit

:FAIL_EXIST_OMRON
echo Fail to exist "%cd%\Omron driver"
pause
exit

:FAIL_SCANNER
echo Fail to exist "%cd%\Scanner"
pause
exit


:: MAIN
:MAIN
::pause
cd /d "%~dp0"
color e
cls

::Dir
echo Dir = "%cd%"

:: Announcer Setting
echo BandiZib, Teamviewer, Anydesk
echo do not require installation procedures.
echo Please install numbers up to down sequentially.

:: Select Menu
echo ==================================================
echo 1. FireWall
echo 2. FastBoot
echo 3. UsbPowerSet
echo ==================================================
echo 4. CHINA NATION
echo 5. KOREA NATION
echo ==================================================
echo 6. Vietnam
echo 7. China
echo 8. Korea
echo 9. Malaysia
echo 10. Thailand
echo ==================================================
echo 11. Visual Studio
echo 12. COMI-AX Pro
echo 13. OCX
echo 14. Mitsubishi PLC
echo 15. XGEM
echo 16. Monitor driver
echo 17. MR Configurator
echo 18. Omron driver
echo 19. Scanner
echo 20. Test sems program
echo 100. Bandi ZIP
echo 101. TeamViewer
echo 102. AnyDesk
echo 200. Exit
echo ==================================================
set /p MAIN_INPUT=" * : "

if "%MAIN_INPUT%"=="1" goto FIRE_WALL
if "%MAIN_INPUT%"=="2" goto FAST_BOOT
if "%MAIN_INPUT%"=="3" goto USB_SET
if "%MAIN_INPUT%"=="4" goto CHINA_NATION
if "%MAIN_INPUT%"=="5" goto KOREA_NATION
if "%MAIN_INPUT%"=="6" goto VIETNAM
if "%MAIN_INPUT%"=="7" goto CHINA
if "%MAIN_INPUT%"=="8" goto KOREA
if "%MAIN_INPUT%"=="9" goto MALAYSIA
if "%MAIN_INPUT%"=="10" goto THAILAND
if "%MAIN_INPUT%"=="11" goto VISUAL_STUDIO
if "%MAIN_INPUT%"=="12" goto COMI_AX_PRO
if "%MAIN_INPUT%"=="13" goto OCX
if "%MAIN_INPUT%"=="14" goto MITSUBISHI_PLC
if "%MAIN_INPUT%"=="15" goto XGEM
if "%MAIN_INPUT%"=="16" goto MONITOR
if "%MAIN_INPUT%"=="17" goto MR_CONFIG
if "%MAIN_INPUT%"=="18" goto OMRON_DRIVER
if "%MAIN_INPUT%"=="19" goto SCANNER
if "%MAIN_INPUT%"=="20" goto TEST_PROGRAME
if "%MAIN_INPUT%"=="100" goto BANDI_ZIP
if "%MAIN_INPUT%"=="101" goto TEAM_VIEWER
if "%MAIN_INPUT%"=="102" goto ANY_DESK
if "%MAIN_INPUT%"=="200" exit
else goto MAIN

:VIETNAM
tzutil /s "SE Asia Standard Time"
goto MAIN

:CHINA
tzutil /s "China Standard Time"
goto MAIN

:KOREA
tzutil /s "Korea Standard Time"
goto MAIN

:MALAYSIA
tzutil /s "Singapore Standard Time"
goto MAIN

:THAILAND
tzutil /s "SE Asia Standard Time"
goto MAIN

:CHINA_NATION
::wmic.exe /namespace:\\root\cimv2 path Win32_OperatingSystem set OSLanguage=0804
echo Set-WinSystemLocale -SystemLocale "zh-CN" > SetLocale.ps1
powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -File SetLocale.ps1
del SetLocale.ps1
goto shutdown -r -f -t 0

:KOREA_NATION
::wmic.exe /namespace:\\root\cimv2 path Win32_OperatingSystem set OSLanguage=0412
echo Set-WinSystemLocale -SystemLocale "ko-KR" > SetLocale.ps1
powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -File SetLocale.ps1
del SetLocale.ps1
goto shutdown -r -f -t 0
goto MAIN

:FIRE_WALL
netsh advfirewall set allprofiles state OFF
goto MAIN

:FAST_BOOT
powercfg /hibernate on
powercfg /h off
powercfg powercfg /fastboot on
goto MAIN

:USB_SET
control powercfg.cpl,,3
goto MAIN

:VISUAL_STUDIO
cls
cd /d "%~dp0\autoInstaller\VisualStudio"
echo %cd%
echo Visual Studio Install
echo ==================================================
echo 1. vs_professional.exe
echo 2. vc_mbcsmfc.exe
echo 3. vcredist
echo 4. Profiler_Setup
echo 0. Go Back to Main
echo 10. restart
echo ==================================================
set /p VISUAL_STUDIO_INPUT= " * : "

if "%VISUAL_STUDIO_INPUT%"=="1" goto VISUAL_STUDIO_FIRST_INSTALL
if "%VISUAL_STUDIO_INPUT%"=="2" goto VISUAL_STUDIO_SECOND_INSTALL
if "%VISUAL_STUDIO_INPUT%"=="3" goto VISUAL_STUDIO_THIRD_INSTALL
if "%VISUAL_STUDIO_INPUT%"=="4" goto VISUAL_STUDIO_FOURTH_INSTALL
if "%VISUAL_STUDIO_INPUT%"=="0" goto MAIN
if "%VISUAL_STUDIO_INPUT%"=="10" shutdown -r -f -t 0
else goto VISUAL_STUDIO

:VISUAL_STUDIO_FIRST_INSTALL
start 1.bat
goto VISUAL_STUDIO

:VISUAL_STUDIO_SECOND_INSTALL
start 2.bat
goto VISUAL_STUDIO

:VISUAL_STUDIO_THIRD_INSTALL
start 3.bat
goto VISUAL_STUDIO

:VISUAL_STUDIO_FOURTH_INSTALL
start 4.bat
goto VISUAL_STUDIO


:COMI_AX_PRO
cd /d "%~dp0\autoInstaller\COMI_AX_PRO"
start COMI.bat
goto MAIN


:OCX
cd /d "%~dp0\autoInstaller\OCX\"
cls
echo %cd%
echo OCX Install
echo ==================================================
echo 1. setuppad12.exe (Hand)
echo 2. imekor.exe
echo 3. ie_ko.exe
echo 4. ActiveThreed setup
echo 5. copy Library
echo 6. Library Set
echo 10. restart
echo 0. Go Back to Main
echo ==================================================
set /p OCX_INPUT= " * : "

if "%OCX_INPUT%"=="1" goto OCX_FIRST_INSTALL
if "%OCX_INPUT%"=="2" goto OCX_SECOND_INSTALL
if "%OCX_INPUT%"=="3" goto OCX_THIRD_INSTALL
if "%OCX_INPUT%"=="4" goto OCX_FOURTH_INSTALL
if "%OCX_INPUT%"=="5" goto OCX_FIFTH_INSTALL
if "%OCX_INPUT%"=="6" goto OCX_SIXTH_INSTALL
if "%OCX_INPUT%"=="0" goto MAIN
if "%OCX_INPUT%"=="10" shutdown -r -f -t 0
else goto OCX

:OCX_FIRST_INSTALL
start 1.bat
goto OCX

:OCX_SECOND_INSTALL
start 2.bat
goto OCX

:OCX_THIRD_INSTALL
start 3.bat
goto OCX

:OCX_FOURTH_INSTALL
start 4.bat
goto OCX

:OCX_FIFTH_INSTALL
start 5.bat
goto OCX

:OCX_SIXTH_INSTALL
start 6.bat
goto OCX


:MITSUBISHI_PLC
cd /d "%~dp0\autoInstaller\MITSUBISHI_PLC"
cls
echo %cd%
echo Mitsubishi PLC Install
echo ==================================================
echo 1. sw4dnc-act-e_12n\EnvMEL setup
echo 2. sw4dnc-act-e_12n setup
echo 10. restart
echo 3. GX-Works2 Install(64BIT)\SW1DNC-GXW2-E1 setup
echo 4. GX-Works update setup
echo 10. restart
echo 0. Go Back to Main
echo ==================================================
set /p MITSUBISHI_PLC_INPUT= " * : "

if "%MITSUBISHI_PLC_INPUT%"=="1" goto MITSUBISHI_PLC_FIRST_INSTALL
if "%MITSUBISHI_PLC_INPUT%"=="2" goto MITSUBISHI_PLC_SECOND_INSTALL
if "%MITSUBISHI_PLC_INPUT%"=="3" goto MITSUBISHI_PLC_THIRD_INSTALL
if "%MITSUBISHI_PLC_INPUT%"=="4" goto MITSUBISHI_PLC_FOURTH_INSTALL
if "%MITSUBISHI_PLC_INPUT%"=="0" goto MAIN
if "%MITSUBISHI_PLC_INPUT%"=="10" shutdown -r -f -t 0
else goto MITSUBISHI_PLC

:MITSUBISHI_PLC_FIRST_INSTALL
start 1.bat
goto MITSUBISHI_PLC

:MITSUBISHI_PLC_SECOND_INSTALL
start 2.bat
goto MITSUBISHI_PLC

:MITSUBISHI_PLC_THIRD_INSTALL
start 3.bat
goto MITSUBISHI_PLC

:MITSUBISHI_PLC_FOURTH_INSTALL
start 4.bat
goto MITSUBISHI_PLC


:XGEM
cd /d "%~dp0\autoInstaller\XGEM"
cls
echo %cd%
echo XGEM Install
echo ==================================================
echo 1. Xgem setup
echo 2. LicenseManager check
echo 0. Go Back to Main
echo ==================================================
set /p XGEM_INPUT= " * : "

if "%XGEM_INPUT%"=="1" goto XGEM_FIRST_INSTALL
if "%XGEM_INPUT%"=="2" goto XGEM_SECOND_INSTALL
if "%XGEM_INPUT%"=="0" goto MAIN
else goto XGEM

:XGEM_FIRST_INSTALL
start 1.bat
goto XGEM

:XGEM_SECOND_INSTALL
start 2.bat
goto XGEM


:MONITOR
cd /d "%~dp0\autoInstaller\MONITOR"
start 1.bat
goto MAIN


:MR_CONFIG
cd /d "%~dp0\autoInstaller\MR_CONFIG"
start 1.bat
goto MAIN


:OMRON_DRIVER
cd /d "%~dp0\autoInstaller\OMRON"
start 1.bat
goto MAIN


:SCANNER
cd /d "%~dp0\autoInstaller\SCANNER"
cls
echo %cd%
echo Scanner Install
echo ==================================================
echo 1. Driver install
echo 2. Program install
echo 3. Directory input
echo 0. Go Back to Main
echo ==================================================
set /p SCANNER_INPUT= " * : "

if "%SCANNER_INPUT%"=="1" goto SCANNER_DRIVER_INSTALL
if "%SCANNER_INPUT%"=="2" goto SCANNER_PROGRAM_INSTALL
if "%SCANNER_INPUT%"=="3" goto SCANNER_DIR
if "%SCANNER_INPUT%"=="0" goto MAIN
else goto SCANNER

:SCANNER_DRIVER_INSTALL
start 1.bat
goto SCANNER

:SCANNER_PROGRAM_INSTALL
start 2.bat
goto SCANNER

:SCANNER_DIR
set "scannerDir=C:\Users\%USERNAME%\Desktop\AutoID Network Navigator"

if not exist "%scannerDir%" (
    mkdir "%scannerDir%"
)

echo scanner dir: %scannerDir%

move "%USERPROFILE%\Desktop\AutoID Network Navigator.lnk" "%scannerDir%\"
move "%USERPROFILE%\Desktop\AutoID Keyboard Wedge.lnk" "%scannerDir%\"
move "%USERPROFILE%\Desktop\AutoID Terminal.lnk" "%scannerDir%\"
move "%USERPROFILE%\Desktop\FileView.lnk" "%scannerDir%\"
move "%USERPROFILE%\Desktop\MultiMonitor.lnk" "%scannerDir%\"
move "%USERPROFILE%\Desktop\SR Design Tool.lnk" "%scannerDir%\"
move "%USERPROFILE%\Desktop\SR Management Tool.lnk" "%scannerDir%\"
goto SCANNER


:TEST_PROGRAME
cd /d "%~dp0"
set "installDir=C:\SI\22036"
set "sourceFile=%cd%\22036_230207_A"

echo installDir: %installDir%
echo sourceFile: %sourceFile%

mkdir "%installDir%"
start %cd%
start %installDir%
goto MAIN


:BANDI_ZIP
cd /d "%~dp0\Bandi"
cls
echo BANDI_ZIP Install
BANDIZIP-SETUP.EXE
goto MAIN

:TEAM_VIEWER
cd /d "%~dp0\autoInstaller"
cls
echo TEAM_VIWER Install
start openTeamviewer.bat
goto MAIN

:ANY_DESK
cls
echo ANY_DESK Install
AnyDesk.exe
goto MAIN