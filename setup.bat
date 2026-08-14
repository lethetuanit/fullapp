@echo off
chcp 65001 >nul
title Windows Software Installer
color 0A

:: === LOP BAO VE: Tu khoi dong lai qua "cmd /k" ===
if /I not "%~1"=="RUNNING" (
    start "Windows Software Installer" cmd /k ""%~f0" RUNNING"
    exit /b
)

:: Kiem tra xem winget da duoc cai dat chua
winget --version >nul 2>&1
if errorlevel 1 (
    echo [Loi] Winget chua duoc cai dat tren may nay. Vui long cap nhat tu Microsoft Store.
    pause
    exit /b
)

:MENU
cls
set "choice="
echo ==============================================================================
echo                            WINDOWS SOFTWARE INSTALLER
echo ==============================================================================
echo.
echo  [ TIEN ICH ^& DON DEP HE THONG ]
echo   1. 7-Zip                 2. LocalSend             3. UltraViewer
echo   4. TeraCopy              5. Radmin Server         6. TeamViewer
echo   7. UniKey                8. Recuva                9. Disk Drill
echo  10. Rufus
echo.
echo  [ TRINH DUYET WEB ]
echo  11. Brave Browser        12. Firefox              13. Google Chrome
echo  14. Coc Coc
echo.
echo  [ LAP TRINH ^& DEV TOOLS ]
echo  15. Antigravity          16. Git                  17. Notepad++
echo  18. Postman              19. Python               20. VS Community 2022
echo  21. VS Code              22. Docker Desktop       23. Wireshark
echo.
echo  [ VAN PHONG ^& HOC TAP ]
echo  24. Canva                25. ONLYOFFICE           26. LibreOffice
echo  27. Google Drive         28. Scratch
echo.
echo  [ DA PHUONG TIEN ^& THIET KE ]
echo  29. VLC Media Player     30. OBS Studio           31. DaVinci Resolve
echo  32. Inkscape             33. Krita                34. HandBrake
echo  35. CapCut
echo.
echo  [ GIAO TIEP ^& HOP TRUC TUYEN ]
echo  36. ChatGPT              37. Microsoft Teams      38. Telegram
echo  39. Thunderbird          40. Zoom                 41. Discord
echo.
echo  [ DOC FILE ^& PDF ]
echo  42. Foxit Reader         43. Sumatra PDF
echo.
echo  [ MAY AO ^& GIA LAP ANDROID ]
echo  44. VMware Workstation   45. VirtualBox           46. LDPlayer *
echo  47. NoxPlayer *
echo.
echo  [ MANG XA HOI ^& KHAC ]
echo  48. WeChat               49. Zalo
echo.
echo ==============================================================================
echo  99. CAI DAT TAT CA PHAN MEM (Full)
echo   0. Thoat
echo ==============================================================================
echo  * LDPlayer/NoxPlayer chua co tren winget - script se bao link tai thu cong.
echo  * Co the chon nhieu phan mem cung luc, cach nhau boi dau phay. Vd: 1,2,11,15
set /p choice=Nhap lua chon cua ban: 

if "%choice%"=="" goto MENU
if "%choice%"=="0" exit /b
if "%choice%"=="99" goto ALL

:: Cho phep nhap nhieu so cach nhau boi dau phay (vd: 1,2,4,6)
setlocal EnableDelayedExpansion
set "list=%choice:,= %"
for %%N in (!list!) do (
    call :RESOLVE_PKG "%%N"
    if defined pkg_id (
        echo.
        echo ==================================================
        call :INSTALL_PKG "!pkg_id!" "!pkg_name!" "!pkg_url!"
    ) else (
        echo.
        echo [!] Lua chon khong hop le: %%N
    )
)
endlocal

echo.
echo ==================================================
echo Da xu ly xong danh sach da chon! Nhan phim bat ky de quay lai Menu...
pause >nul
goto MENU


:ALL
cls
echo ==================================================
echo Dang cai dat TAT CA phan mem (Tu 1 den 49). Vui long doi...
echo ==================================================
setlocal EnableDelayedExpansion
for /L %%I in (1, 1, 49) do (
    call :RESOLVE_PKG "%%I"
    if defined pkg_id (
        call :INSTALL_PKG "!pkg_id!" "!pkg_name!" "!pkg_url!"
    )
)
endlocal
echo.
echo ==================================================
echo DA CAI DAT XONG TAT CA PHAN MEM!
echo Nhan phim bat ky de quay lai Menu...
echo ==================================================
pause >nul
goto MENU


:: ==========================================
:: HAM XAC DINH ID/TEN PHAN MEM THEO SO LUA CHON
:: ==========================================
:RESOLVE_PKG
set "pkg_id=" & set "pkg_name=" & set "pkg_url="
if "%~1"=="1" set "pkg_id=7zip.7zip" & set "pkg_name=7-Zip"
if "%~1"=="2" set "pkg_id=LocalSend.LocalSend" & set "pkg_name=LocalSend"
if "%~1"=="3" set "pkg_id=DucFabulous.UltraViewer" & set "pkg_name=UltraViewer"
if "%~1"=="4" set "pkg_id=CodeSector.TeraCopy" & set "pkg_name=TeraCopy"
if "%~1"=="5" set "pkg_id=Famatech.Radmin.Server" & set "pkg_name=Radmin Server"
if "%~1"=="6" set "pkg_id=TeamViewer.TeamViewer" & set "pkg_name=TeamViewer"
if "%~1"=="7" set "pkg_id=XP9KHM4BK9FZ7Q" & set "pkg_name=UniKey"
if "%~1"=="8" set "pkg_id=Piriform.Recuva" & set "pkg_name=Recuva"
if "%~1"=="9" set "pkg_id=CleverFiles.DiskDrill" & set "pkg_name=Disk Drill"
if "%~1"=="10" set "pkg_id=Rufus.Rufus" & set "pkg_name=Rufus"

if "%~1"=="11" set "pkg_id=Brave.Brave" & set "pkg_name=Brave Browser"
if "%~1"=="12" set "pkg_id=Mozilla.Firefox" & set "pkg_name=Firefox"
if "%~1"=="13" set "pkg_id=Google.Chrome" & set "pkg_name=Google Chrome"
if "%~1"=="14" set "pkg_id=CocCoc.CocCoc" & set "pkg_name=Coc Coc"

if "%~1"=="15" set "pkg_id=Antigravity" & set "pkg_name=Antigravity"
if "%~1"=="16" set "pkg_id=Git.Git" & set "pkg_name=Git"
if "%~1"=="17" set "pkg_id=Notepad++.Notepad++" & set "pkg_name=Notepad++"
if "%~1"=="18" set "pkg_id=Postman.Postman" & set "pkg_name=Postman"
if "%~1"=="19" set "pkg_id=Python.Python.3" & set "pkg_name=Python"
if "%~1"=="20" set "pkg_id=Microsoft.VisualStudio.2022.Community" & set "pkg_name=Visual Studio Community 2022"
if "%~1"=="21" set "pkg_id=Microsoft.VisualStudioCode" & set "pkg_name=VS Code"
if "%~1"=="22" set "pkg_id=Docker.DockerDesktop" & set "pkg_name=Docker Desktop"
if "%~1"=="23" set "pkg_id=WiresharkFoundation.Wireshark" & set "pkg_name=Wireshark"

if "%~1"=="24" set "pkg_id=Canva.Canva" & set "pkg_name=Canva"
if "%~1"=="25" set "pkg_id=ONLYOFFICE.DesktopEditors" & set "pkg_name=ONLYOFFICE"
if "%~1"=="26" set "pkg_id=TheDocumentFoundation.LibreOffice" & set "pkg_name=LibreOffice"
if "%~1"=="27" set "pkg_id=Google.GoogleDrive" & set "pkg_name=Google Drive"
if "%~1"=="28" set "pkg_id=MITMediaLab.Scratch.3" & set "pkg_name=Scratch"

if "%~1"=="29" set "pkg_id=VideoLAN.VLC" & set "pkg_name=VLC Media Player"
if "%~1"=="30" set "pkg_id=OBSProject.OBSStudio" & set "pkg_name=OBS Studio"
if "%~1"=="31" set "pkg_id=BlackmagicDesign.DaVinciResolve" & set "pkg_name=DaVinci Resolve"
if "%~1"=="32" set "pkg_id=Inkscape.Inkscape" & set "pkg_name=Inkscape"
if "%~1"=="33" set "pkg_id=KDE.Krita" & set "pkg_name=Krita"
if "%~1"=="34" set "pkg_id=HandBrake.HandBrake" & set "pkg_name=HandBrake"
if "%~1"=="35" set "pkg_id=ByteDance.CapCut" & set "pkg_name=CapCut"

if "%~1"=="36" set "pkg_id=OpenAI.ChatGPT" & set "pkg_name=ChatGPT"
if "%~1"=="37" set "pkg_id=Microsoft.Teams" & set "pkg_name=Microsoft Teams"
if "%~1"=="38" set "pkg_id=Telegram.TelegramDesktop" & set "pkg_name=Telegram"
if "%~1"=="39" set "pkg_id=Mozilla.Thunderbird" & set "pkg_name=Thunderbird"
if "%~1"=="40" set "pkg_id=Zoom.Zoom" & set "pkg_name=Zoom"
if "%~1"=="41" set "pkg_id=Discord.Discord" & set "pkg_name=Discord"

if "%~1"=="42" set "pkg_id=Foxit.FoxitReader" & set "pkg_name=Foxit Reader"
if "%~1"=="43" set "pkg_id=SumatraPDF.SumatraPDF" & set "pkg_name=Sumatra PDF"

if "%~1"=="44" set "pkg_id=VMware.WorkstationPro" & set "pkg_name=VMware Workstation Pro"
if "%~1"=="45" set "pkg_id=Oracle.VirtualBox" & set "pkg_name=VirtualBox"
if "%~1"=="46" set "pkg_id=MANUAL" & set "pkg_name=LDPlayer" & set "pkg_url=https://www.ldplayer.net/"
if "%~1"=="47" set "pkg_id=MANUAL" & set "pkg_name=NoxPlayer" & set "pkg_url=https://www.bignox.com/"

if "%~1"=="48" set "pkg_id=Tencent.WeChat" & set "pkg_name=WeChat"
if "%~1"=="49" set "pkg_id=VNGCorp.Zalo" & set "pkg_name=Zalo"
goto :EOF


:: ==========================================
:: HAM CAI DAT PHAN MEM CHUNG (FUNCTION)
:: ==========================================
:INSTALL_PKG
echo.
echo [*] Dang xu ly %~2...
if /I "%~1"=="MANUAL" (
    echo [!] %~2 hien chua co goi chinh thuc tren Windows Package Manager ^(winget^).
    echo     Vui long tai va cai thu cong tai: %~3
    goto :EOF
)
start "Cai dat %~2" /wait cmd /c winget install --id %~1 --exact --silent --accept-package-agreements --accept-source-agreements
if errorlevel 1 (
    echo [!] Loi khi cai dat %~2 - co the da duoc cai truoc do hoac ID khong kha dung.
) else (
    echo [+] Cai dat %~2 thanh cong!
    call :CREATE_SHORTCUT "%~2"
)
goto :EOF

:: ==========================================
:: HAM TIM SHORTCUT TRONG START MENU VA COPY RA DESKTOP
:: ==========================================
:CREATE_SHORTCUT
setlocal
set "appname=%~1"
set "nospace=%appname: =%"
set "found="

for /f "delims=" %%F in ('dir /b /s /a:-d "%ProgramData%\Microsoft\Windows\Start Menu\Programs\*%appname%*.lnk" 2^>nul') do if not defined found set "found=%%F"
if not defined found for /f "delims=" %%F in ('dir /b /s /a:-d "%APPDATA%\Microsoft\Windows\Start Menu\Programs\*%appname%*.lnk" 2^>nul') do if not defined found set "found=%%F"
if not defined found for /f "delims=" %%F in ('dir /b /s /a:-d "%ProgramData%\Microsoft\Windows\Start Menu\Programs\*%nospace%*.lnk" 2^>nul') do if not defined found set "found=%%F"
if not defined found for /f "delims=" %%F in ('dir /b /s /a:-d "%APPDATA%\Microsoft\Windows\Start Menu\Programs\*%nospace%*.lnk" 2^>nul') do if not defined found set "found=%%F"

if defined found (
    copy /y "%found%" "%USERPROFILE%\Desktop\" >nul
    echo     -^> Da tao shortcut tren Desktop cho %appname%.
) else (
    echo     -^> Khong tim thay shortcut cho %appname% trong Start Menu ^(ung dung co the khong tao shortcut^).
)
endlocal
goto :EOF
