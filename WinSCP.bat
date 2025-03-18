@echo off

:: The creator
echo Made by DasHund007. Thanks for using it! Any support is available here: https://discord.gg/ZyRe42SR4C
echo.
:: Just a quick reminder
echo Automatic WinSCP Files Syncing.
echo (It will compare files to the selected drive and download the ones that aren't locally installed.)
echo.
echo.

:: Prompt the user for the sync direction
set /p direction="Please specify to where you want to sync (local, both, remote) (l, b, r): "

:: Set paths
set localFolder=C:\Users\kenan\Desktop\Trash
set serverFolder=/srv/data/Trash

:: Define SFTP command
set SFTP_COMMAND=open sftp://root:Kenan1904Vanessa.@192.168.1.209/ -hostkey=""ssh-ed25519 255 hESleWVXa68XFtuGd5cGljGYn2mqf1kVZtJV5ajifpg""

:: Check if direction is not empty
if /i not "%direction%"=="" (
    if /i "%direction%"=="l" (
        "C:\Program Files (x86)\WinSCP\WinSCP.com" /command ^
            "%SFTP_COMMAND%" ^
            "synchronize local -mirror ""%localFolder%"" ""%serverFolder%""" ^
            "exit"
    ) else if /i "%direction%"=="b" (
        "C:\Program Files (x86)\WinSCP\WinSCP.com" /command ^
            "%SFTP_COMMAND%" ^
            "synchronize both -mirror ""%localFolder%"" ""%serverFolder%""" ^
            "exit"
    ) else if /i "%direction%"=="r" (
        "C:\Program Files (x86)\WinSCP\WinSCP.com" /command ^
            "%SFTP_COMMAND%" ^
            "synchronize remote -mirror ""%localFolder%"" ""%serverFolder%""" ^
            "exit"
    ) else (
        echo You didn't specify the correct direction to send to!
        exit /b
    )
) else (
    echo No direction specified!
    exit /b
)
exit /b
